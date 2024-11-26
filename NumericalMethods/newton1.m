
clear all
format long
x(1)=0.7;
for n=1:10
    x(n) = x(n-1) - fopg1(x(n-1))/dfopg1(x(n));
    % where myfunc is f(x) and mydfunc is f'(x)
    if abs(x(n)-x(n-1))/abs(x(n)) < 1.0E-10
        break
    end
end
x