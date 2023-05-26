clear all
close all
clc

r0=[0;2];
v0=[10;10];
m=0.1;
for x=0:0.1:30
    dy = dist(x,r0,v0,m);
    axis([-1 31 -30 10])
    plot(x,dy,'r*')
    hold on
    xlabel('x')
    ylabel('dy')
    drawnow
end

