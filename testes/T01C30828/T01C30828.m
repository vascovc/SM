% Simulacao e Modelacao
% (2014/2015)
% Proposta de Resolucao 1º Teste - Versao C

clear all
close all

% Declaracao das variaveis
global h0 a A w

h0=50;
a=-9.8;
A=2;
w=0.1;

% Determinacao do momento de impacto (Met. Ponto Fixo)
prec=1e-4; % Precisao

[YZ,n] = T01fixo(@T01C30828f,1,-0.05,prec);
%Especial cuidado no lambda escolhido!

% Animacao
tf=YZ;
t=linspace(2,tf,200);

for i=1:length(t)
    yb=h0+0.5*a*t(i)*t(i);
    yo=A*sin(w*t(i));
    
    plot(0,yb,'bo',0,yo,'rs',[-3 3],[0 0],'k-')
    axis([-2 2 -0.1 4])
    axis off
    pause(0.1)
end