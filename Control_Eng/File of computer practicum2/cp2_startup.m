%% Start-up file Computerpracticum 2
% Author: Ewoud Vos

clear
clc

%% Exercise 1: Transfer functions DC motor
%Parameters
R = 2.32; %Terminal resistance
L = 0.24e-3; %Terminal inductance
K = 0.0234; %Torque constant
mp = 0.25; %Pulley mass
rp = 0.095; %Pulley radius
Jp = 0.5*mp*rp^2; %Pulley intertia
Jm = 10.3e-7; %Rotor intertia
Jt = Jp/4.4^2+Jm; %Total intertia

H2 = ; %H_{\dot{theta} u} (2nd order)
H3 = ; %H_{\theta u} (3rd order)


%% Exercise 2: Reformulation of specifications (time domain)
%Natural frequency and damping ratio
%omega0 = ;
%zeta = ;

%t_r = ; %rise time
%t_s = ; %(1% criterion)
%Mp = ; %percent overshoot


%% Exercise 3: Model reduction
%H3reduced = ; %reduced order model


%% Exercise 4: 


%% Exercise 5: 


%% Exercise 6: Closed loop system
%Ha = ; %transfer function closed loop (analytical)
%Hm = ; %transfer function closed loop (MATLAB)


%% Exercise 7: Choice of controller structure
%Manual exercise


%% Exercise 8: Controller computation


%% Exercise 9: Controller evaluation
%Simulate controller system


%% Exercise 10: Full-order system


%% Exercise 11: Rise-time tuning 



%% Exercise 12: Feedforward 


%% Exercise 13: Simulink model
%Simulink

%% Exercise 14: Saturation of the DC motor input
%Simulink

%% Exercise 15: Disturbances
%Simulink