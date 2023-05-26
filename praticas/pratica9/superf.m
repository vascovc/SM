function superf(alfa,x,y)
    xs= -2:0.01:2;%pontos para o x
    ys= -alfa*xs.^2+xs.^4+6;%superficie em y
    figure(1)
    plot(xs,ys,'b-',x,y,'ro')%a linha do chao
    axis([min(xs), max(xs), min(ys)-0.2*max(ys), max(ys)])
    axis off % para desaparecerem as linhas do grafico
    axis square %para ficar mais bonito
    %axis equal
    drawnow
    hold on
end
