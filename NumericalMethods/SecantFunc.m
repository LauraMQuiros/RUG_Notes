clear all
format long
x(1)=1;
x(2)=1.2;
for n=2:10
    fxn = myfunct(x(n));
    up = x(n) - x(n-1);
    down =  fxn-myfunct(x(n-1));
    x(n+1)=x(n) - fxn*up/down;
    % where myfunct is f(x)
    if abs(x(n+1)-x(n))/abs(x(n+1)) < 1.0E-10
        break
    end
end
x