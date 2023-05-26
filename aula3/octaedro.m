close all
clear all

P=[0, 1,1 ,-1,-1,1, 0; 0, 1,-1,-1, 1,1, 0;0, 2,2, 2, 2, 2,4];
% plot3(P(1,:),P(2,:),P(3,:),'.');
% plot3(P(1,7),P(2,7),P(3,7),'bo','MarkerFaceColor','b')
% hold on; camproj('perspective')
% plot3(P(1,2:6),P(2,2:6),P(3,2:6),'k-')
% for ip=1:4
%      plot3([P(1,1),P(1,ip+1)],[P(2,1),P(2,ip+1)],[P(3,1),P(3,ip+1)],'k-');
%      plot3([P(1,7),P(1,ip+1)],[P(2,7),P(2,ip+1)],[P(3,7),P(3,ip+1)],'k-')
% end
% axis equal; axis([-3,3,-3,3,0,5]);view(45,20); hold off

w = 2*pi/8;
for t=0:0.5:20
    M = [cos(w) -sin(w) 0 ;sin(w) cos(w) 0;0 0 1];
    P = M*P
    plot3(P(1,:),P(2,:),P(3,:),'.');
    plot3(P(1,6),P(2,6),P(3,6),'bo','MarkerFaceColor','b')
    hold on; camproj('perspective')
    plot3(P(1,2:6),P(2,2:6),P(3,2:6),'k-')
    for ip=1:4
         plot3([P(1,1),P(1,ip+1)],[P(2,1),P(2,ip+1)],[P(3,1),P(3,ip+1)],'k-');
         plot3([P(1,7),P(1,ip+1)],[P(2,7),P(2,ip+1)],[P(3,7),P(3,ip+1)],'k-')
    end
    axis equal; axis([-3,3,-3,3,0,5]);view(70,45); hold off
    pause(0.5)
end