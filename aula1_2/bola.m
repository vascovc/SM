clear all

v0=45;g=9.8;y0=2;
figure(2)
ymin=-10;ymax=150;tmax=10;dt=0.1;

i=1;t=0;y(1)=y0;
while t<=tmax && y(i)>0
    i=i+1; t=t+dt;
    y(i)=y0+v0*t-g*t^2/2;
    plot(0,y(i),'bo','Markersize',10,'MarkerFaceColor','b')
    %axis equal
    axis([-1,1,ymin,ymax])
    drawnow
end

