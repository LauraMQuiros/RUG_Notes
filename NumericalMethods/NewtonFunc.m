clear all
format long
x(1)=1;
for n=1:10
    x(n+1) = x(n) - myfunct(x(n))/mydfunct(x(n+1));
    % where myfunc is f(x) and mydfunc is f'(x)
    if abs(x(n+1)-x(n))/abs(x(n+1)) < 1.0E-10
        break
    end
end
x