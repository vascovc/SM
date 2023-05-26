function [ r ] = T01E30828f( t )
%T01E30828f Funcao diferenca. Teste 1 Ex.2
%   Tiago A. Oliveira

global h0 a y0 A w

yb=h0+0.5.*a.*t.*t;
yo=y0+A.*sin(w.*t);

r=yb-yo;
end