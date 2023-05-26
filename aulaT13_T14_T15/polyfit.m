close all
clear all

%utiliza??o da fun??o polyfit

% 
%  Erro relativo de cada ponto
er=0.10;
%%%%%%%%%%%%%%
xi=0:0.2:3;
%dados experimentais artificiais sobre uma reta com erro.
pi1=[2,0.3];
yi1=pi1(1)*xi+pi1(2);
yi1=yi1+er*yi1.*randn(1,numel(yi1)); % adi??o do erro
% dados experimentais artificiais sobre uma parabola com erro.
xi=0:0.2:3;
pi2=[2,0.3,-1];
yi2=pi2(1)*xi.^2+pi2(2)*xi+pi2(3);
yi2=yi2+er*yi2.*randn(1,numel(yi2)); % adi??o do erro

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ajuste polinomial a uma reta
fprintf(1,'Ajuste a uma reta.\n')
figure(1)
[p,S]=polyfit(xi,yi1,1);
% A estrutura S permite calcular a matriz de covari?ncia
% calculo dos erros em p
R=S.R; normr=S.normr; df=S.df; Rinv=inv(R);
% matriz de covariancia
C=(Rinv*Rinv')*normr^2;
dp=round(transpose(sqrt(diag(C)))/sqrt(df),1,'significant'); % 68,26% de confian?a=sigma,  95%confian?a=2 sigma
fprintf('valores esperados p(1)=%f, p(2)=%f\n',pi1)
fprintf('p(1)=%f +/- %f, p(2)=%f +/- %f\n', p(1),dp(1),p(2),dp(2))
x=0:0.01:3;
[ymodelo,delta] = polyval(p,x,S);
%ymodelo=p(1)*x+p(2);
plot(xi,yi1,'x')
hold on
plot(x,ymodelo,'r-', x,ymodelo+delta,'r--',x,ymodelo-delta,'r--')
xlabel('x'); ylabel('y')
% ajuste polinomial a uma parabola
figure(2)
fprintf(1,'Ajuste a uma parabola.\n')
[p,S]=polyfit(xi,yi2,2);
% calculo dos erros em p
% calculo dos erros em p
R=S.R; normr=S.normr; df=S.df; Rinv=inv(R);
% matriz de covariancia
C=(Rinv*Rinv')*normr^2;
dp=round(transpose(sqrt(diag(C)))/sqrt(df),1,'significant'); % 68,26% de confian?a=sigma, 95%confian?a=2 sigma
fprintf('valores esperados p(1)=%f, p(2)=%f, p(3)=%f\n',pi2)
fprintf('p(1)=%f +/- %f, p(2)=%f +/- %f, p(3)=%f +/- %f\n', p(1),dp(1),p(2),dp(2),p(3),dp(3))

[ymodelo,delta] = polyval(p,x,S);
%ymodelo=p(1)*x.^2+p(2)*x.^3+p(3);
plot(xi,yi2,'x')
hold on
plot(x,ymodelo,'r-', x,ymodelo+delta,'r--',x,ymodelo-delta,'r--')
xlabel('x'); ylabel('y')
% fitType = fittype('a*x^2 + b*x + c') % The equation for your fit goes here
%  f = fit(xi',yi',fitType);
%  f
%  uncertainty = confint(f,0.95); % Calculated 90% confidence intervals for each coeff of th
% dp(1)=(uncertainty(2,1)-uncertainty(1,1))/2;
% dp(2)=(uncertainty(2,2)-uncertainty(1,2))/2;
% dp(3)=(uncertainty(2,3)-uncertainty(1,3))/2;