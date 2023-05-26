function tn=newton(tn, prec,x0,y0,v0x,v0y,alfa,g)
    dy=10000; der=1;
    ni=0;
    while(abs(dy)>prec && ni<10000)
        ni=ni+1;
        [dy,der]=dist(x0,y0,v0x,v0y,alfa,tn,g);
        tn=tn-dy/der;%metodo newton
    end
end
