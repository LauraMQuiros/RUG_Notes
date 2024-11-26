N=4;
h=(1-0)/N;
x=[0:h:1]; %build a grid
global_area =0;
for n=1:N
    xm=x(n)+h/2; %midpoint value
    local_area=myfunct(xm); %area of rectangle
    global_area = global_area + local_area; % total area
end
global_area