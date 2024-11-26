clear all
format long
function[x] = Newton
x(1)=1
for n=1:10
    x(n+1)=x(n) - Newton(x(n))/Newton(x(n+1));
end
x