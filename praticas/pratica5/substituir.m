function subs = substituir(s0,sF)
    subs = [];
    for i=1:length(s0)
        if s0(i) == 'F' % a cada F corresponde a substituišao
            subs = [subs sF]; % a modificašao, tem que ser assim pois vamos substituir por mais que um character
        else
            subs = [subs s0(i)]; % mantemos igual
        end
    end
end