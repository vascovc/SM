clear all
close all

x=0:0.01:1;
R=3.5;
y=R.*x.*(1-x);
y3=R*(R.*x.*(1-x)).*(1-R.*x.*(1-x));
y2=x;
plot(x,y,'b.',x,y2,'r.',x,y3,'k.');