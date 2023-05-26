clear all
close all

h0=1.5;
x0=0;
v0x=10;
v0y=10;

dt=0.1;t=0;y=h0;
while y>0
    x=x0+v0x*t;
    y=h0+v0y*t-0.5*9.8*t^2;
    
    plot(x,y,'ro')
    axis equal
    axis([0 23 -0.5 9])
    pause(dt);
    t=t+dt;
end