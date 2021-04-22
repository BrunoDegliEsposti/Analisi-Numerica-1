function [R, flag] = cholesky(A)
%CHOLESKY Fattorizzazione di Cholesky A = R'R con R triangolare superiore
    flag = 0;
    [n, ~] = size(A);
    R = zeros(n, n);
    if A(1, 1) <= 0
        flag = 1;
        R = NaN(n);
        return
    end
    R(1, 1) = sqrt(A(1, 1));
    for k = 2:n
        for i = 1:k-1
            R(i, k) = (A(i, k) - dot(R(1:i-1, i), R(1:i-1, k))) / R(i, i);
        end
        s = A(k, k) - dot(R(1:k-1, k), R(1:k-1, k));
        if s <= 0
            flag = k;
            return
        end
        R(k, k) = sqrt(s);
    end
end


