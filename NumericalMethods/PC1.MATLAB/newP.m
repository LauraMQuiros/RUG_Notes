function[ans]=newP(x)
%input: x 
%output: a
x = 0:0.1:2;
ans = sin(sqrt(5*x+1));
size(ans)
