clear all
close all

np=100;
V = rand(2,np); % matriz de duas linhas e 100 colunas com random
X=V(1,:); Y=V(2,:); % coordenadas x e y

iverm=find(Y>=0.5); % os valores de y >= 0.5
iazul=find(Y<0.5); 5 % os valores de y < 0.5
plot(X(iverm),Y(iverm),'r.') % desesenha os que sao superiores
hold on
plot(X(iazul),Y(iazul),'b.') % desenha os que sao inferiores
% transforma�ao
figure(2) % criar outra figura
M=[2 0; 0 0.5]; % matriz de dilata�ao/contra�ao
V=M*V % cria a matriz com a tranforma�ao aplicada

X=V(1,:); Y=V(2,:);
plot(X(iverm),Y(iverm),'r.')
hold on
plot(X(iazul),Y(iazul),'b.')
%transla�ao
T=repmat([-1;0.5],1,np) % matriz de transla�ao linha*1 coluna*np
i = find(V(1,:)>1)
V(:,i)= V(:,i)+T(:,i);
figure(3)
X=V(1,:); Y=V(2,:);
plot(X,Y,'r.')

