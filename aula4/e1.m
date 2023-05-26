clear all
close all

x = 87;
dec2bin(x);

% m = 7;
% for i = m:-1:1
%     b(i) = floor(x/2^(i-1));
%     x = x - b(i)*2^(i-1);
% end
% b(m:-1:1) 

m = 7; %87<2^7
n = 5; % parte fracionaria
for i = m+n:-1:1
    b(i) = floor(x/2^(i-1-n));
    x = x - b(i)*2^(i-1-n) % é o que vai ficando, comete-se o erro que é este
end

 b = b(m+n:-1:1) % como se vai ao contrario depois tem que se inverter
