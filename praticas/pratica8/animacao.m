function animacao(L,dt, t0, tcol,x1_0,v1i,w,phi_0,lmola,A_0)
    for t=t0:dt:tcol
        x1=v1i*(t-t0)+x1_0;
        if x1<0%sair do desenho 
            return;
        end
        x2=L-lmola+A_0*cos(w*(t-t0)+phi_0);
        plot(x1,0,'r.', 'MarkerSize',40)
        hold on
        quiver(x1,0,v1i,0,0)
        axis([0, L+0.5, -0.5,0.5])
    
        plot(x2,0,'b.','MarkerSize',40)
        plot([x2,L],[0,0],'b-','Linewidth',3)
        plot([0,L],[-0.027,-0.027],'k-',[L,L],[-0.027,0.1],'k-',[L,L+0.5],[0.1,0.1],'k-')
        drawnow 
        hold off
    end
end
