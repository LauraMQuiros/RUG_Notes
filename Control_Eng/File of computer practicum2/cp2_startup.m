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

% H2 = K/(K^2 + Jt * s * (R + L * s)); 
H2 = tf(K,[Jt*L,Jt*R,K^2]); %H_{\dot{theta} u} (2nd order)
%H3 = k/(s *(K^2 + Jt *s* (R + L *s))); %H_{\theta u} (3rd order)
H3 = tf(K, [Jt*L,Jt*R,K^2,0]);

%% Exercise 2: Reformulation of specifications (time domain)
%Natural frequency and damping ratio
omega0 = 100 * sqrt(2);
zeta = 1 / sqrt(2);

t_r = exp(pi/4)/(100 * sqrt(2)); %rise time
t_s = 1/25; %(1% criterion)
Mp = exp(-sqrt(2)* pi); %percent overshoot


%% Exercise 3: Model reduction
%H3reduced = K/(s *(K^2 + Jt* R *s)); %reduced order model
H3reduced = tf(K,[Jt*R, K^2,0]);

%% Exercise 4: Reduced equations of motion and reduced state space form


%% Exercise 5: Bode diagrams
controlSystemDesigner('bode',H3); 
% the magnitude has an x in 20dB and crosses at 0, w 12.74 phase at -162 
% and at -47dB we also have a little yellow dot
% Step response is oscillating
controlSystemDesigner('bode',H3reduced);
% almost identical phase and step response, only difference is lack of
% yellow dot at -47 dB

%% Exercise 6: Closed loop system
Ha = tf(1,[Jt*R, K^2,0]); %transfer function closed loop (analytical)
Hm = feedback(H3reduced,1); %transfer function closed loop (MATLAB)

% Simulate the closed-loop system for a step input
figure;
step(Hm);
title('Closed-Loop Step Response');
xlabel('Time (seconds)');
ylabel('Response');
grid on;

newMp= 1.61/1 * 100 / 100;
%newT_r=;
%newT_s=;

%% Exercise 7: Choice of controller structure
%Manual exercise
A1 = [0, 1; 0, -K^2/(Jt*R)];
B1 = [0; K/(Jt *R)];
C1 = [1 0];
D1 = 0;
H1_ss = ss(A1,B1,C1,D1);
Eig_1 = eig(H1_ss);
% eigenvalues are 0 and -3.98

a = poly(Eig_1);
Wr = [B1, A1*B1];
TildeWr = inv([1, a(2); 0,1]);
% these tilde reachability matrix is supposed to tell us about stability
 
%Desired closed loop eigenvalues
p = poly([-50+30i, -50-30i]);

%Feedback gain K
Tildek = [p(2)-a(2), p(3)-a(3)];
K_gain = Tildek*TildeWr*inv(Wr); 

%Reference gain k_r
k_r = -1/(C1*inv(A1-B1*K_gain)*B1);

%% Exercise 8: Controller computation
Wo = [C1; C1*A1];
TildeA = [-a(2),1; -a(3),0];
TildeC = [1,0];
TildeWo = [TildeC; TildeC*TildeA];
q = poly([-200,-200]);
matrix_temp = [q(2)-a(2); q(3)-a(3)];
GainL = inv(Wo)* TildeWo * matrix_temp;

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