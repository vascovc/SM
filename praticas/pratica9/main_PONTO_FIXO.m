clear all
close all
clc
% posçãoo inicial da bola
x0=0.05; y0=10; v0x=0; v0y=0; g=9.8;

%superficie
alfa=2; %entre 1 e 5
 
ti=0; t0=0.7; prec=1e-10; lambda=0.01;
%numero de colisoes
nc=20;
%deteminar instante de colisão
tf=pfixo(lambda,t0, prec,x0,y0,v0x,v0y,alfa,g);
 
for i=1:nc
    % fazer animacao
    dt=tf/20;
    for t=ti:dt:tf
        x=v0x*t+x0; 
        y=y0+v0y*t-0.5*g*t^2;
        vx=v0x; 
        vy=v0y-g*t;
        superf(alfa,x,y);
    end
    % fazer a colisãoo
    % direcao da normal
    grad=[2*alfa*x-4*x^3, 1];%o gradiente (x,y)
    grad=grad/norm(grad);%vetor unitario
    hold on
    quiver(x,y,grad(1),grad(2),0,'b');%vetor gradiente, perpendicular ao plano
    v=[vx;vy];%vetor velocidade no embate
    nv=norm(v);
    quiver(x,y,vx/nv,vy/nv,0,'r')%desenha-se

    vn=grad * v;% componente segundo a normal
    vp=[grad(2),-grad(1)]*v; % componente segundo a tangente
    vn=-vn; % refletir segundo a normal
    v=vn*grad'+vp*[grad(2);-grad(1)]; %reconstruçao da velocidade

    vx=v(1); vy=v(2);
    nv=norm(v);
    quiver(x,y,vx/nv,vy/nv,0,'k')
    hold off
    title(['colisão ' num2str(i)])
    %pause % a cada colisao
    % calcula o proximo instante de colisão
    x0=x; y0=y; v0x=v(1); v0y=v(2);

    tf=pesquisa_grosseira(0, 0.01,x0,y0,v0x,v0y,alfa,g);
    tf=pfixo(lambda,tf, prec,x0,y0,v0x,v0y,alfa,g);
end