Georgios - robotics engineer + last year experience
Joel - Autoware
Remco - Hardware
Jorrit - autonomous bus project

- - -
## COLOMBUSS project
Increase capacity of public transport with a free of charge autopilot
Level 5 - no driver 
So far, small buses and trucks

Alternative final vehicle multipurpose one instead of Tweezy 
	possible incompatibility / calibration testing need
	has a middle part removable (garbage/drone carry)
	microbus

They use existing vehicles and engage an autopilot
No road approved, testing missing in real life comparison with real drivers
	C# too high for road approve, has to be C++
	off-the-shelf, cost-effective, redundant hardware (necessary for road-ready)
open source kit of autonomous driving
taxi B license
Assessment system (ask joel architecture)
How the predictions on likeability and distance to crash works is unknown by the present members of robotTUNER
There is history of emergent behavior in Autoware

Perception: 
1. localisation - Xsens Vision Navigator, Movella (sensor fusion so it can still drive despite flakey connection with GPS, 1/2 cm accurately) installed in remote twizy
2. lidar to be implemented 12m, 360, higher distance is useless in poor weather
3. Binocular stereo camera 2i ZED still mounted and for image processing
	Latency issues, though good. Point-cloud created.
4. ARS540 Radar Sensor, has interpretation (object info, speed an orientation) while in the radar. Gets a lot of false positives. 120 degrees, 30 degrees for further away in the front.

## Autoware, Hardware and Software
2 pieces : both uses PID in need of tuning
1. low level control raspberry pi used for motor controller communication, steering and breaking
2. navigation stack, traditional: larger PC, desktop, logic recognition, path-planning, visualisation, remote access available. We need to set up communication between this PC (which is mounted inside twizy) and whatever we are using, GPU available for image processing.

Autoware: ROS2 nodes, C++ mainly. There is plenty of online material. No specific tutorial, just told us to use documentation and given resources.
	There is no simulated sensor stack that is accurate to the model, but it is claimed that the simulated sensor has sufficient (?) overlap. We can reuse the topic to put out equivalent sensor input when doing the real-life experiment instead of simulated values that we get in simulation.

Open maps to lattice of the track is code available. 

How to map the track?
	All 3d is not needed, bc positioning and orientation from radar is good
	SLAM is not necessary
	Fusion IMU, GNSS, 2 antenna to infer heading, visual inertial odometry for lost GNSS
	ICP tracking detection
	We can generate the lane by running and making 1m or so. Worse in the curves. Correct map while you drive to reduce error. Manual map is trivial to make, though we could use camera point cloud to perfect the map

## RobotTUNER goals + discussion
3. learning sharing: work together on project, cooperate
4. win
5. restriction handling: use of autoware is in benefit of the company
6. make use of the team for research into user experience of the multipurpose car or twizy

new requirement: emergency remote system (mechanical/electrical/control feature not implemented)

The MBO noorderport students will work in parallel taking apart and rebuilding the multipurpose vehicle (mentioned in COLUMBUSS project section) in order to be able to fit this challenge into their educational curriculum. This work will have a different workflow to the software team. 

Saeed suggests to start with autoware as our main software and later include our own features to be able to complete each of the tasks in the challenge. 

Line detection algorithms are possible to be implemented with radar + camera. Dynamical detection might be best to avoid map hardcoding.

When scheduling, we must remember that testing takes time. 
We're not allowed to test it in public road, jorritt may drive it around in private areas though. Depending on whether insurance is possible, students may get an internship position so they can be insured and drive.

WED 5-6PM WEEKLY MEETING

Questions: 
1. Which car do we have? 
	MBO students get multipurpose car and will take it apart and rebuild. We get what? The twizy right? 
2. Are courses to do autoware available ? 

Action points: 
- [x] autoware drive folder (laura)
- [ ] whatsapp community (ewout)
- [ ] slack with robotTUNER (laura)
- [ ] look up courses for autoware
- [ ] all students - look into autoware
- [ ] leaders - make more specific role descriptions updated with new information