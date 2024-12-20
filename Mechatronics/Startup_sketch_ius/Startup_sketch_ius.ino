/*
      File: Startup_sketch.ino

      Sketch for the Rover-5 hardware rev. 1.1/1.2

      Copyright: University of Groningen/DTPA-2021

      Software rev. 1.2    Date: 05-12-2022

      rev. 1.1 : added initializer for loopTimer in setup().
      rev. 1.2 : minor textual changes.
      

      YOUR ROBOT ID: __


      - When connected to the computer, place the robot on the wooden support block. DO NOT BUMP THE IR SENSOR.

      - Turn on the robot before connecting it to the USB port.

      - If the robot permanently produces audible beeps, please turn off the robot because of empty batteries.

      - The LED on the Arduino board should flash regularly as a check for proper program operation (For the amber color LED, look beside the USB connector).

      - The velocity unit is in encoder units. More info about this can be found in the Rover5lib source files.

      The loop function contains a simple command interpreter. From the Arduino monitor panel, you can press keys for different operations.
      You could add single character commands yourself for the purpose of debugging. The existing commands are:

      'e'	enable the motor driver
 	    'd'	disable the motor driver
       
      'o'	switch to open loop mode
      'c' switch to closed loop PID velocity control
      'l' switch to the line follower mode
      
      'p'	toggle print velocity function on/off (Can be used with the Arduino plotter window.)
      
      'u'	read the sonar ping time

      'n'	store the line follower sensor calibration data for black
      'm'	store the line follower sensor calibration data for the background color

      't' sound the buzzer for 1s.

      'q'	decrease P-gains L+R wheels
      'w'	increase P-gains L+R wheels
      'a' decrease I-gains L+R wheels
      's' increase I-gains L+R wheels
      'z' decrease D-gains L+R wheels
      'x' increase D-gains L+R wheels

      '1'	decrease velocity set point left wheels (or throttle in open loop mode)
      '2' increase velocity set point left wheels (or throttle in open loop mode)
      '3' decrease velocity set point right wheels (or throttle in open loop mode)
      '4' increase velocity set point right wheels (or throttle in open loop mode)
      
      'i' invert the set point (forward/reverse). Use this to apply a step function.

      'b'  check the battery cell voltages in mV's

      The step response can be plotted with the Arduino plotter as follows: compile for silent mode (read below). Command consecutively from the plotter input line: c, e, p and toggle with i.
*/

#include <Rover5lib.h>
#include <PID_v1.h>

#define DEBUG                            // <== COMMENT OUT THIS LINE WITH '//' FOR SILENT MODE. Use silent mode with the Arduino plotter (outputs data only).
#define BATT_MGMT 1	//Enable battery management.
#define OPEN_LOOP 0
#define CLOSED_LOOP 1

#ifdef DEBUG
  #define DEBUG_PRINTLN(x) Serial.println (x)
  #define DEBUG_PRINT(x) Serial.print (x)
#else
  #define DEBUG_PRINTLN(x)
  #define DEBUG_PRINT(x)
#endif

// loop timing parameters
#define LOOP_TIME 50000 // loop time in us (=20Hz)
int HZ = LOOP_TIME / 1000; // sample time period in ms
unsigned long loopTimer;

/* * * * user defined variables * * * */
char rc; // received char
bool mode = OPEN_LOOP;
bool prnEncs = false;
bool lineFollower = false; // It is possible to start the line follower from a cold start. Do not forget to enable the motors and the closed loop control first.

// L+R Wheel speed PID controllers
double Kp = 1.1;                            // <== APPLY YOUR PID GAINS HERE.
double Ki = 25;
double Kd = 0.0;

double throttleMotorLeft; // output of the PID's
double throttleMotorRight;
double setVelLeft = 10.0; // PID set points
double setVelRight = 10.0;
double deltaPosLeft; // encoder increments (velocity feedback)
double deltaPosRight;

