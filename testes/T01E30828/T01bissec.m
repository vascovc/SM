function [XZ,n] = T01bissec(funcao,xa,xb,deltac);


FXa=funcao(xa);
FXb=funcao(xb);
n=0;

if (FXa*FXb>0)% Porquê? Se não tivéssemos procedido à representação
 % gráfica como poderíamos seleccionar xa e xb?
 display('Escolha outros pontos iniciais')
 return
end
delta=1;
while delta>deltac %o que traduz esta condição?
 x=(xa+xb)/2; % ponto médio
 n=n+1;
 
 if (funcao(xa)*funcao(x)<0)
 delta=abs(xb-x)/abs(x); % erro
 xb=x; %porquê?
 else

 delta=abs(xa-x)/abs(x);
 xa=x; %porquê?
 end
end
XZ=x;

end