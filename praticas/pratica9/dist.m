function [dy,der]=dist(x0,y0,v0x,v0y,alfa,t,g)
    x=x0+v0x*t;%posicoes do x
    dy=y0+v0y*t-0.5*g*t^2+alfa*x^2 -x^4-6;%a distancia, a do y menos a da curva
    der=v0y-g*t+2*alfa*x*v0x-4*x^3*v0x;%derivada de de dy em ordem ao tempo tendo atençao que x depende de t
end
