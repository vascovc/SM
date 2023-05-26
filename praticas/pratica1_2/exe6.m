clear all
close all

vx = 1;vy = 1;
x0 = 0;y0 = 0;
x0 = 0;y0 = 0;t=0;
x=0;
while 0 <= x
    if x > 5
        vx = -1; vy = -1;x0 = x;y0 = y;t=0;
    end
    x = x0 + vx*t;
    y = y0 + vy*t;
    plot(x,y,'bo','Markersize',10,'MarkerFaceColor','b')
    axis([-1 6 -1 6])
    drawnow
    t = t+0.05;
    %pause(0.05)
end

close all