// line follow alias IR1 - IR6
#define IR1 A0
#define IR2 A1
#define IR3 A2
#define IR4 A3
#define IR5 A4
#define IR6 A5	// Not used with 5 IR Waveshare line follow sensor

// Sensor values for black.
int irBlack1 = 795; // Put the found values here for one time calibration.
int irBlack2 = 843;
int irBlack3 = 825;
int irBlack4 = 824;
int irBlack5 = 802;
int irBlack6 = 847; // Not used with 5 IR Waveshare sensor.
// Sensor values for background.
int irBckgrd1 = 54;
int irBckgrd2 = 92;
int irBckgrd3 = 64;
int irBckgrd4 = 58;
int irBckgrd5 = 114;
int irBckgrd6 = 83;  // Not used with 5 IR Waveshare sensor.
long y1, y2, y3, y4, y5, y6; // Used to store the normalized IR-sensor data.

int setVcomm = 5; //common wheel velocity.
int setVdiff = 0; //differential wheel velocity. Use to steer.

// Create instances of class PID.
PID pidLeftWheels(&deltaPosLeft, &throttleMotorLeft, &setVelLeft, Kp, Ki, Kd, DIRECT);
PID pidRightWheels(&deltaPosRight, &throttleMotorRight, &setVelRight, Kp, Ki, Kd, DIRECT);



/* * * The setup function is called once at startup of the sketch * * */
void setup() {
  Serial.begin(115200); // Open serial port. Notice the Baud rate for the terminal or plotter window!
  pinMode(PIN_LED, OUTPUT); // LED PIN as output.
  pinMode(IR1, INPUT); // Set IR PIN's as input.
  pinMode(IR2, INPUT);
  pinMode(IR3, INPUT);
  pinMode(IR4, INPUT);
  pinMode(IR5, INPUT);
  pinMode(IR6, INPUT);

  // Init wheel velocity PID's
  pidLeftWheels.SetMode(AUTOMATIC);
  pidLeftWheels.SetSampleTime(HZ);
  pidLeftWheels.SetOutputLimits(-MOTOR_PWM_LIM, MOTOR_PWM_LIM);

  pidRightWheels.SetMode(AUTOMATIC);
  pidRightWheels.SetSampleTime(HZ);
  pidRightWheels.SetOutputLimits(-MOTOR_PWM_LIM, MOTOR_PWM_LIM);

  Rover.begin(BATT_MGMT); //init robot
  Rover.triggerSonar(); //first time trigger

  loopTimer = micros() + LOOP_TIME; // Set the loopTimer variable for the next loop-end time.
}




