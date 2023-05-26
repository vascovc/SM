clear all
close all

%a)
n = 10000;
r = rand(2,n); % matriz dos pontos

i_verm = find(r(2,:)>=0.5); % linha dois maiores= que 0.5
i_azul = find(r(2,:)<0.5); % linha dois menores que 0.5

M = [2 0; 0 1/2];
T = [-1;0.5];
T = repmat(T,1,n); % a matriz de translaçao
M_inv = inv(M);% matriz inversa para a trans
T_inv = [T(2,:);T(1,:)]; % matriz de trans oposta
for a=0:1:49
    plot(r(1,i_verm),r(2,i_verm),'r.')
    %plot(r(1,i_verm(1)),r(2,i_verm(1)),'ro')    
    axis equal; axis([-0.5 1.2 -0.5 1.2])
    hold on
    plot(r(1,i_azul),r(2,i_azul),'b.')
    %plot(r(1,i_azul(1)),r(2,i_azul(1)),'-')
    drawnow
    hold off
    x = find(r(1,:)>=0.5); % encontramos os pontos x > 0.5
    r = M*r; % aplica-se a todos os pontos a transformação
    r(:,x) = r(:,x)+T(:,x); % aos pontos de x>0.5 faz se a translaçao
    pause(0.1)
end
pause(1)
%b)
for a=0:1:51
    plot(r(1,i_verm),r(2,i_verm),'r.')
    %plot(r(1,i_verm(1)),r(2,i_verm(1)),'ro')
    axis equal,axis([-0.5 1.2 -0.5 1.2]),hold on
    plot(r(1,i_azul),r(2,i_azul),'b.')
    %plot(r(1,i_azul(1)),r(2,i_azul(1)),'-r')
    drawnow
    hold off
    x = find(r(2,:)>=0.5); % temos que encontrar os pontos que y>=0,5
    r = M_inv*r; % aplica-se a todos os pontos a transformação
    r(:,x) = r(:,x)+T_inv(:,x); % aos de y>=0,5 e que se aplica a trans
    pause(0.1)
end
