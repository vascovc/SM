%script exemplo
% escreve real x em binario com virgula fixa usando m bits para a parte
% inteira e n bits para a parte fracionario
% numero total de bits m+n+1
x=2.23;
%x=0.1;
m=8; n=4;
[rep_bin, erro]=binario(x,m, n); % chama a fun??o binario definida em baixo
if erro
    % fprintf(1, ...) escreve texto na linha de comando
    % fprintf pode ser usada para escrever em ficheiros
    % \n representa nova linha
    fprintf(1, ' N?o ? poss?vel a representa??o bin?ria\n O n?mero ? demasiado grande\n')
else
    fprintf(1,' Valor de x=%f\n Representa??o Bin?ria: Bit sinal + %d bits parte inteira + %d bits parte fracionaria=%d bits\n', x,m,n,m+n+1);
    % %f  escreve uma variavel real em formato de virgula fixa
    % %d  escreve em formato de inteiro
    fprintf(1,' %s|%s.%s', rep_bin(m+n+1), rep_bin(m+n:-1:n),rep_bin(n:-1:1));
    %s representa escrever variavel string
    fprintf(1,'\n ') % apenas uma nova linha
end
x=0;
%numero reconstruido
for i=m+n:-1:1
    x=x+str2double(rep_bin(i))*2^(i-n-1);
end
if rep_bin(m+n+1)=='1'
    x=-x;
end
fprintf(1,'Numero reconstruido= %e\n ',x)
% %e escreve variavel real em formato exponencial

%defini??o da fun??o binario
function [rep_bin, erro]=binario(x,m, n)
%representa??o de um real em virgula fixa
% m = numero de bits para a parte inteira ; 
% n = numero de bits para a parte fracionaria
% numero total de bits=m+n+1
erro=false; % inicializa erro
b=zeros(1,m+n+1); % inicializa b a zeros
rep_bin=num2str(b,'%u'); % converte o vetor de numeros b em string
if floor(abs(x)) > 2^m-1
    erro=true; % impossivel representar a parte inteira com m bits
    return
elseif x<0
    b(m+n+1)=1; % determina o bit de sinal
    x=-x;
end
for i=m+n:-1:1
    b(i)=floor(x/2^(i-n-1)); % determina os bits da parte inteira e parte fracionaria
    x=x-b(i)*2^(i-n-1);
    % b(m+n),....,b(n+1) sao os bits da parte inteira 
    % b(n),...,b(1) sao os bits da parte fracionaria    
end
rep_bin=num2str(b,'%u');% converte o vetor de numeros b em string
end
    
    