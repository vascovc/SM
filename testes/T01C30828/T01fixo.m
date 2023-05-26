function [XZ,n] = T01fixo(funcao,xa,lambda,deltac);


FXa=funcao(xa);
xb=xa-lambda*FXa;
FXb=funcao(xb);
n=1;

if abs(FXa)<abs(FXb)
    lambda=-lambda;
end
xa=xb;

delta=1;
while delta>deltac %o que traduz esta condição?
    x=xa-lambda*funcao(xa);  
    n=n+1;
    delta=abs(lambda.*funcao(xa))/abs(x);
    xa=x; %porquê?
end
XZ=x;

end