clear all
close all
[x1,y1]= myeuler(0,1,10,0.2);
plot(x1,y1,'*-')
xfine=0:0.001:2;
hold on
plot(xfine, exp(-5*xfine))