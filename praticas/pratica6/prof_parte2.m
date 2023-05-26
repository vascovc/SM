clear all
close all

nmax=1000; %faz nmax iteracoes
np=100; %representa as ultimas np iteracoes
for R=2:0.01:3.9
    x0=0.5; %x inicial
    x(1)=x0; x2(1)=x0;
    for n=1:nmax
        x(n+1)=f(x(n),R);
        x2(n+1)=f(f(x2(n),R),R); % funcao f2
    end
    cor='r.';
    graficos(x,R,nmax,np,cor); figure(1); hold on
    cor='b.';
    graficos(x2,R,nmax,np,cor);  figure(1); hold off
end
function graficos(x,R,nmax,np,cor)
    %representar os ultimos np pontos
    figure(1)
    plot(nmax-(np-1):nmax,x(nmax-(np-1):nmax),'k-')
    hold on
    ylim([0,1])
    xlabel('n'); ylabel('xn')
    figure(2)
    plot(R*ones(1,np),x(nmax-(np-1):nmax),cor)
    hold on
    xlabel('R'); ylabel('x')
    drawnow
    %pause(0.1)
end
function x=f(x,R)
    x=R*x*(1-x);
end