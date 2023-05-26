
clear all
close all
np=10;
a=20; b=10; R=0.5;
r=rand(2,np); r(1,:)=r(1,:)*(a-2*R)+R; r(2,:)=r(2,:)*(b-2*R)+R;

v=randn(2,np); %velocidade inicial aleatoria
ep=[[1;0],[-1;0],[0;1],[0;-1]];
% determinacao de tempo de choque com paredes
tmax=100; t=0; dt=0.5;


while t<=tmax
    deltat_min=tmax;
    
    dty0=(R-r(2,:))./v(2,:); dtyb=(b-R-r(2,:))./v(2,:);dtx0=(R-r(1,:))./v(1,:); dtxa=(a-R-r(1,:))./v(1,:);
    %  dtv e' uma matriz com os deltat de todas as particulas.
    dtv=[dtx0',dtxa',dty0',dtyb']; dtv(dtv<=4*eps)=tmax;
    [deltat,i]=min(dtv,[],2);
    [deltat,part]=min(deltat);
    i=i(part);
   animacao(r, v, a,b,R,dt,deltat)
    r=r+v*deltat;
    %choques com as paredes
    v(:,part)=v(:,part)-2*dot(v(:,part),ep(:,i))*ep(:,i);
    t=t+deltat;
        
end  

         
function animacao(r, v, a,b,R,dt,deltat)

for t=0:dt:deltat
figure(1)
plot([0,a,a,0,0],[0,0,b,b,0],'k-')
hold on
plot(r(1,:),r(2,:),'ko','MarkerFaceColor','k', 'MarkerSize',2*R*14)
axis equal
axis([-1,a+1,-1,b+1])
drawnow
hold off
r=r+v*dt;
end
end    
