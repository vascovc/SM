clear all
close all

h0=1.5;
x0=0;
v0x=10;
v0y=10;
g=9.8;
%v=v0+a*t
%no ponto mais alto a velocidade vy é igual a 0
%então t= v0y/g, g negativo.
%o tempo de subida do projetil e igual ao tempo de descida
xa=[v0x*2*(v0y/g);0];
ta=2*(v0y/g);
hmax = h0+v0y*(v0y/g)-0.5*g*(v0y/g)^2;
thmax = v0y/g;