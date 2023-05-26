clear all
close all

N=5000;
for R=0:0.01:1
    x=zeros(1,N);
    x(1)=rand(1);
    a=zeros(1,N);
    for i=2:N
        x(i)=R*sin(pi*x(i-1));
    end
    figure(2)
    plot(R*ones(1,1000),x(i-999:end),'k.')
    xlabel("R")
    ylabel("xn")
    axis([0 1 0 1])
    hold on
    drawnow
end