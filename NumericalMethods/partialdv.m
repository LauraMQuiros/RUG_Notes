clear all
close all
hold on

M=20;
length = 1;
D=0.001;
dx=length/M;
x=0:dx:length;

for i=1:M+1
    u(i,1)=100*sin(pi*x(i));
end
plot(x, u(:,1), '*');

Nstep=1000; %instabilities like M=80 will be fixed with higher Nstep
dt=0.01;
R=D*dt/(dx*2);
for n=1:Nstep
    u(1,n+1)=0;% boundary condition
    for i=2:M
        u(i,n+1)= R*u(i+1,n) + (1-2*R)*u(i,n) + R*u(i-1,n);
    end
    u(M+1, n+1)=0;% boundary condition
end

plot(x, u(:,end), 'r*');
