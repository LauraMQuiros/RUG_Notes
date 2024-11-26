
taf= zeros(1,10);
for i=1:10
    taf(i)= 7*i;
end

money(1)=100;
for i=1:16
    money(i+1)=money(i)+ (money(i)*0.05);
    if i>7
        money(i+1)=money(i)+ (money(i)*0.06);
    end
  
end
%money
%money(size(money)) - money(1)

M= zeros(7,7);
for i=1:7
    for j=1:7
        if i==j
            M(i,j)= i;
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = 0;
for n=2:7
    n
    a = n*a + 0.1;
    a
end
a

f = 362;
for n=0:6
    7-n
    f
    f = (f-0.1)/(7-n);
end 
f