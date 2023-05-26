function t=pesquisa_grosseira(t0, prec,x0,y0,v0x,v0y,alfa,g)
    t=t0+prec;
    d=dist(x0,y0,v0x,v0y,alfa,t,g);
     while d>0%enquanto a distancia for positiva
         t=t+prec;
         d=dist(x0,y0,v0x,v0y,alfa,t,g);
     end
end
