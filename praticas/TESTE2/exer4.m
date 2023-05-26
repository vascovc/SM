clear all
close all
clc

k=1;m=1;
y(1)=0.8;
v0y=0;
dt=0.1;
fim=100;

%usando o metodo de Euler simples para o segundo valor uma vez que
%necessitamos de dois valores pois o metodo de verlet necessita
y(2)=y(1)+v0y*dt;
for i=2:100%ficamos com os pontos a cada decima de segundo
    y(i+1) = 2*y(i)-y(i-1)-dt^2*(k/m*sin(y(i)));
    axis([0 100 0 6])
    plot(i,y(i),'b*')
    hold on
    drawnow
end

for i=2:100
   if y(i-1)>y(1) && y(i+1)<y(1)%assim vamos conseguir obter o valor para o qual no tempo estamos mais perto do inicial e assim conseguimos determinar o periodo
        t=i;
        fprintf("valor de y %f\n",y(i))
   end
end
% o periodo é dado por t ou seja 9,6 segundos
T = dt*t;%o periodo em segundos
f = 1/T;
fprintf("A frequencia será %f Hz\n",f)