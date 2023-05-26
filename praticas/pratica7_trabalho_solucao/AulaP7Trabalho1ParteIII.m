
clear all
close all
np=10;
a=20; b=10; R=0.5;
[r, erro]=posicoes_iniciais(a,b,R,np);
if erro
    pause;
end

v=5*rand(2,np); %velocidade inicial aleatoria
ep=[[1;0],[-1;0],[0;1],[0;-1]];
tmax=1000; t=0; dt=0.1;

while t<=tmax
    r0=r; v0=v;
    deltat_min=tmax; dtpij_min=tmax;
  
    % detecao de choques com as paredes
     dty0=(R-r(2,:))./v(2,:); dtyb=(b-R-r(2,:))./v(2,:);dtx0=(R-r(1,:))./v(1,:); dtxa=(a-R-r(1,:))./v(1,:);
    %  dtv e' uma matriz com os deltat de todas as particulas.
    dtv=[dtx0',dtxa',dty0',dtyb']; dtv(dtv<=4*eps)=tmax;
    [deltat,i]=min(dtv,[],2);
    [deltat,part]=min(deltat);
    i=i(part);
       
    if np>1
    % determina�ao do pr�ximo choque entre part�culas
    dtpij=tmax*ones(np,np);
    for ip1=1:np-1
         for ip2=ip1+1:np
             %considera todos os pares de particulas
             r12=r(:,ip1)-r(:,ip2); v12=v(:,ip1)-v(:,ip2);
             B=2*dot(r12,v12);
             A=norm(v12)^2;%
             C=norm(r12)^2-4*R^2;
             if B^2-4*A*C >4*eps && B<-4*eps %  ha choque
                  dtpij(ip2,ip1)=(-B-sqrt(B^2-4*A*C))/(2*A);
                  if dtpij(ip2,ip1)<=4*eps
                      dtpij(ip2,ip1)=tmax;
                  end
             end
         end
    end
    [deltatij,part2]=min(dtpij,[],2);
    [deltatij,part1]=min(deltatij);
    part2=part2(part1);
 end
    
    % determina-se se ha choque com as paredes ou choque entre particulas

      if deltat < deltatij
     
    %choques com as paredes ocorre antes de choque entre particulas
     v(:,part)=v(:,part)-2*dot(v(:,part),ep(:,i))*ep(:,i);
     
     %posi��o final 
     r=r0+v0*deltat;
     else
        %chocam duas particulas
        deltat = deltatij;
        r=r0+v*deltat; % na posicao do choque
        r21=r(:,part2)-r(:,part1); v21=v0(:,part2)-v0(:,part1);
        v(:,part1)=v0(:,part1)+dot(r21,v21)*r21/(4*R^2);
        v(:,part2)=v0(:,part2)-dot(r21,v21)*r21/(4*R^2);
        
   end
   
    %anima�ao
    animacao(r0, v0, a,b,R,dt,deltat);
    % avan�o do tempo
    t=t+deltat;
end

 
function animacao(r, v, a,b,R,dt,deltat)
figure(1)
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
       
