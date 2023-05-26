clear all
close all

m=1; k=1;%massa das bolas  coeficiente da mola
w=sqrt(k/m);%frequencia angular

L=12;%distancia total
lmola=4;%posicao equilibrio
d0=0.4; %diametro bolas

v1i=1.7;%velocidade inicial da bola
A_0=1;%amplitude da mola
dt=0.05; tmax=15;%intervalo da animacao tempo maximo
t0=0; x1_0=0; phi_0=0;%tempo inicial/posicao inicial/fase inicial
v1_0=v1i;A=A_0;phi=phi_0;
ic=1;%contador
[col,tcol, x1col,v1col,A,phi]=colisao(t0,v1_0,x1_0,A,phi,w,L,lmola,d0);%ver primeira colisao
fprintf('Colisao %d, t=%f\n',ic,tcol)

while col
    animacao(L,dt, t0, tcol,x1_0,v1i,w,phi_0,lmola,A_0);%fazer desenho
    t0=tcol;v1i=v1col; A_0=A; phi_0=phi; x1_0=x1col;%mudar as variaveis
    ic=ic+1;%aumentar numero de colisoes
    [col,tcol, x1col,v1col,A,phi]=colisao(t0,v1i,x1_0,A_0,phi_0,w,L,lmola,d0);%proxima colisao
    %ve-se a proxima colisao
    if col%se houver colisao
        fprintf('Colisao %d, t=%f\n',ic,tcol)
    else
        fprintf('Nao ha mais colisoes\n')
    end
end
tcol=tmax;%tem se mais algum desenho para nao acabar logo apos a ultima colisao
animacao(L,dt, t0, tcol,x1_0,v1i,w,phi_0,lmola,A_0)
