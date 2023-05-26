clear all
close all

center = [1 0]; % vamos usar as coordenadas polares
ro=2;
T=2.5; % o periodo
w=2*pi/T; % velocidade angular
for t=0:0.05:5
    x=ro*cos(w*t)+center(1); % o valor para x nas polares + centro
    y=ro*sin(w*t)+center(2); % o valor para y nas polares + centro
    
    vx=ro*w*(-sin(w*t)); % derivada em relaçao ao tempo
    vy=ro*w*cos(w*t); % derivada em relaçao ao tempo
    
    ax=ro*w*w*(-cos(w*t)); % derivada da velocidade em relaçao ao tempo
    ay=ro*w*w*(-sin(w*t)); % derivada da velocidade em relaçao ao tempo
    
    plot(x,y,'--')
    hold on
    quiver(x,y,vx,vy,0.2,'r') % para desenhar o vetor velocidade
    quiver(x,y,ax,ay,0.2,'y')
    axis([-3 4 -4 4])
    hold off
    pause(0.01)
end

close all
