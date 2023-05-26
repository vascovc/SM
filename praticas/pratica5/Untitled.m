clear all
close all

s0 = 'F++F++F'; %sequencia original
sF = 'F-F++F-F'; % a substituiçao
a = substituir(s0,sF)
function subs = substituir(s0,sF)
    subs = [];
    for i=1:length(s0)
        if s0(i) == 'F' % a cada F corresponde a substituiçao
            subs = [subs sF]; % a modificaçao, tem que ser assim pois vamos substituir por mais que um character
        else
            subs = [subs s0(i)]; % mantemos igual
        end
    end
end

function a = graficar(seq)
    for i=1:len(seq)
        ang = 60;
        Mrot = [cos(ang -sin(ang); sin(ang) cos(ang)];
        
        if seq(i) == 'F' %se o char for um F
            
        elseif seq(i) == '+' % se o char for +
            
        else % se o char for -
            
        end
    end
end