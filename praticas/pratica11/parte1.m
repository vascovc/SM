clear all
close all

x=1:1:19;%os pontos x
lambda=5;%valor de lambda
y=exp(x/lambda);%valores de y
plot(x,y,'ro')

xpol = linspace(-5,30,100);%100 pontos entre -5 e 30 
ypol=interp1(x,y,xpol,'linear','extrap');
ypol2=interp1(x,y,xpol,'cubic','extrap');
ypol3=interp1(x,y,xpol,'spline','extrap');
ypol4=spline(x,y,xpol);
hold on
x2 = -5:1:30;
y2=exp(x2/lambda);
plot(xpol,ypol,'k',xpol,ypol2,'b',xpol,ypol3,'g',x2,y2,'og',xpol,ypol4,'y')

a=polyfit(x,y,3);
yr=a(1)*xpol.^3+a(2)*xpol.^2+a(3)*xpol+a(4);
plot(xpol,yr,'*')

yr2=polyval(a,xpol);% igual as linhas 18 e 19, de formar o polinomio
plot(xpol,yr2,'*y')