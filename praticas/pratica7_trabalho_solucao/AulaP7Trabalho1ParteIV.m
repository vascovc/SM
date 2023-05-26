
clear all
close all

i=0; tmax=500; npmax=50;
for np=10:5:npmax
    fprintf(1,'Calculos para np=%d\n',np)
    i=i+1;
    Ec=5*np;
    Fmedia(i)=trabalhoParteII(np,Ec,tmax);
    FmediaColisoes(i)=trabalhoParteIII(np,Ec,tmax);
end

h2=figure(2);
set(h2,'Units', 'Normalized', 'Position',[0.1,0.347,0.3653,0.5243])
np=10:5:npmax;
plot(np,Fmedia,'bx', np, FmediaColisoes, 'r+',np,3*np*5/10,'k-')
xlabel('np'); ylabel('Fmedia')
text(15,max([Fmedia,FmediaColisoes])*3/4,'+ vermelho - com  colisoes entre particulas')
text(15,max([Fmedia,FmediaColisoes])*3/4.5,'x azul - sem  colisoes entre particulas')

np=30; i=0;
for Ec=np:10:10*np
    fprintf(1,'Calculos para Ec/np=%d\n',Ec/np)
    i=i+1;

    Fmedia(i)=trabalhoParteII(np,Ec,tmax);
    FmediaColisoes(i)=trabalhoParteIII(np,Ec,tmax);
end
h3=figure(3);
set(h3,'Units', 'Normalized', 'Position',[0.5,0.347,0.3653,0.5243])
Ec=np:10:10*np;
plot(Ec,Fmedia,'bx', Ec, FmediaColisoes, 'r+',Ec,3*Ec/10,'k-')
xlabel('Ec'); ylabel('Fmedia')
text(15,max([Fmedia,FmediaColisoes])*3/4,'+ vermelho - com  colisoes entre particulas')
text(15,max([Fmedia,FmediaColisoes])*3/4.5,'x azul - sem  colisoes entre particulas')


function Fmedia=trabalhoParteII(np,Ec,tmax)
a=20; b=10; R=0.5;
r=rand(2,np); r(1,:)=r(1,:)*(a-2*R)+R; r(2,:)=r(2,:)*(b-2*R)+R;

v=randn(2,np); %velocidade inicial aleatoria
v=v-repmat(sum(v,2)/np,1,np); v=v*sqrt(2*Ec/sum(sum(v.^2)));
ep=[[1;0],[-1;0],[0;1],[0;-1]];
% determinacao de tempo de choque com paredes
 t=0; dt=0.05;
Fmedia=0;
nchoque=0;
while t<=tmax
    nchoque=nchoque+1;
    deltat_min=tmax;
    % refrescar as velocidades das particulas cada 10 np choques
    if floor(nchoque/(10*np))==nchoque/(10*np)
        v=randn(2,np); v=v-repmat(sum(v,2)/np,1,np); v=v*sqrt(2*Ec/sum(sum(v.^2)));
    end
    dty0=(R-r(2,:))./v(2,:); dtyb=(b-R-r(2,:))./v(2,:);dtx0=(R-r(1,:))./v(1,:); dtxa=(a-R-r(1,:))./v(1,:);
    %  dtv e' uma matriz com os deltat de todas as particulas.
    dtv=[dtx0',dtxa',dty0',dtyb']; dtv(dtv<=4*eps)=tmax;
    [deltat,i]=min(dtv,[],2);
    [deltat,part]=min(deltat);
    i=i(part);
   
    r=r+v*deltat;
    %choques com as paredes
    Fmedia=Fmedia-2*dot(v(:,part),ep(:,i));
    v(:,part)=v(:,part)-2*dot(v(:,part),ep(:,i))*ep(:,i);
    t=t+deltat;
   
    
end
Fmedia=Fmedia/t;
end

    
function Fmedia=trabalhoParteIII(np,Ec,tmax)
a=20; b=10; R=0.5;
[r, erro]=posicoes_iniciais(a,b,R,np);
if erro
    pause;
end

v=2*rand(2,np)-1; %velocidade inicial  aleatoria
ep=[[1;0],[-1;0],[0;1],[0;-1]];
 t=0; 

Fmedia=0; v=v-repmat(sum(v,2),1,np); v=v*sqrt(2*Ec/sum(sum(v.^2)));
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
    % determinacao do proximo choque entre particulas
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
     Fmedia=Fmedia-2*dot(v(:,part),ep(:,i));
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
    
    t=t+deltat;
     
end
 Fmedia=Fmedia/t;
end


 