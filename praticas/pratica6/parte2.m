clear all
close all
nmax=1000;
for R=2:0.01:4
    x0=0.5;
    x=zeros(1,nmax);
    x(1)=x0;
    for n=1:nmax
        x(n+1)=f( f( x(n),R ),R);
    end
    np=100;
    %representar os ultimos np pontos
    figure(1)
    plot(nmax-(np-1):nmax,x(nmax-(np-1):nmax),'k-')
    ylim([0,1])
    xlabel('n'); ylabel('xn')
    figure(2)
    plot(R*ones(1,np),x(nmax-(np-1):nmax),'b.')
    hold on
    xlabel('R'); ylabel('x')
    drawnow
    pause(0.01)
end
function x = f(x,R)
    x = R*x*(1-x);
end