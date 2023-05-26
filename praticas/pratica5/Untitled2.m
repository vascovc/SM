clear all
close all
p1 = 0.01;p2 = 0.07;p3 = 0.07;p4 = 0.85;
p = [p1 p2 p3 p4];

a1 = [0 0; 0 0.16];b1 = [0;0];
a2 = [0.2 -0.26; 0.23 0.22];b2 = [0;1.6];
a3 = [-0.15 0.28; 0.26 0.24];b3 = [0;0.44];
a4 = [0.85 0.04; -0.04 0.85];b4 = [0;1.6];
a = [a1 a2 a3 a4]; b = [b1 b2 b3 b4];
P0 = [0;0];

for i=2:10000
    ind = roleta(p);
    A = [a(:,2*ind -1) a(:,2*ind)]
    P0(:,i) = A*P0(:,i-1)+b(ind);
    plot(P0(1,:),P0(2,:))
    drawnow;
    pause(0.01)
end

function caso = roleta(prob)
    pa_cum = 0;
    numero = rand(1);
    for i=1:length(prob) % vamos percorrer o vetor das probabilidades
        %numero = rand(1); %obtemos um valor ao acaso
        pa_cum = pa_cum+prob(i); % vamos acumulando as probabilidades
        if numero <= pa_cum % se o numero que obtivemos for menor ou igual 
                            % à probabilidade acumulada então acabou
            caso = i; %devolvemos o indice
            return
        end
    end
    % entao estamos sempre a gerar um novo numero no ciclo??
end
