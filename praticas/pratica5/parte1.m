clear all
close all

s0 = 'F++F++F'; %sequencia original
sF = 'F-F++F-F'; % a substituiçao
for i=1:5
    s0 = substituir(s0,sF);%substitui-se
    graficar(s0)%desenha-se
end
function graficar(seq)
    aresta = [1;0];v=[0;0];%aresta inicial, ponto inicial
    ang = pi/3;%angulo de rotação
    Mrot = [cos(ang) -sin(ang); sin(ang) cos(ang)];%matriz rotação
    for i=1:length(seq)%percorre se a sequencia
        if seq(i) == 'F' %se o char for um F
            novoponto=[v(1,end);v(2,end)]+aresta;%o ponto passa a ser o ultimo mais a aresta
            v =[v, novoponto];%acrescenta-se às posições
        elseif seq(i) == '+' % se o char for +
            aresta=Mrot*aresta;%roda-se no sentido anti
        elseif seq(i) == '-' % se o char for -
            aresta=transpose(Mrot )*aresta;%sentido horario
        end
    end
    plot(v(1,:),v(2,:),'k-')%desenha se tudo
    axis equal
    drawnow
    pause(0.5)
end