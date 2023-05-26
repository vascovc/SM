clear all
close all

a1 = [0 0; 0 0.16];b1 = [0;0];
a2 = [0.2 -0.26; 0.23 0.22];b2 = [0;1.6];
a3 = [-0.15 0.28; 0.26 0.24];b3 = [0;0.44];
a4 = [0.85 0.04; -0.04 0.85];b4 = [0;1.6];
p1 = 0.01;p2 = 0.07;p3 = 0.07;p4 = 0.85;

caso = zeros(1,10001);
v = zeros(2,100001);
for i=1:10000
    x = rand(1);
    if x<p1
        caso(i) = 1;
        A = a1; B = b1;
    elseif x<p1+p2
        caso(i) = 2;
        A = a2; B = b2;
    elseif x<p1+p2+p3
        caso(i) = 3;
        A = a3; B = b3;
    else
        caso(i) = 4;
        A = a4; B = b4;
    end
    v(:,i+1) = A*v(:,i)+B;
end
c1 = find(caso==1);
c2 = find(caso==2);
c3 = find(caso==3);
c4 = find(caso==4);
plot(v(1,c1),v(2,c1),'k.',v(1,c2),v(2,c2),'r.',v(1,c3),v(2,c3),'b.',v(1,c4),v(2,c4),'g.')