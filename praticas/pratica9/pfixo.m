function tn=pfixo(lambda,t0, prec,x0,y0,v0x,v0y,alfa,g)
    [dy1,~]=dist(x0,y0,v0x,v0y,alfa,t0,g);
    tn=t0-lambda*dy1;
    [dy2,~]=dist(x0,y0,v0x,v0y,alfa,tn,g);
    %faz se primeiro a mao
    dy=dy2; 
    if (abs(dy1)< abs(dy2))%se estiver a divergir entao tem que se alterar
        lambda=-lambda;
        dy=dy1; tn=t0;
    end

    ni=0;
    while(abs(lambda*dy)>prec && ni<100000)
        ni=ni+1;
        [dy,~]=dist(x0,y0,v0x,v0y,alfa,tn,g);
        tn=tn-lambda*dy;%metodo do ponto fixo
    end
end
