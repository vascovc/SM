clear all
close all

n = 4;
ang = 2*pi/n;
M = [cos(ang) -sin(ang); sin(ang) cos(ang)];
v = zeros(2,n+1);
v(:,1) = [1;1];
for i=2:n+1
        v(:,i)= M*v(:,i-1);
end
% matriz v com os pontos do poligono

%translaçao
tr = [3;2];
tr = repmat(tr,1,n+1); % matriz de translaçao
v_tr = v+tr; % matriz com a translaçao
plot(v(1,:),v(2,:),'k',v(1,1),v(2,1),'ko')
hold on
axis equal
axis([-5 5 -5 5]);
plot(v_tr(1,:),v_tr(2,:),'b',v_tr(1,1),v_tr(2,1),'bo')
%hold off

%rotaçao
tr = [-1;2];
tr = repmat(tr,1,n+1); % esta parte serve para se fazer a trans
ang = pi/4;
rod = [cos(ang) -sin(ang); sin(ang) cos(ang)];
v_rod = rod*v + tr; % matriz com os pontos rodados
plot(v_rod(1,:),v_rod(2,:),'r',v_rod(1,1),v_rod(2,1),'ro')
%hold off

%ampliações
tr = [-1;-3];
tr = repmat(tr,1,n+1);
x = 0.5; y = 0.2; % contas nas coordenadas
amp = [x 0; 0 y];
v_amp = amp*v + tr; % matriz com a ampliação
plot(v_amp(1,:),v_amp(2,:),'y',v_amp(1,1),v_amp(2,1),'yo')
%hold off

%distorção
tr = [-1;3];
tr = repmat(tr,1,n+1);
ang = -pi/3;
dist = [1 -sin(ang); 0 1]; % as paralelas ao xx mantem-se
dist1 = [1 0; cos(ang) 1]; % as paralelas ao yy mantem-se
v_dist = dist1*v + tr;
plot(v_dist(1,:),v_dist(2,:),'g',v_dist(1,1),v_dist(2,1),'go')
%hold off

%distorção2
tr = [0;2];
tr = repmat(tr,1,n+1);
k = 2;
dist = [k 0; 0 1/k]; % estica em x e comprime em y k>0
v_dist = dist*v + tr;
plot(v_dist(1,:),v_dist(2,:),'-',v_dist(1,1),v_dist(2,1),'o')
hold off