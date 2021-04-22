function [s] = norma2_stabile(x)
    M = max(abs(x));
    s = M * sqrt(dot(x/M, x/M));
end

