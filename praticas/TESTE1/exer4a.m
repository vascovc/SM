clear all
close all

N=5000;

for R=0:0.01:1
    x=zeros(1,N);
    a=zeros(1,N);
    a(1)=1;
    x(1)=rand(1);
    for i=2:N
        x(i)=R*sin(pi*x(i-1));
        a(i)=i;
    end
    plot(a,x,'b.')
    xlabel("n")
    ylabel("xn")
    axis([0 N 0 1])
    pause(0.1)
end