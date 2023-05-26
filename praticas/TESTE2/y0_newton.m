function y0 = y0_newton(c)
    y0=1; dy=1;
    while(dy)>1e-7
        der = 1-c*exp(-c*y0);%a derivada
        y01 = y0 - ( y0-1+exp(-c*y0) )/der;%o anterior menos o atual a dividir pela derivada
        dy = y01-y0;%o intervalo
        y0=y01;%atualizar variaveis
    end
end