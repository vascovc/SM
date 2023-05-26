clear all
close all
clc
load dados
%t com tempo
%theta com angulo para o tempo

xpol = linspace(0,10,100);
ypol = interp1(t,theta,xpol,'splines');%existem varios metodos que se iriam adequar
plot(t,theta,'r*',xpol,ypol,'b')
hold on
for i=1:99
    if ypol(i)*ypol(i+1)<0 %sao sinais diferentes entao há troca de sinal
        if abs(ypol(i))>abs(ypol(i+1))%se o valor i+1 estiver mais perto do 0
            plot(xpol(i+1),ypol(i+1),'go')
        else
            plot(xpol(i),ypol(i),'go')
        end
    end
end


der=theta;%para as dimensoes ficarem certas e como vamos ter o mesmo numero de pontos
%usar a adientada
der(1)=(theta(2)-theta(1))/(t(2)-t(1));
%usar a atrasada no ultimo
der(end) = (theta(end)-theta(end-1))/(t(end)-t(end-1));
for i=2:theta(end-1)
    der(i) = (theta(i+1)-theta(i-1)) / (t(i+1)-t(i-1));
end
figure(2)
plot(t,der)