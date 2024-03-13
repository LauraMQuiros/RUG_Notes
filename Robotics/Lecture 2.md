[[Hough Transformation]]: 
parameter space sweep will result in two sets of parameters that correspond to the two lines, you get an R, \theta_R
use `cv2.HoughLinesP()` bc is a probability alternative that is better. Big bunch of 'em, filter them logically too.

[[Lane angle calculation]]: 
 we use `atan2` for angle calculations where all domain checks are incorporated

