clear all
close all

np=100;
V = rand(2,np);
X=V(1,:); Y=V(2,:);

iverm=find(Y>=0.5);
iazul=find(Y<0.5);
plot(X(iverm),Y(iverm),'r.')
hold on
plot(X(iazul),Y(iazul),'b.')
% transf
figure(2)
M=[2 0; 0 0.5];
V=M*V
X=V(1,:); Y=V(2,:);
plot(X(iverm),Y(iverm),'r.')
hold on
plot(X(iazul),Y(iazul),'b.')
%translaçao
T=repmat([-1;0.5],1,np)
i = find(V(1,:)>1)
V(:,i)= V(:,i)+T(:,i)
figure(3)
X=V(1,:); Y=V(2,:);
plot(X,Y,'r.')

