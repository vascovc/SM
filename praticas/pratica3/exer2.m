clear all
close all

%d)
n=8;
l=[2;0];
ang=2*pi/n;
rod=[cos(ang) -sin(ang);sin(ang) cos(ang)];
xini = 5; yini = 5;
x = 5; y = 5;
P = [xini;yini];
for i=2:n
    l(:,i)=rod*l(:,i-1);
    x = x + l(1,i-1);
    y = y + l(2,i-1);
    xini = [xini,x];
    yini = [yini,y];
end
axis equal
quiver(xini,yini,l(1,:),l(2,:))