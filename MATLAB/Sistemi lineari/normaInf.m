function [n] = normaInf(A)
    n = max(sum(abs(A')));
end

