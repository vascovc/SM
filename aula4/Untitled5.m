%script exemplo
m=52; n=11;
%x=51.23;
%x=0.1;
%outros exemplos a testar
x=realmax;
%x=realmin
%x=eps
[rep_bin, erro]=binarioMatlab(x);
if erro
    fprintf(1, ' N?o ? poss?vel a representa??o bin?ria\n O n?mero ? demasiado grande ou pequeno\n')
else
fprintf(1,' Valor de x=%e\n Representa??o Bin?ria: Bit sinal +  %d bits parte fracionaria+%d  bits expoente =%d bits\n', x,m,n,m+n+1);

fprintf(1,' %s|%s|%s', rep_bin(m+n+1), rep_bin(m+n:-1:n),rep_bin(n:-1:1));
fprintf(1,'\n ')
end
 x=0;
% numero reconstruido
 for i=m:-1:1
     x=x+str2double(rep_bin(i+n))*2^(i-m-1);
 end
 e=0;
 for i=n:-1:1
     e=e+str2double(rep_bin(i))*2^(i-1);
 end
 e=e-1023;
 
 numero=(1+x)*2^e;
if rep_bin(m+n+1)=='1'
     numero=-numero;
end
fprintf(1,'Numero reconstruido= %e\n ',numero)
 
 function [rep_bin, erro]=binarioMatlab(x)
    m = 52;  %bits para a frac?ao ; 
    n = 11; %numero de bits para o expoente
    %1 bit para o sinal
    % numero total de bits=m+n+1=64

    erro=false; b=zeros(1,m+n+1); 
    rep_bin=num2str(b,'%u');
    %determina??o do expoente

    if x<0 
        b(m+n+1)=1;
        x=-x;
    end
    %determina??o do expoente
    x0=x; e=0;
    if x>=2
        while x >=2 
            e=e+1; x=x0/2^e;  
        end
    elseif x<1
        while x<1
            e=e-1; x=x0/2^e;       
        end
    end

    if e>1023 || e< -1022
        erro=true;
    end
    e=e+1023; x=x-1;
    for i=m:-1:1
        b(i+n)=floor(x/2^(i-m-1));
        x=x-b(i+n)*2^(i-m-1);
    end
    for i=n:-1:1
        b(i)=floor(e/2^(i-1));
        e=e-b(i)*2^(i-1);
    end
    rep_bin=num2str(b,'%u');
end