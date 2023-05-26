%matriz de rotação de um ângulo theta em torno do eixo de vetor
%unitário [l,m,n]
P=[0, 1,1 ,-1,-1,1, 0; 0, 1,-1,-1, 1,1, 0;0, 2,2, 2, 2, 2,4];

plot3(P(1,:),P(2,:),P(3,:),'.');
plot3(P(1,7),P(2,7),P(3,7),'bo','MarkerFaceColor','b')
hold on; camproj('perspective')
plot3(P(1,2:6),P(2,2:6),P(3,2:6),'k-')
for ip=1:4
     plot3([P(1,1),P(1,ip+1)],[P(2,1),P(2,ip+1)],[P(3,1),P(3,ip+1)],'k-');
     plot3([P(1,7),P(1,ip+1)],[P(2,7),P(2,ip+1)],[P(3,7),P(3,ip+1)],'k-')
end
axis equal; axis([-3,3,-3,3,0,5]);view(45,20);

v=[1,0,0]; th=pi*15/180; %para rodar 15º em torno do eixo dos XX. Vetor versor para as dimensoes nao alterarem
l=v(1);m=v(2);n=v(3);
c=cos(th); s=sin(th);
M=[l^2 *(1-c)+c, m*l*(1-c)-n*s, n*l*(1-c)+m*s;
   l*m*(1-c)+n*s, m^2 *(1-c)+c, n*m*(1-c)-l*s;
   l*n*(1-c)-m*s, m*n*(1-c)+l*s, n^2*(1-c)+c];
P=M*P;
plot3(P(1,2:6),P(2,2:6),P(3,2:6),'k-')
for ip=1:4
     plot3([P(1,1),P(1,ip+1)],[P(2,1),P(2,ip+1)],[P(3,1),P(3,ip+1)],'k-');
     plot3([P(1,7),P(1,ip+1)],[P(2,7),P(2,ip+1)],[P(3,7),P(3,ip+1)],'k-')
end
axis equal; axis([-5,5,-5,5,0,10]);view(45,20); drawnow; hold off

