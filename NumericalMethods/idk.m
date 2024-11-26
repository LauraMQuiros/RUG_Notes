












end
plot(x, u(:,1), '*')

Tend = 1;
dt = 0.1/0.64*0.5;
Nstep= round(Tend/dt);
R = D*dt/(dx*2);
for n=1:Nstep
    u(1,n+1)= u(2,n); % boundary condition
    for i=2:M
        u(i,n+1)=R*u(i+1,n)*(1-2*R)*u(i,n) + R* u(i-1,n);
        if x(i) > 0.45 && x(i)< 0.55
            u(i,n+1)=u(i,n+1)+ Q*dt;
        end
    end
    u(M,n+1)=u(M-1,n); % boundary condition
end