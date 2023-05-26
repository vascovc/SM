clear all
close all

b = baseYpara10(12,"11")
a = base10parabase(5,6)%base - numero em decimal


function x = baseYpara10(Y,rep)
    x=0;
    rep = char(rep);
    for i=1:length(rep)
        x = str2num(rep(i))*Y^(length(rep)-i) + x;
    end
end

function str = base10parabase(y,num)
    str = "";
    r = 3;
    while r > 0
        r = rem(num,y);
        str = r+str;
        num = fix(num/y);
    end
end