clear all
close all

x=0:0.1:24;
A=2; lambda=4;v1=1;v2=-1;
dt=0.1;tmax=10;
for t=0:dt:tmax
    y1=A*sin(2*pi*(x-v1*t)/lambda);
    y2=A*sin(2*pi*(x-v2*t)/lambda);
    y3=y1+y2;
    %plot(x,y1,'b',x,y2,'y',x,y3,'r','linewidth',3)
    plot(x,y1,'b','linewidth',3) % ou se faz com o hold on ou entao meter tudo no mesmo
    hold on
    plot(x,y2,'y','linewidth',3)
    plot(x,y3,'g','linewidth',3)
    hold off
    axis([0,24,-4,4])
    xlabel('x'); ylabel('y')
    drawnow
    pause(0.1)
end

close all
