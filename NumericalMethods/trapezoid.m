% Trapezoidal
function[global_area]= trapezoid(a,b,N)
%N=128;
h=(b-a)/N;
global_area = 0;
x = [a:h:b];

for n=1:N
    xl=x(n);
    xr= x(n+1);
    local_area = h/2 *(aFunct(xl)+aFunct(xr));
    global_area= global_area+local_area;
end
%global_area