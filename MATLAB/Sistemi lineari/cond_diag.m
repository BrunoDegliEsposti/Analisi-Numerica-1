function [K] = cond_diag(A)
    K = max(abs(diag(A)))/min(abs(diag(A)));
end