x=zeros(4,5)
y=randn(6,4)
z=zeros(1,10)
x(2,4)=5
y(5,2)=3
z(3)=100
v=2:4 % 
size(x)
%xy=[x y] numero de linhas diferentes. junta as matrizes uma ao lado da
%outra
xy = [x y']
a=xy(:,3) % coluna 3
b=xy(2,:) % linha 2 
numel(y) % numero de elementos 
c=y(y>0) % todos os valores da matriz maiores que 0
numel(y(y>0)) % numero de elementos positivos
y(2,v) % vai buscar os valores de y(2,2) y(2,3) y(2,4) por v = [2,3,4]