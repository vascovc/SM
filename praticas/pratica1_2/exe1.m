clear all
a = [1 1] % faz vetor linha com ou sem ponto e virgula
a = [1; 1] % faz vetor coluna
b = [1, -1]
c = [2, -5]

numel(c);
norm(a);
norm(b);
norm(c);

x = c.*c % cada uma das coordenadas ao quadrado
norm(x)

%norma = sqrt(a*a) erro
%norma = sqrt(a'*a') erro
norma = sqrt(a*a');
norma = sqrt(sum(a.*a))