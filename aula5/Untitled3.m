clear all; close all
s='X';
for n=1:6
    s=substituicao(s);
    io=0; n=length(s);
    a=pi*80/180; % angulo inicial
    r=[0;0]; % posição inicial
    graficoPlanta(s,a,r,io);
    axis equal; hold off; pause(1)
end

function sn=substituicao(s)
    n=length(s); ic=0;
    xs='F+[[X]-X]-F[-FX]+X'; fs='FF';
    for i=1:n
        if(s(i)=='X')
            sn(ic+1:ic+18)=xs;
            ic=ic+18;
        elseif s(i)=='F'
            sn(ic+1:ic+2)=fs;
            ic=ic+2;
        else
            sn(ic+1)=s(i);
            ic=ic+1;
        end
    end
end

function [i]=graficoPlanta(s,a,r,io)
    figure(1); n=length(s);
    i=io; % para saber em que ponto vai nainterpretação da string
    while (i<n)
    i=i+1;
    if(s(i)=='F')
        rn=[cos(a);sin(a)];
        plot([r(1),r(1)+rn(1)],[r(2),r(2)+rn(2)],'g-')
        drawnow; hold on
        r=r+rn;
    elseif s(i)=='-'
        a=a-pi*25/180;
    elseif s(i)=='+'
        a=a+pi*25/180;
    elseif s(i)=='['
        i=graficoPlanta(s,a,r,i); % inicia a
        %representação de um ramo; usa-se recursividade
    elseif s(i)==']'
        return % a função termina e volta a
        %representar o ramo anterior se for caso disso
    end
    end
end