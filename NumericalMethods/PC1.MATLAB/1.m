clear all;
a=2;
b=a+1;%3
a;
a=a+3;%5
c=b*sqrt(a-1); %b*sqrt 4 = b*2=6
d=a*cos(c*pi)+2; % a*cos(6pi)+2= a+2= 7

x=[1 4 9];
y=2*sqrt(x);%2*[123]=[246]
y(3);%6
y=y-1; %[135]
y(2:3);%[35]
z=[2 4];
v=zeros(1,5);%[00000]
%w=z+x;%error

A=[1 2; 3 4];
A(2,1) %3
IA=inv(A);% [4-2,-31] WRONG
x=[-1 2];
x=[-1 2];
A.*x %[-1+6; -2+8]=[5;6] WRONG
B=ones(5,5); %[11111;11111;11111;11111;11111]

x=1:1:14; % from 1 to 14 in steps of 1
y=1:3:20; % from 1 to 20 in steps of 3
size(y) % 7
z=60:-10:10;

M=[1 2 3; 4 5 6; 7 8 9];
size(M)
M(1,:)
M(:,2)=23 % all second column is 23

% EXERCISES 
x=1;
p = sin(sqrt(5*x+1));
p

M1= [1 -3; 2 4];
M2= [1; -6];
inv(M1)*M2

size(1:5:200)

M3= zeros(20,10);
M3(2,:)=4