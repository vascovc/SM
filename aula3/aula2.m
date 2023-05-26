clear all
close all

V1 = [1;0]; % vertice 1
n = 8; % numero lados
ang = 2*pi/n; % angulo rotaçao
M = [cos(ang) -sin(ang); sin(ang) cos(ang)]; % matriz de rotaçao
V(:,1)=V1; % atribuimos a V uma linha igual a V1
for i=2:n % ate ao numero de pontos
    V2=M*V1; % cria se um ponto que e rotaçao do anterior
    V=[V V2]; % adiciona se a matriz esse vetor
    V1=V2; % para repetir o ciclo
end
V=[V V(:,1)]
plot(V(1,:),V(2,:))
hold on
axis equal

amp = [1 0; 0 2]; % matriz de ampliaçao
V = amp*V
plot(V(1,:),V(2,:))
hold off