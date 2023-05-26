clear all
close all

r1=[4.1;2.7];
r2=[2.4;3.5];
r12=r2-r1;

quiver(0,0,r1(1,:),r1(2,:),0)
hold on
axis equal
axis([0,5,0,5])
quiver(0,0,r2(1,:),r2(2,:),0)
quiver(r1(1,:),r1(2,:),r12(1,:),r12(2,:),0)
quiver(0,0,1,0,0,'k')%versor x
quiver(0,0,0,1,0,'k')%versor y
hold off