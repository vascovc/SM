clear all
close all
%a)
n=5;
ang = 2*pi/n;
Mrot = [cos(ang) -sin(ang);sin(ang) cos(ang)];
V1 = [1;0];
V = zeros(2,n);
V(:,1) = V1;
for i=2:n
    V(:,i)=Mrot*V(:,i-1);
end
V = [V V(:,1)];
figure(1)
plot(V(1,1),V(2,1),'ro',V(1,:),V(2,:),'b')
hold on
axis equal
V_or = V;

bx = 5;
%b)
d = 2;
trans = [d*cos(45);d*sin(45)];
trans = repmat(trans,1,n+1);
for a=1:bx
    V = trans+V;
    figure(2)
    plot(V(1,:),V(2,:),'black')
    hold on
    axis equal
end
hold off

%c)
V = V_or; % matriz do pentagono
ang = pi/3; d = 3;
rod = [cos(ang) -sin(ang);sin(ang) cos(ang)];
tr = [d;d];
tr = repmat(tr,1,n+1);
for a=0:bx-1
    V = rod*V;
    figure(3)
    V1 = V+a*tr;
    plot(V1(1,1),V1(2,1),'ro',V1(1,:),V1(2,:),'b')
    axis equal
    hold on
 end
 hold off