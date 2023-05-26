function caso=roleta(p)
    %p é um vetor com a probabilidade de cada caso a soma dos pn deve ser 1
    pacum=0; n=length(p);
    for i=1:n
        pacum=pacum+p(i);
        numero_aleatorio=rand(1);
        if (numero_aleatorio <= p_acum)
            caso=i;
            return
        end
    end
end