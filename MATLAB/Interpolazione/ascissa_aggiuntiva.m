function [Pval, x, A] = ascissa_aggiuntiva(xhat, fhat, x, A, xval, Pval)
%ascissa_aggiuntiva aggiunge un'altra ascissa di interpolazione
    n = length(x)-1;
    Ahat = fhat;
    for j = 1:n+1
        Ahat = (Ahat-A(j)) / (xhat-x(j));
    end
    x = [x, xhat];
    A = [A, Ahat];
    xvalhat = ones(1, length(xval));
    for j = 1:n+1
        xvalhat = xvalhat .* (xval - x(j));
    end
    Pval = Pval + Ahat*xvalhat;
end

