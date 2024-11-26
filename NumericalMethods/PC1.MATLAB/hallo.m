% programma hallo 
% input: m 
% output: xm,i 
i=0; 
xm=m; 
while xm>1e-8 
    xm=xm/2;
    i=i+1;
end
% i is the number of times m can be divided by 2 before its smaller than
% 1e-8. If the guard happened to be anything else, then it would count some
% other amount