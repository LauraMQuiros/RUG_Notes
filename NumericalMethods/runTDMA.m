clear all

N= 10;
alpha=0.5;
Dar = zeros(N,1)
Lar= 
Rar=
Dar(N)=1
Dar(1)=1
b(1)=1
b(1)=1

for i=2:N-1
Dar(i)= 2+alpha;
Rar(i)= 1;
Lar(i)=-1;
b(i)=1;
end

[x] =tdma(Lar, Dar, Rar,b)