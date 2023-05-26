close all
clear all
 
%  Erro relativo de cada ponto
er=0.05;
%%%%%%%%%%%%%%
xi=linspace(0,10,20);%logspace(-4,1,40); 
xi=xi'; % para ser vetor coluna
%dados experimentais artificiais 
pi=[0.5,1]; lambda=[-0.1,-1];
yi=pi(1)*exp(lambda(1)*xi)+pi(2)*exp(lambda(2)*xi);
yi=yi+er*yi.*randn(numel(yi),1); % adi??o do erro
% ajuste a fun??o y=p(1)*exp(lambda(1)*x)+p(2)*exp(lambda(2)*x);
fprintf(1,'Ajuste a y=p(1)*exp(lambda(1)*x)+p(2)*exp(lambda(2)*x).\n')
figure(1)
A=[exp(lambda(1)*xi), exp(lambda(2)*xi)]; [U, W, V]=svd(A);
%A=[xi.^2, xi, ones(length(xi),1)]; 
[N,M]=size(A);
[U, W, V]=svd(A);
r = length(find(diag(W)>0)); % apenas e' possivel determinar r parametros
U=U(:,1:r); W=W(1:r,1:r); V=V(1:r,1:r); b=yi;
a=(V*inv(W))*(U'*b); p=a;
% matriz de covariancia
for i=1:r
    for j=1:r
        C(i,j)=0;
        for k=1:r
        C(i,j)=C(i,j)+V(i,k)*V(j,k)/W(k,k)^2;
        end
    end
end
df=N-r;
dp=round(transpose(sqrt(diag(C)))/sqrt(df),1,'significant'); % 68,26% de confian?a=sigma, 95%confian?a
fprintf('valores esperados p(1)=%f, p(2)=%f\n',pi)
fprintf('p(1)=%f +/- %f, p(2)=%f +/- %f,\n', p(1),dp(1),p(2),dp(2));
x=0:0.01:max(xi);  ymodelo=p(1)*exp(lambda(1)*x)+p(2)*exp(lambda(2)*x); 

semilogy(xi,yi,'x'); hold on; semilogy(x,ymodelo,'r-')
xlabel('x'); ylabel('log y')