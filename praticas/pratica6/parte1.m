clear all
close all
nmax=1000;

%bifurcações
for R=2:0.01:4%varia-se o R
    x0=0.5;%ponto inicial
    x=zeros(1,nmax);
    x(1)=x0;
    for n=1:nmax
        x(n+1)=f(x(n),R);%o ponto seguir e o f do anterior
    end
    np=100;
    %representar os ultimos np pontos
    figure(1)%os pontos, ve o periodo
    %nmax-(np-1) ultimos 100 pontos
    plot(nmax-(np-1):nmax,x(nmax-(np-1):nmax),'k-')
    xlabel('n'); ylabel('xn')
    
    figure(2)%bifurcaçoes
    plot(R*ones(1,np),x(nmax-(np-1):nmax),'b.')
    hold on
    xlabel('R'); ylabel('x')
    drawnow
    pause(0.1)
end

%pequena mudança faz grandes diferenças, depende do R
R=3.6;
np=100;
x0=zeros(1,np+1);x1=zeros(1,np+1);
x0(1)= 0.5001;x1(1)=0.5002;
for n=1:np
    x0(n+1) = f(x0(n),R);
    x1(n+1) = f(x1(n),R);
end
plot(1:np+1,x0,'k-',1:np+1,x1,'r-')

function x = f(x,R)
    x = R*x*(1-x);
end