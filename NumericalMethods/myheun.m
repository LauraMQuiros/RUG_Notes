function[x,y]= myheun(x0,y0,xend,h)
N = xend/h;
x=[x0:h:xend];
y(1)=0;
for n=1:N 
    k1= h*myfunct(x(n),y(n));
    k2= h*myfunct(x(n+1), y(n)+k1);
    y(n+1)= y(n)+0.5*(k1+k2);
end
end