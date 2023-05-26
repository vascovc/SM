function dy = dist(x,r0,v0,m)
    t = (x-r0(1))/v0(1);%tempo = x - x0 a dividir por v0
    y_proj = r0(2) + v0(2)*t-0.5*9.8*t^2;
    dy = y_proj-m*x;%distancia vai ser o y do proj menos a reta
end
