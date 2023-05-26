clear all
close all

n = 9; raio = 2;
ang = 2*pi/n;
T = 5; % periodo da volta do poligono
t1 = 3; % periodo do poligono sobre si mesmo
wt = 2*pi/T; % velocidade angular do poligono sobre ele mesmo
w = 2*pi/t1; % velocidade angular do poligono à volta
ro = 2; %raio da circunferencia
v(1,1) = 1;v(2,1) = 0;%coordenadas do primeiro ponto do poli

Mrot = [cos(ang) -sin(ang);sin(ang) cos(ang)];
for i=2:n+1
        v(:,i)= Mrot*v(:,i-1);
end
% matriz da figura, apenas ela qual for

for t=0:0.25:20
    Mrot = [cos(wt) -sin(wt);sin(wt) cos(wt)]; % matriz de rotaçao do polig sobre ele mesmo
%     for j = 1:n+1
%         v(:,j)=Mrot*v(:,j); 
%     end %ou ciclo ou so assim
    v=Mrot*v;%melhor
    % aqui estamos a rodar a figura sobre ela mesma
    
    plot(v(1,:)+ro*cos(w*t),v(2,:)+ro*sin(w*t),'r',v(1,1)+ro*cos(w*t),v(2,1)+ro*sin(w*t),'bo')
    hold on
    % ao adicionarmos ro*trig(w*t) fazemos a translação dos pontos segundo
    % as coordenadas polares, multiplica se pelo tempo pois vai variando ao
    % longo do tempo // segunda parte do plot e para se ver sempre o mesmo
    % ponto a rodar
    phi=[0:2*pi/30:2*pi];
    plot(2*cos(phi),2*sin(phi),'k--')
    % assim obtemos a linha
    axis([-5 5 -5 5])
    hold off
    pause(0.25)
end

pause(2)
close all