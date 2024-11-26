N=1000;
A=zeros(N,N);
alpha = 0.1;
A(1,1)=1;
A(N,N)=1;
b(1)=1;
b(N)=1;
for i=2:N-1
    A(i,i)=2+alpha;
    A(i,i-1)= -1;
    A(i,i+1)= -1;
    b(i)= 1;
end
[xsol]= jacfull(A,b,N);