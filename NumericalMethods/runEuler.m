clear all
close all
[x1,y1]= myeuler(0, 1 ,10 , 0.2);
plot(x1,y1,'*')
xfine=0:0.001:10;
hold on
plot(xfine, exp(-5*xfine))
%[x2,y2]= myeuler(0,1,2,0.1);
%plot(x2,y2,'*')
%[x3,y3]= myeuler(0,1,2,0.05);
%plot(x3,y3,'*')
%q = (y1 -y2)/(y2 -y3); % subtraction not possible because diff size array
%q = (y1 -y2(1:2:end))./(y2(1:2:end) -y3(1:4:end))
%errest = y2-y3(1:2:end);
%extrap= 2*y3(1:2:end)-y2;
%plot(x2,extrap, 'v')