import rospy 
from sensor_msgs.msg import Image 
from cv_bridge import CvBridge
import cv2
import numpy as np
from math import atan2
from geometry_msgs.msg import Twist

class LaneFollower(object):

  def __init__(self, forward_speed):
    self.forward_speed = forward_speed
    self.Kp = 0.008
    self.cv_bridge = CvBridge()
    rospy.on_shutdown(self.on_shutdown)

    cmd_topic = "/cmd_vel"
    image_topic = "/camera/image_raw"

    self.cmd_vel_publisher = rospy.Publisher(cmd_topic, Twist, queue_size=1)
    
    self.original_image = None
    self.cropped_shape = None
    self.hsv_upper_values = np.array([44,194,191])
    self.hsv_lower_values = np.array([4,61,55])
    pts1 = np.float32([[248, 800], [734, 451], [1418, 800], [884, 451]])
    pts2 = np.float32([[734, 800], [734, 0], [884, 800], [884, 0]])
    self.M_transform = cv2.getPerspectiveTransform(pts1,pts2)

    self.far_left_angle = 0
    self.left_angle = 0
    self.right_angle = 0
    self.far_right_angle = 0
    self.image_subscriber = rospy.Subscriber(image_topic, Image, self.image_callback, queue_size=1)

  def on_shutdown(self):
    twist_msg = Twist()
    self.cmd_vel_publisher.publish(twist_msg)
  
  @staticmethod
  def to_hsv(image):
    # Convert the BGR image to HSV 
    hsv_image = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
    return hsv_image
    
  @staticmethod
  def filter_hsv(hsv_image, lower_hsv, upper_hsv):
    # Filter out everything but the yellow line
    filtered_hsv_image = cv2.inRange(hsv_image, lower_hsv, upper_hsv)
    return filtered_hsv_image
    
  
  def warp_perspective(self, image):
    height, width, _ = image.shape
    warped_image = cv2.warpPerspective(image, self.M_transform, (width, height)) 
    cropped_image = warped_image[500:800, 500:1100] # DO NOT CHANGE 
    return cropped_image

  def is_one_quadrant(self, line):
    # if intersects with the middle line or 1/4 or 3/4 of the image
    x1, y1, x2, y2 = line
    if x1 <= (self.cropped_shape[1] / 4) and x2 <= (self.cropped_shape[1] / 4):
      return True
    elif x1 <= (self.cropped_shape[1] / 2) and x2 <= (self.cropped_shape[1] / 2) and x1 >= (self.cropped_shape[1] / 4) and x2 >= (self.cropped_shape[1] / 4):
      return True
    elif x1 <= (self.cropped_shape[1] / 4 * 3) and x2 <= (self.cropped_shape[1] / 4 * 3) and x1 >= (self.cropped_shape[1] / 2) and x2 >= (self.cropped_shape[1] / 2):
      return True
    elif x1 <= (self.cropped_shape[1]) and x2 <= (self.cropped_shape[1]) and x1 >= (self.cropped_shape[1] / 4 * 3) and x2 >= (self.cropped_shape[1] / 4 * 3):
      return True
    else:
      print("line is not in one quadrant", line, self.cropped_shape[1]/ 4, self.cropped_shape[1]/ 2, self.cropped_shape[1]/ 4 * 3, self.cropped_shape[1])
      return False
    
  def cut_line(self, line):
    # if intersects with the middle line or 1/4 or 3/4 of the image
    # then cut the line in the respective quadrant
    x1, y1, x2, y2 = line
    array = [[x1, y1, x2, y2]]
    # calculate the intersection point between the line and the middle line
    center_line = [self.cropped_shape[1] / 2, 0, self.cropped_shape[1] / 2, self.cropped_shape[0]]
    first_third = [self.cropped_shape[1] / 4, 0, self.cropped_shape[1] / 4, self.cropped_shape[0]]
    second_third = [self.cropped_shape[1] / 4 * 3, 0, self.cropped_shape[1] / 4 * 3, self.cropped_shape[0]]

    print("got to the start of cut_line")
    # calculate the intersection point between the line and the middle line
    for boundary_line in [first_third, center_line, second_third]:
      x3, y3, x4, y4 = boundary_line
      divisor = (x1-x2)*(y3-y4)-(y1-y2)*(x3-x4)
      if divisor == 0:
        px, py = None, None
      else:
        px= ( (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4) ) / divisor 
        py= ( (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4) ) / divisor
      if px != None and py != None and (px > 0 and px < self.cropped_shape[1]) and (py > 0 and py < self.cropped_shape[0]):
        if px > x1: # line is going from left to right
          array.append([px, py, x2, y2]) # append section to the left of the intersection
          line = [x1, y1, px, py] # cut the line
          x1, y1, x2, y2 = line
        else: # line is going from right to left
          array.append([x1, y1, px, py]) # append section to the left of the intersection
          line = [px, py, x2, y2] # cut the line
          x1, y1, x2, y2 = line
    array.append(line)
    print("got to the end of cut_line")
    return array

  def update_max(self, x, y, max_x, max_y):
    if y > max_y:
      return x, y
    return max_x, max_y

  def update_min(self, x, y, min_x, min_y):
    if y < min_y:
      return x, y
    return min_x, min_y


  def get_lines(self, binary_mask, warped_image):
    delta_radius = 1
    delta_theta = np.pi / 180
    vote_threshold = 155
    lines = cv2.HoughLinesP(binary_mask, delta_radius, delta_theta, vote_threshold)
    if lines is None:
      return [], [], [], []
    list_of_lines = []
    for line in lines:
      x1, y1, x2, y2 = line[0]
      x1, y1, x2, y2 = int(x1), int(y1), int(x2), int(y2)
      list_of_lines.append([x1, y1, x2, y2])

    #print("list_of_lines", list_of_lines)
    #pass
    print("after line reformatting")
    far_left = []
    left = []
    right = []
    far_right = []

    
    for line in list_of_lines:
      # assign each line to the correct quadrant, each quadrant has 25% of the horizontal space
      #print(self.cropped_shape)
      horizontal_center = self.cropped_shape[1] / 2
      #print("horizontal_center", horizontal_center)
      #print("\n x1: ", x1)
      if not self.is_one_quadrant(line):
        pass
        array = self.cut_line(line)
        line = array[0]
        for i in range(1, len(array)):
          list_of_lines.append(array[i])


      print("after line sectioning")
      x1, y1, x2, y2 = line
      if x1 < (horizontal_center / 2) and x2 < (horizontal_center / 2):
        far_left.append(line)
        
      elif x1 < horizontal_center and x2 < horizontal_center:
        left.append(line)
      elif x1 < (horizontal_center * 1.5) and x2 < (horizontal_center * 1.5):
        right.append(line)
      
      elif x1 < (horizontal_center * 2) and x2 < (horizontal_center * 2):
        far_right.append(line)
        self.draw_line(warped_image, [x1, y1, x2, y2])

          
    self.show_image("hough lines", warped_image)
      # print("list_of_lines", list_of_lines)
      # otherwise, quadrant none

    print("far_left", far_left)
    print("left", left)
    print("right", right)
    print("far_right", far_right)
    best_far_left = []
    best_left = []
    best_right = []
    best_far_right = []

    if len(far_left) != 0:
      best_x1, best_y1, best_x2, best_y2 = 0,5000, 0,0
      for line in far_left:
        x1, y1, x2, y2 = line
        best_x1, best_y1 = self.update_min(x1, y1, best_x1, best_y1)
        best_x2, best_y2 = self.update_max(x2, y2, best_x2, best_y2)
      best_far_left = [best_x1, best_y1, best_x2, best_y2]
    if len(left) != 0:
      best_x1, best_y1, best_x2, best_y2 = 0,5000, 0,0
      for line in left:
        x1, y1, x2, y2 = line
        best_x1, best_y1 = self.update_min(x1, y1, best_x1, best_y1)
        best_x2, best_y2 = self.update_max(x2, y2, best_x2, best_y2)
      best_left = [best_x1, best_y1, best_x2, best_y2]
    if len(right) != 0:
      best_x1, best_y1, best_x2, best_y2 = 0,5000, 0,0
      for line in right:
        x1, y1, x2, y2 = line
        best_x1, best_y1 = self.update_min(x1, y1, best_x1, best_y1)
        best_x2, best_y2 = self.update_max(x2, y2, best_x2, best_y2)
      best_right = [best_x1, best_y1, best_x2, best_y2]
    if len(far_right) != 0:
      best_x1, best_y1, best_x2, best_y2 = 0,5000, 0,0
      for line in far_right:
        x1, y1, x2, y2 = line
        best_x1, best_y1 = self.update_min(x1, y1, best_x1, best_y1)
        best_x2, best_y2 = self.update_max(x2, y2, best_x2, best_y2)
      best_far_right = [best_x1, best_y1, best_x2, best_y2]
    print("best_far_left", best_far_left)
    print("best_left", best_left)
    print("best_right", best_right)
    print("best_far_right", best_far_right)
    return best_far_left, best_left, best_right, best_far_right
  
  def get_angles(self, far_left, left, right, far_right):
    # Determine the angle for list of lines
    self.far_left_angle = 0
    self.left_angle = 0
    self.right_angle = 0
    self.far_right_angle = 0
    # Store the angles in the class variables self.far_left_angle, self.left_angle, self.right_angle, self.far_right_angle
    if len(far_right) != 0:
      x1, y1, x2, y2 = far_right
      deltaX = x2 - x1
      deltaY = y2 - y1
      self.far_right_angle = atan2(deltaY, deltaX)
    if len(right) != 0:
      x1, y1, x2, y2 = right
      deltaX = x2 - x1
      deltaY = y2 - y1
      self.right_angle = atan2(deltaY, deltaX)
    if len(left) != 0:
      x1, y1, x2, y2 = left
      deltaX = x2 - x1
      deltaY = y2 - y1
      self.left_angle = atan2(deltaY, deltaX)
    if len(far_left) != 0:
      x1, y1, x2, y2 = far_left
      deltaX = x2 - x1
      deltaY = y2 - y1
      self.far_left_angle = atan2(deltaY, deltaX)



  def send_velocity(self, omega): 
    # Create a Twist message
    msg = Twist()
    omega = max(-0.5, min(0.5, omega)) # Limit the rotational velocity to (-)0.5 rad/s
    print("omega", omega)
    # Limit the rotational velocity to (-)0.5 rad/s, this will help with switching lanes
    # For the forward velocity use the self.forward_velocity variable
    msg.linear.x = self.forward_speed
    msg.angular.z = omega
    # use the self.cmd_vel_publisher to publish the velocity
    self.cmd_vel_publisher.publish(msg)
    

  def draw_line(self, image, line):
    if line is not None:
      x1, y1, x2, y2 = line
      # make numbers integers
      x1, y1, x2, y2 = int(x1), int(y1), int(x2), int(y2)
      cv2.line(image, (x1, y1), (x2, y2), (0, 0, 255), 2)
      
  def show_image(self, name, image):
    cv2.imshow(name, image)
    key = cv2.waitKey(1) & 0xFF

    if key == ord('q'): # Pressing 'q' will shutdown the program
      rospy.signal_shutdown("exit")
    if key == ord('s'): # Pressing 's' will save the image
      cv2.imwrite("lane_follower_image.png", image)

  def calculate_center(self, left, right):
    # make a line that goes forward
    forward = [0, 0, 0, 0]
    x1, y1, x2, y2 = left
    x3, y3, x4, y4 = right
    # shift it by angle average
    angle = (self.left_angle + self.right_angle) / 2
    center_x = np.cos(angle) * 1000 + (x1 + x2 + x3 + x4) /4 
    center_y = np.sin(angle) * 1000 + (y1 + y2 + y3 + y4) /4
    return center_x, center_y

  # Image callback function, gets called at 10Hz 
  def image_callback(self, image_msg):
    # Convert the sensor_msgs Image to OpenCv image
    # An OpenCV image has the color channels in order BGR (instead of the more common RGB)
    image = self.cv_bridge.imgmsg_to_cv2(image_msg, "bgr8") 
    # image is now an OpenCV image

    # store the image, such that it can be used for sign recognition later on.
    self.original_image = image.copy()

    # self.show_image("original", image)
    # Warp and crop the image
    warped_image = self.warp_perspective(image) # cropping is done in this function

    self.show_image("warped", warped_image)

    # Convert and filter HSV (use the calibrator to find correct HSV filter values)
    hsv_image = self.to_hsv(warped_image)
    self.show_image("hsv", hsv_image)
    self.cropped_shape = hsv_image.shape
    filtered_hsv_image = self.filter_hsv(hsv_image, self.hsv_lower_values, self.hsv_upper_values)

    self.show_image("filtered_hsv", filtered_hsv_image)

    print("before getlines")
    # Get lists of all for lines
    far_left, left, right, far_right = self.get_lines(filtered_hsv_image, warped_image)
    #print("far_left", far_left)
    #print("left", left)
    #print("right", right)
    #print("far_right", far_right)
    print("after getlines")

    for line in [far_left, left, right, far_right]:
      if len(line) != 0:
        self.draw_line(warped_image, line)
    size = self.cropped_shape[1]
    height = self.cropped_shape[0]
    self.draw_line(warped_image, [size/4, 0, size/4, height])
    self.draw_line(warped_image, [size/2, 0, size/2, height])
    self.draw_line(warped_image, [size/4*3, 0, size/4*3, height])

    #quadrant_line_left_far_left = self.cropped_image/4, self.cropped_image/2, 0, y
    #self.draw_line(filtered_hsv_image, )

    self.show_image("lines", warped_image)

    # Determine the angles of each line
    self.get_angles(far_left, left, right, far_right)
    #print("far_left angles", self.far_left_angle)
    #print("left angles", self.left_angle)
    #print("right angles", self.right_angle)
    #print("far_right angles", self.far_right_angle)

    # Determine the error for the P controller. This error should depend on which lane you want to follow.
    # error between image center and lane center
    error = 0
    center_x = 0
    center_y = 0
    # get average rigth and left line and calculate center line
    constant = 10

    if len(right) != 0 and len(far_right) != 0:
      print("Switched to right lane!")
      center_x, center_y = self.calculate_center(right, far_right)

    elif len(right) != 0 and len(left) != 0:
      center_x, center_y = self.calculate_center(left, right)

    else:
      print("Switched to left lane!")
      center_x, center_y = self.calculate_center(left, far_left)
   
    print("center_x, center_y", (center_x, center_y))  
    error = ((center_x - (filtered_hsv_image.shape[1] / 2)) + (center_y - (filtered_hsv_image.shape[0] / 2))) / 2
    print("error", error)
    

    # Determine the rotational velocity
    omega = self.forward_speed * self.Kp * error

    # Send velocity
    # self.send_velocity(omega)


   