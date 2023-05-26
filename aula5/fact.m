function f = fact(n)
    if n==1
        f = 1;return;
    else
        f = f*fact(n-1);
    end
end