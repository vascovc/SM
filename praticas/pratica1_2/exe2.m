clear all
close all

a = [1;1];
b = [1;-1];
c = [2;-5];
%quiver(xinicial,yinicial,vx,vy,0,'r')
xlim([-3,3])
ylim = xlim
%hold on % para podermos meter mais do que uma coisa no grafico
quiver(0,0,b(1),b(2),0,'b')
axis equal % fazer a escala certa

xini=[0;0;0];
yini=[0;0;0];
quiver(xini,yini,[a(1);b(1);c(1)],[a(2);b(2);c(2)],0,'b')
a'*b; % prova do produto interno ser 0
%close all

a = [a;0] %acrescenta coordenada
b = [b;0]
d = cross(a,b)

norm(d);
quiver3([0;0;0],[0;0;0],[0;0;0],[a(1);b(1);d(1)],[a(2);b(2);d(2)],[a(3);b(3);-d(3)],0,'black')
