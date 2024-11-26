% Simpsons 
function[global_area]= simp(a,b,N)
%N=128;
h=(b-a)/N;
global_area = 0;
x = [a:h:b];

for n=1:N
    xl=x(n);
    xr= x(n+1);
    xm= x(n)+h/2;
    local_area = h/6 *(newfunct(xl)+4*newfunct(xm)+ newfunct(xr));
    global_area= global_area+local_area;
end
