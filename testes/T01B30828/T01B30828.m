% Simulacao e Modelacao
% (2014/2015)
% Proposta de Resolucao 1º Teste - Versao B

clear all
close all

% Declaracao das variaveis
global y01 y02 A0 b m w phi1 phi2

y01=2;
y02=3;
A0=2;
b=2;
m=2;
w=0.1;
phi1=0;
phi2=pi;

% Determinacao do momento de impacto (Met. Newton)
prec=1e-4; % Precisao

[YZ,n] = T01newton(@T01B30828f,@T01B30828df,2,prec);
% YZ converge para um valor negativo, logo os osciladores nao colidem.

% Animacao
tf=5;
t=linspace(0,tf,200);

for i=1:length(t)
    y1=y01+A0*exp(-(b*t(i))/(2*m))*sin(w*t(i)+phi1);
    y2=y02+A0*exp(-(b*t(i))/(2*m))*sin(w*t(i)+phi2);
    
    plot(0,y1,'bs',0,y2,'rs',[-3 3],[0 0],'k-')
    axis([-2 2 -0.1 4])
    axis off
    pause(0.01)
end