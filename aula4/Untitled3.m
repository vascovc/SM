% exemplo simples
x=87
% O Matlab tem a fun??o dec2bin(x) que converte inteiro em binario
nb=7; %numero de bits
for n=nb:-1:1
    bit(n)=floor(x/2^(n-1));
    x=x-bit(n)*2^(n-1);
end
bit(nb:-1:1)
%reconstru??o do inteiro
y=0;
for n=1:nb
    y=y+bit(n)*2^(n-1);
end
y