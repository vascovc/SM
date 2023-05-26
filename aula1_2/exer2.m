%{
nome='X='
valor='23'
size(nome)
eq = [nome valor]
eq2 = strcat(nome,valor)
eq==eq2
strcmp(eq,eq2)
eq(3:end)

eq(3:end)==23
%}
%{
clear all
nome='X='
valor='23'

%%%%%
size(nome)
% número das dimensões de nome
eq = [nome valor]
eq2= strcat(nome,valor) % concatenaçao das strings
eq==eq2
strcmp(eq,eq2) % 
eq(3:end)
eq(3:end)==23 % tipos diferentes string e numero
s=abs(eq)
char(s(1))
% tipos diferentes?
% codigos ascii
strfind(eq,'23')
% retorna posição onde 23 está na string eq
valor+2
% erro ?
str2num(valor)+2 % número com o qual se fazem contas...
%}

P = [ 0 1 1 0 0; 0 0 1 1 0]

plot(P(1,:),P(2,:),'r')% dá a primeira linha para os x e depois a segunda linha da matriz para os y
axis([-1,2,-1,2])
axis equal
%close all

X = [5;5]
B = repmat(X,[1,5]) % cria cópias da matriz X 1 vez por linha e 5 pelas colunas
M = [cos(35) -sin(35); sin(35) cos(35)] % matriz de rotação
A = M*P

plot(A(1,:),A(2,:),'r-')

s=[24 2 -24];
total=0;
for n= s
    total = total + n
end