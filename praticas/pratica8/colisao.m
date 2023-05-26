 function [col,tcol, x1col,v1col,A,phi]=colisao(t0,v1_0,x1_0,A,phi,w,L,lmola,d0)
    t1=t0+0.01; t2=0; tcol=0;
    x1col=0; v2col=v1_0; x2col=0; v1col=0;
    
    %determinacao grosseira do intervalo
    for t=t1:0.01:200
        x1 = x1_0+v1_0*(t-t0);%a bola que vem
        x2 = A*cos(w*(t-t0)+phi)+L-lmola;%a bola na mola, oscilador harmonico
        distancia = dist(x1,x2,d0);%distancia entre elas
        if distancia>0%se distancia positiva entao o tempo incial pode ser esse, se ja for negativo passa a ser o final
            t1=t;
        else
            t2=t;
            break;
        end
    end
    %t1 imediatamente antes do embate
    %t2 depois do embate
    
    if t2==0%nao haverá colisao
        col=false;
        return;%acaba-se ai
    else
        col=true;%se ha colisao
    end
    
    while t2-t1 >1e-6
        t=0.5*(t1+t2);
        x1 = x1_0+v1_0*(t-t0);%a bola que vem
        x2 = A*cos(w*(t-t0)+phi)+L-lmola;%a bola na mola, oscilador harmonico
        distancia=dist(x1,x2,d0);
        if distancia<0
            t2=t;
        else
            t1=t;
        end
    end
    tcol=t;
    
    x1col=x1_0+v1_0*(tcol-t0);%a posicao da b_livre passa a ser a de colisão
    v2col=v1_0;% a velocidade do oscilador passa a ser a da b_livre
    x2col=x1col+d0;% a posicao do oscilador e a da bola mais duas vezes o raio de cada uma
    v1col=-w*A*sin(w*(tcol-t0)+phi);%a velocidade da b_livre passa a ser o do oscilador, deriva-se em ordem ao tempo
    
    A=sqrt(v2col^2/w^2+(x2col-L+lmola)^2);%nova amplitude
    phi=acos((x2col-L+lmola)/A); %phi esta no intervalo [0, pi] e o seno e positivo
    %nova fase
    
    if v2col >0 %pode ser preciso se nao poder ser esta a fase
        phi=2*pi-phi;
    end
end
