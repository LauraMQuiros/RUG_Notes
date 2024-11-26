clear all
close all
[x1,y1]= myeuler(0, 0,1 , 0.2);
plot(x1,y1,'*')

[x2,y2]= myheun(0,0,1,0.2);
plot(x2,y2,'*')

[x3,y3]= myK4(0,0,1,0.2);
plot(x3,y3,'*')


xfine=0:0.001:1;
plot(xfine, exp(xfine)-xfine-1)