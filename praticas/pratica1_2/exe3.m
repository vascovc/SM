clear all
close all

a = [1;1];
b = [1;-1];
c = [2;-5];

M=[a';b']
ex=[1 0];ey=[0 1];
b1=[ex;ey]
b2=M*b1 % coordenadas da nova base na origem

cb1=[2 -5] %coordenadas na base original

cb2=cb1*inv(M) %coordenadas na nova base

