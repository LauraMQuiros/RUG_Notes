% BASIC PROGRAMMING CONSTRUCTION

%Assignment
a = 1;
b = 2 * a +1 ;
%d= 5*a + 26 + p; % will lead to error since there is no assumption of value of p
c = [1 2 4];
cc = [1 0 -2];
ccc = c + cc;

%If statement
if x == 0
    x= 1;
end

%For statement
for i=1:7
    a= i*a -2
end

%While statement: the in/out appears when "help name"
% programma name
% input: m 
% output: xm,i 
i=0; 
xm=m; 
while xm>1e-8 
    xm=xm/2 
    i=i+1 
end

%Functions and plots
function[y]= myfunction(x) 
    % remember the file will be named after the function
    y=exp(x)+x-2;
end

x =[0 : 0.1 : 2]; % steps
w= sin(sqrt(5*x+1)); % function to graph
title('nice plot')
xlabel('x coord') 
ylabel('function value')
plot(x,w,'m.'); % plotting function

% you can say "format long" in terminal to show 16 decimals or "format
% short" for smaller ones
fprintf('e= %8.6f \n',em1);
fprintf('%6.0f %6.0f %15.6e \n',i,j,x);

%Structs: works in pairs of variable name and variable
field1= 'name';
field2= 'student_number';
field3 = 'birthday_date';

name = {'Adam','Bob','Chris','Dan', 'Elmo'};
student_number = {1,12,13,14,15};
bdays = {[20,01],[21,02],[22,03],[23,04],[24,05]};

students = struct(field1,name,field2,student_number,field3,bdays);

students(4).student_number = 84; % this is how you access struct info
students(3).birthday_date(2)=7;