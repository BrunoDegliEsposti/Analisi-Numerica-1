function [y] = a_tratti(x)
    if x <= 0
        y = 4*x;
    else
        y = 4*sin(x);
    end
end