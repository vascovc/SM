% Simulacao e Modelacao
% (2014/2015)
% Proposta de Resolucao 1º Teste - Versao E

clear all
close all

% Declaracao das variaveis
global h0 a y0 A w

h0=5;
a=-9.8;
y0=2;
A=2;
w=pi/6;

% Determinacao do momento de impacto (Met. Newton)
prec=1e-4; % Precisao

[XZ,n] = T01bissec(@T01E30828f,0.1,1,prec);

% Animacao
tf=XZ;
t=linspace(0,tf,100);

for i=1:length(t)
    yb=h0+0.5.*a.*t(i).*t(i);
    yo=y0+A.*sin(w.*t(i));
    
    plot(0,yb,'bs',0,yo,'rs',[-1 1],[0 0],'k-')
    axis([-1 1 0 5])
    axis off
    pause(0.01)
end