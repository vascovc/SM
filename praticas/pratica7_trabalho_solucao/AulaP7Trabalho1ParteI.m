
clear all
close all
a=20; b=10; R=0.5;
r=[a/2;b/2];

v=5*(2*rand(2,1)-1); %velocidade inicial aleatoria
ep=[[1;0],[-1;0],[0;1],[0;-1]];
% determinacao de tempo de choque com paredes
tmax=100; t=0; dt=0.1;

while t<=tmax
    dty0=(R-r(2))/v(2); dtyb=(b-R-r(2))/v(2);dtx0=(R-r(1))/v(1); dtxa=(a-R-r(1))/v(1);
    dtv=[dtx0,dtxa,dty0,dtyb]; dtv(dtv<=4*eps)=tmax;
    [deltat,i]=min(dtv); 
    animacao(r,v,a,b,R,dt,deltat)
    r=r+v*deltat;
    %choques com as paredes
    v=v-2*dot(v,ep(:,i))*ep(:,i); 
    t=t+deltat;
end    
   
        

function animacao(r, v, a,b,R,dt,deltat)
for t=0:dt:deltat

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
