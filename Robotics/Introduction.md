
| Assignments | Final grade % | Description | Tools |
| ---- | ---- | ---- | ---- |
| velocity control | 12.5% |  |  |
| autonomous driving | 25% |  | Gazebo, Rviz, Python, Numpy, OpenCV |
| traffic sign recognition | 25% |  |  |
| system behavior | 25% | implement feedback on previous exercises |  |
| real world demonstration | 12.5% | adapt from simulation to real world noise and document that | Tensorflow, keras, OpenCV |

grading: 70% testing, 30% whole pipeline, tuning and/or reporting

Assignment 1: Design, implement and experiment a velocity control for a real unicycle mobile robot in 
- - -

Robot platform: 
	two encoders, camera, two motors to drive the wheels. It's powered with a USB power bank, 600 tics per one resolution. 
	Computers: Jetson Nano main board (has GPU, communicates over WiFi), ESP32 microcontroller (like an Arduino), lab PC
	Setup: plug in USB to battery, start communication program

Simulation environment: 
	robot is replica of real-life, yellow lines, black background for no interference color, traffic signs. We use [[Gazebo]], doesn't work sometimes but not much we can do, open-source. Physics simulator, ROS-compatible, simulated [[Gaussian noise]]

ROS :
	development standard for robotics, commonly used for prototyping but also used in industry, forms a communication infrastructure, large collection of libraries, allowed hardware abstraction, runs on many devices
	[[ROSCORE]] is the master node of ROS and will talk to every [[ROS node]] (piece of program). Programmes are supported in C++ and Python. Messages are used to communicate between programs, defined as data structure. 
		Publisher: program that sends out data of a given message type (data structure) to a subscriber under a given topic name 
		Subscriber: implements a [[Callback Function]] called when a message is received after subscribing to a publisher by giving topic name and message type

1. camera driver implements publisher

```Python
import rospy
from std_msgs import String

pub = rospy.Publisher('chatter', String, queue_size=10)
rospy.init_node('talker', anonymous=True)
rate = 
```
cannot have same topic, different data structure

Kinematics

| Kinematics | unit |  |
| ---- | ---- | ---- |
| Forward velocity | m/s | v |
| Rotational velocity | rad/s | $\omega$ |
| Left wheel velocity | rad/s | $\omega_l$ |
| Right wheel velocity | rad/s | $\omega_r$ |
encoders: if we have two of them, we can use the first one as a trigger and tell whether the wheel is going clockwise or counterclockwise. Since we know the tics per rotation that the motor can do, we can also calculate the desired velocity and measured velocity. 
Control of throttle command $u(t)$ signal you send to a motor indicating intensity, this may be different irl due to improper oiling, friction etc

PID control. 
	Controls system from 3 perspectives, 
	1. Proportional: error proportional to control
		low Kp slow reaction and oscillation, high quick reaction and oscillations. P control will introduce a steady state error, if $e(t)$ is a small number, $K_p e(t)$ will be small, hence almost no control signal.
	2. Integral. Small error will build up over time, making useless small e(t) into usable signal
	3. Derivative. We want to dampen the oscillation introduced by [[P-control]]. Derivative will be higher around $e(t)=0$ and we can modify w $K_d$
$$K_p e(t) + K_i \int_0^t e(\tau) + K_d \frac{d}{}$$
The best approach is PDI. The PID control system is often a matter of trial and error

Git: we'll have to use python 2.7 😦🤢

- - -
quotes: 
ben: how did u remember that?
marc: i got weirder stuff inside an url