/* * * The loop function is called in an endless loop * * */
void loop() {
  Rover.readEncoders();
  deltaPosLeft = (double)Rover.encDeltaStep[0];
  deltaPosRight = (double)Rover.encDeltaStep[1];

  if (prnEncs) {
    //Serial.print(Rover.encPos[0]);
    //Serial.print("\t");
    //Serial.print(Rover.encPos[1]);
    //Serial.print("\t");
    Serial.print(deltaPosLeft); // Print wheel velocity in encoder units.
    Serial.print("\t");
    Serial.println(deltaPosRight);
  }

  if (mode == CLOSED_LOOP) {
    pidLeftWheels.Compute();
    pidRightWheels.Compute();
    Rover.motorsWrite( (int)round(throttleMotorLeft), (int)round(throttleMotorRight) );
  }
  else { //open loop
    Rover.motorsWrite(setVelLeft, setVelRight); //Direct write the set point value to the motors.
  }

  
  //===================== Line following logic implemented by students ============================ //
  /*
   * Line-following logic focuses on adjusting the target velocities (left and right) based on the line's position.
   * This means the logic is purely proportional so we only need Kp to compute the differential velocity based on the 
   * calculated error.
   * 
   * So line-following is about responding to deviations from line (which proportional controll should suffice)
   * 
   * But if we want less osciallating behaviour throughout the process we can introduce Ki. However, there are still some
   * considerations to be taken into account.
   * 
   * Integral Windup Risk (Ki):
   * If the robot gets far off track, the accumulated integral term can grow too large ("windup"), 
   * leading to overcorrection once it re-detects the line.
   * 
   * Slower Response to Big Errors: 
   * The integral term takes time to accumulate, so if the robot veers far off the line, the correction 
   * might be slower compared to pure P control.
   */

  // Add a variable to store the integral of the error
  //double integralError = 0.0;  // Accumulated error
  // so basically dt is going to be 0.05 seconds
  // if dt isn't accounted for, the integral term would grow inconsistently --> unpredictable (and incorrect) corrections
  //double dt = LOOP_TIME / 1000000.0;  // Time interval in seconds (convert microseconds to seconds so we can use it for integral term)
  

  if (lineFollower) {

    #ifdef DEBUG
      Serial.println("Line Follower Mode Enabled - Debugging Active");
    #endif
    
    /*
    the function map() doesn't really limit values, it just scales given values, so we could still have values below 0 and above 1000.
    This is because if we have for example if analogRead(IR1) returns something higher than irBlack1, then we'll have a value outside the range.
    For example when we were holding the robot in our hand and because it couldn't really detect something, we were seeing negative values.
    
    Hence, why we also use contrain() here, to make sure the values are actually locked between 0 and 1000 (so as a safeguard)
    */

    // Normalize and constrain sensor values
    y1 = constrain(map(analogRead(IR1), irBlack1, irBckgrd1, 0, 1000), 0, 1000); //scale the sensor working range between 0 and 1000.
    Serial.print(y1);
    Serial.print("\t");
    
    y2 = constrain(map(analogRead(IR2), irBlack2, irBckgrd2, 0, 1000), 0, 1000);
    Serial.print(y2);
    Serial.print("\t");
    
    y3 = constrain(map(analogRead(IR3), irBlack3, irBckgrd3, 0, 1000), 0, 1000);
    Serial.print(y3);
    Serial.print("\t");
    
    y4 = constrain(map(analogRead(IR4), irBlack4, irBckgrd4, 0, 1000), 0, 1000);
    Serial.print(y4);
    Serial.print("\t");
    
    y5 = constrain(map(analogRead(IR5), irBlack5, irBckgrd5, 0, 1000), 0, 1000);
    Serial.print(y5);
    Serial.print("\t");
    
    //so I guess given their comments I'm just not gonna include this y6 in any of my calculations and it gonna irrelevant data then.
    //hence why commented
    y6 = constrain(map(analogRead(IR6), irBlack6, irBckgrd6, 0, 1000), 0, 1000); //Do not use IR6 with the blue Waveshare sensor.
    Serial.println(y6);

    #ifdef DEBUG
      Serial.print("Sensor Values: ");
      Serial.print("y1="); Serial.print(y1); Serial.print(", ");
      Serial.print("y2="); Serial.print(y2); Serial.print(", ");
      Serial.print("y3="); Serial.print(y3); Serial.print(", ");
      Serial.print("y4="); Serial.print(y4); Serial.print(", ");
      Serial.print("y5="); Serial.print(y5); Serial.print(", ");
      Serial.print("y6="); Serial.println(y6);
    #endif

    // Weighted average for line position
    // We can first try with y6 and see otherwise do without
    long position = (-2.5 * y1 + -1.5 * y2 + -0.5 * y3 + 0.5 * y4 + 1.5 * y5 + 2.5 * y6);
    long total = y1 + y2 + y3 + y4 + y5 + y6;

    // check division by zero
    if (total != 0) {
    position = position / total;
    } else {
        position = 0;
    }

    #ifdef DEBUG
      Serial.print("Position (Weighted Average): "); Serial.println(position);
    #endif

    /* Calculate proportional error (desired center is 0). Hence why we don't mention desired - position
     *  Position < 0 means the line is to the left
     *  Position > 0 means the line is to the right
    */
    double error = position;

    // Update and limit the integral error (accumulate error over time)
    //integralError = constrain(integralError + (error * dt), -50, 50); //change the -50/50 based on live behaviour
    #ifdef DEBUG
      // Serial.print("Integral Error: "); Serial.println(integralError);  // Uncomment if Ki is enabled
    #endif

    // Calculate & Limit differential velocity (which initally is set to default)
    //setVdiff = constrain(Kp * error + Ki * integralError, -30, 30);
    setVdiff = constrain(Kp * error, -30, 30);

    #ifdef DEBUG
      Serial.print("Differential Velocity (setVdiff): "); Serial.println(setVdiff);
    #endif

    // Adjust & Limit wheel velocities
    setVelLeft = constrain(setVcomm - setVdiff, -30, 30); //change values based on the robot's behaviour
    setVelRight = constrain(setVcomm + setVdiff, -30, 30);

    #ifdef DEBUG
      Serial.print("Wheel Velocities: ");
      Serial.print("Left="); Serial.print(setVelLeft);
      Serial.print(", Right="); Serial.println(setVelRight);
    #endif

    //this line already exists in the if above which is used for when the system is open loop
    //Rover.motorsWrite(setVelLeft, setVelRight);
  }

  // ===================== End of students' implementation ====================================



  // Command interpreter starts from here
  if (Serial.available()) {
    rc = Serial.read();

    if (rc == 't') {
      Rover.buzz(); // Call this function to generate an audible signal.
    }

    if (rc == 'o') {
      mode = OPEN_LOOP;
      DEBUG_PRINTLN("Open loop test. Write the throttle value, set with keys 1,2,3 and 4.");
    }

    if (rc == 'c') {
      mode = CLOSED_LOOP;
      DEBUG_PRINTLN("Closed loop PID control. Write the velocity set point value, set with keys 1,2,3 and 4.");
    }

    if (rc == 'p') {
      if (prnEncs) {
        prnEncs = false;
        DEBUG_PRINTLN("Print encoder data off.");
      }
      else {
        prnEncs = true;
        DEBUG_PRINTLN("Print encoder data on.");
      }
    }

    if (rc == 'b') {
      Serial.println("Battery cell voltages in mV's: ");
      Serial.print(Rover.vCell[0]);
      Serial.print("\t");
      Serial.print(Rover.vCell[1]);
      Serial.print("\t");
      Serial.println(Rover.vCell[2]);
    }

    if (rc == 'e') {
      DEBUG_PRINTLN("enable motors");
      Rover.motorsStart();
    }

    if (rc == 'd') {
      DEBUG_PRINTLN("disable motors");
      Rover.powerSwitch(1, false);
      Rover.motorsStop();
    }

    if (rc == 'w') { // If needed, reuse the q,w,a,s,z,x keys to tune an additional PID controller. (use different gain variables!)
      Kp += 0.2;
      pidLeftWheels.SetTunings(Kp, Ki, Kd);
      pidRightWheels.SetTunings(Kp, Ki, Kd);
      DEBUG_PRINT("Kp = ");
      DEBUG_PRINTLN(Kp);
    }

    if (rc == 'q') {
      Kp -= 0.2;
      pidLeftWheels.SetTunings(Kp, Ki, Kd);
      pidRightWheels.SetTunings(Kp, Ki, Kd);
      DEBUG_PRINT("Kp = ");
      DEBUG_PRINTLN(Kp);
    }

    if (rc == 's') {
      Ki += 0.5;
      pidLeftWheels.SetTunings(Kp, Ki, Kd);
      pidRightWheels.SetTunings(Kp, Ki, Kd);
      DEBUG_PRINT("Ki = ");
      DEBUG_PRINTLN(Ki);
    }

    if (rc == 'a') {
      Ki -= 0.5;
      pidLeftWheels.SetTunings(Kp, Ki, Kd);
      pidRightWheels.SetTunings(Kp, Ki, Kd);
      DEBUG_PRINT("Ki = ");
      DEBUG_PRINTLN(Ki);
    }

    if (rc == 'x') {
      Kd += 0.02;
      pidLeftWheels.SetTunings(Kp, Ki, Kd);
      pidRightWheels.SetTunings(Kp, Ki, Kd);
      DEBUG_PRINT("Kd = ");
      DEBUG_PRINTLN(Kd);
    }

    if (rc == 'z') {
      Kd -= 0.02;
      pidLeftWheels.SetTunings(Kp, Ki, Kd);
      pidRightWheels.SetTunings(Kp, Ki, Kd);
      DEBUG_PRINT("Kd = ");
      DEBUG_PRINTLN(Kd);
    }

    if (rc == '1') {
      setVelLeft -= 1.0;
      setVelLeft = constrain(setVelLeft, -30, 30);
      DEBUG_PRINT("New velocity left wheel: ");
      DEBUG_PRINTLN(setVelLeft);
    }

    if (rc == '2') {
      setVelLeft += 1.0;
      setVelLeft = constrain(setVelLeft, -30, 30);
      DEBUG_PRINT("New velocity left wheel: ");
      DEBUG_PRINTLN(setVelLeft);
    }

    if (rc == '3') {
      setVelRight -= 1.0;
      setVelRight = constrain(setVelRight, -30, 30);
      DEBUG_PRINT("New velocity right wheel: ");
      DEBUG_PRINTLN(setVelRight);
    }

    if (rc == '4') {
      setVelRight += 1.0;
      setVelRight = constrain(setVelRight, -30, 30);
      DEBUG_PRINT("New velocity right wheel: ");
      DEBUG_PRINTLN(setVelRight);
    }

    if (rc == 'i') {
      setVelLeft = -setVelLeft; // Swap sign of set point.
      setVelRight = -setVelRight;
      DEBUG_PRINTLN("Direction inverted!");
    }

    if (rc == 'u') {
      Serial.print("Sonar ping in us: ");
      Rover.readSonar();
      Serial.println(Rover.sonarPing);
      Rover.triggerSonar(); // Trigger the Sonar for the next round.
    }

    if (rc == 'l') {
      if (lineFollower) {
        lineFollower = false;
        DEBUG_PRINTLN("Line follower off.");
      }
      else {
        lineFollower = true;
        DEBUG_PRINTLN("Line follower on.");
      }
    }

    if (rc == 'n') {
      Serial.println("Calibrate line follow IR's - black");
      irBlack1 = analogRead(IR1);
      Serial.print(irBlack1);
      Serial.print("\t");
      irBlack2 = analogRead(IR2);
      Serial.print(irBlack2);
      Serial.print("\t");
      irBlack3 = analogRead(IR3);
      Serial.print(irBlack3);
      Serial.print("\t");
      irBlack4 = analogRead(IR4);
      Serial.print(irBlack4);
      Serial.print("\t");
      irBlack5 = analogRead(IR5);
      Serial.print(irBlack5);
      Serial.print("\t");
      irBlack6 = analogRead(IR6);
      Serial.println(irBlack6);
    }

    if (rc == 'm') {
      Serial.println("Calibrate line follow IR's - background");
      irBckgrd1 = analogRead(IR1);
      Serial.print(irBckgrd1);
      Serial.print("\t");
      irBckgrd2 = analogRead(IR2);
      Serial.print(irBckgrd2);
      Serial.print("\t");
      irBckgrd3 = analogRead(IR3);
      Serial.print(irBckgrd3);
      Serial.print("\t");
      irBckgrd4 = analogRead(IR4);
      Serial.print(irBckgrd4);
      Serial.print("\t");
      irBckgrd5 = analogRead(IR5);
      Serial.print(irBckgrd5);
      Serial.print("\t");
      irBckgrd6 = analogRead(IR6);
      Serial.println(irBckgrd6);
    }
  }



  // Do the housekeeping
  Rover.update(); //Perform cyclic tasks on the robot. Do not remove.

  // Wait for the remaining time in the loop and set the new loop-end time.
  while (loopTimer > micros()) {
    ;
  }
  loopTimer += LOOP_TIME;
}
