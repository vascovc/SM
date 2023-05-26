function [ r ] = T01C30828f( t )
%T01C30828f Funcao diferenca. Teste 1 Ex.2
%   Tiago A. Oliveira

global h0 a A w

yb=h0+0.5.*a.*t.*t;
yo=A.*sin(w.*t);

r=yb-yo;
end