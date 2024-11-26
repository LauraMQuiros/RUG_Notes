function[x,y]= myeuler(x0,y0,xend,h)
N=xend/h;
x=[x0:h:xend];
y(1)=y0;

for i=1:N
    y(i+1)= y(i) + h * myfunction(0,y(i)); % Euler's method update
end

end