clear all
close all

th=pi/4;
A1=[cos(th) -sin(th);sin(th) cos(th)]/sqrt(2);
A2=[cos(pi-th) -sin(pi-th);sin(pi-th) cos(pi-th)]/sqrt(2);

b1 = [0;0];
b2 = [1;0];
r0 = [0;0];
p1=0.5;
p2=0.5;
N=10000;
r=zeros(2,N);
caso=zeros(1,N);
r(:,1)=r0;
for i=2:N
    x = rand(1);
    if x < p1
        A=A1; b=b1;caso(i)=1;
    else
        A=A2; b=b2;caso(i)=2;
    end
    r(:,i)=A*r(:,i-1)+b;
end
caso1 = find(caso==1);
caso2 = find(caso==2);
plot(r(1,caso1),r(2,caso1),'r.',r(1,caso2),r(2,caso2),'b.')