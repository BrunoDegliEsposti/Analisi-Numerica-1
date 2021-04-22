function [A] = matrice2k(n)
%MATRICE2K Costruisce la matrice dell'esercizio 1, Lab XI
    A = zeros(n, n);
    for i = 1:n
        for k = i+1-n:i
            if k > 0
                A(i,n+k-i) = 2^k;
            else
                A(i,n+k-i) = 2^(1/(2-k));
            end
        end
    end
end
