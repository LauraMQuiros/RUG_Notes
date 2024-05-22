%% Start-up file Computerpracticum 1
% Author: Ewoud Vos

%% Exercise 1: Physical modelling of the system (preparation)


%% Exercise 2: Matlab modeling
%Model parameters
R = 2.32; %Terminal resistance
L = 0.24*10^-3; %Terminal inductance
K = 23.4*10^-3; %Torque constant 
mp = 0.25; %Pulley mass
rp = 0.095; %Pulley radius
Jp = 1/2 * mp * (rp^2); %Pulley intertia
Jm = 10.3e-7; %Rotor intertia
Jt = Jp+Jm; %Total intertia

%State space models
% Because dqm is output x1 = dqm, x2= dqe
A1 = [0, K/(Jt); -K/(L), -R/L];
B1 = [0; 1/L];
C1 = [1, 0];
D1 = 0;
H1_ss = ss(A1,B1,C1,D1); %Obtain MATLAB state-space model H1_ss from A1,B1,C1,D1

% Because output is qm, x1=qm, x2=dqm, x3=dqe
A2 = [0, 1, 0;
      0, 0, K/(Jt);
      0, -K/(L), -R/L];
B2 = [0; 0; 1/L];
C2 = [1,0,0];
D2 = 0;
H2_ss = ss(A2,B2,C2,D2); %Obtain MATLAB state-space model H2_ss from A2,B2,C2,D2

%% Exercise 3: Stability

%Eigenvalues for both systems
Eig_1 = eig(H1_ss);
Eig_2 = eig(H2_ss);

% The eigenvalues in the first case are
% λ1= -0.20902 
% λ2= -9.66645e+03
% which means that if \bar{x}=0 we have a globally AS equilibrium
% and in the second one we also have 
% λ3 = 0, which means that the system is asymptotically stable


%% Exercise 4: System response

%Impulse response for both systems
figure(1)
subplot(1,2,1)
% plot theta-dot...
[y1_dot_theta, t1_dot_theta] = impulse(H1_ss); % Extract impulse response for dot(theta)
plot(t1_dot_theta, y1_dot_theta);
xlabel('Time (s)');
ylabel('dot(theta) (rad/s)');
title('Impulse Response of System 1');
grid on;

% plot theta...
subplot(1,2,2)
[y2_theta, t2_theta] = impulse(H2_ss); % Extract impulse response for theta
plot(t2_theta, y2_theta);
xlabel('Time (s)');
ylabel('theta (rad)');
title('Impulse Response of System 2');
grid on;

%Step response for both systems
figure(2)
subplot(2,2,1)
% plot theta-dot...
[y1_dot_theta, t1_dot_theta] = step(H1_ss); % Extract impulse response for dot(theta)
plot(t1_dot_theta, y1_dot_theta);
xlabel('Time (s)');
ylabel('dot(theta) (rad/s)');
title('Step Response of System 1');
grid on;

% plot theta...
subplot(1,2,2)
[y2_theta, t2_theta] = step(H2_ss); % Extract impulse response for theta
plot(t2_theta, y2_theta);
xlabel('Time (s)');
ylabel('theta (rad)');
title('Step Response of System 2');
grid on;

%% Exercise 5: State feedback
%Coefficients open loop characteristic equation
a = poly(Eig_1);

%Reachability matrix
Wr = [B1, A1*B1];
TildeWr = inv([1, a(2); 0,1]);

%Desired closed loop eigenvalues
p = poly([-100+100i, -100-100i]);

%Feedback gain K
Tildek = [p(2)-a(2), p(3)-a(3)];
K = Tildek*TildeWr*inv(Wr); 
% matrix right division is same as multiplying by inverse
%Reference gain k_r
k_r = -1/(C1*inv(A1-B1*K)*B1);

% Closed-loop system matrices
Acl = A1 - B1 * K;
Bcl = B1 * k_r;
Ccl = C1;
Dcl = D1;
H3_ss = ss(Acl, Bcl, Ccl, Dcl);

% Closed-loop eigenvalues
Eig_cl = eig(Acl);
disp(Eig_cl)

%Step response open loop vs closed loop
%Step response for both systems
figure(1)
subplot(1,2,1)
% plot theta-dot...
[y1_dot_theta, t1_dot_theta] = step(H1_ss); % Extract impulse response for dot(theta)
plot(t1_dot_theta, y1_dot_theta);
xlabel('Time (s)');
ylabel('dot(theta) (rad/s)');
title('Step Response of System 1');
grid on;

% plot theta...
subplot(1,2,2)
[y3_theta, t3_theta] = step(H3_ss); % Extract impulse response for theta
plot(t3_theta, y3_theta);
xlabel('Time (s)');
ylabel('theta (rad)');
title('Step Response of System 3');
grid on;
