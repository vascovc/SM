clear all
close all

x = 87;
%a = dec2bin(x);

m = 7; %87<2^7
n = 5;
c = binario(45,7,3)
function [b] = binario(x,m,n)
    for i = m+n:-1:1
        b(i) = floor(x/2^(i-1-n));
        x = x - b(i)*2^(i-1-n) % é o que vai ficando, comete-se o erro que é este
    end
    b = b(m+n:-1:1)
end
