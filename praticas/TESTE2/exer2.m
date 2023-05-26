clear all
close all
clc

for c = 1:0.1:10
    y = y0_newton(c);
    plot(c,y,'b*')
    hold on
    xlabel('c')
    ylabel('y0')
    drawnow
end