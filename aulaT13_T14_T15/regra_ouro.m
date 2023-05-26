clear all 
close all
format long
x=-1:0.01:1;
y=funcao(x);
plot(x,y,'-')
hold on
xlabel('x') ; ylabel('y')

x0=-2; dx=0.1;
%x0=0; dx=0.1;
[xe,xd]=procura_grosseira(@funcao,dx,x0);

 xm=regra_ouro(@funcao,xe,xd);
 fprintf(1,'Minimo em x=%30.15f com fmin=%30.15f \n',xm, funcao(xm));
 plot(xm,funcao(xm),'ko')

%[funcao(xm-1e-6), funcao(xm), funcao(xm+1e-6)]

function xm=regra_ouro(f,xe,xd)
phi=(1+sqrt(5))/2; 

dx=xd-xe;

while dx > 1e-8
    xc=xd-1/(1+phi)*(xd-xe);
    xn=xe+(1/(1+phi))*(xd-xe);
    if f(xn)< f(xe) && f(xn)<f(xc)
        xd=xc; 
    else
        xe=xn; 
    end
 dx=xd-xe;
end
xm=0.5*(xd+xe);
end
 
function [xe,xd]=procura_grosseira(f,dx,x0)
  x1=x0; x2=x0+dx; x3=x0+ 2*dx;
 n=0;
while f(x2)>=f(x1) || f(x2)>=f(x3)
    n=n+1;
    x0=x0+dx;     x1=x0; x2=x0+dx; x3=x0+ 2*dx;
   if n>1000
       break
   end

end
xe=x1; xd=x3;
end

function [y]=funcao(x)
b=-1; a=0.2; c=2;
y=a*x+b*x.^2 + c*x.^4;
end