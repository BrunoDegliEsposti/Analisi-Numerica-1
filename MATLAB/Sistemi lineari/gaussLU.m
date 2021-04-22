function [x, A, esito] = gaussLU(A, b)
%GAUSSLU Metodo di eliminazione di Gauss con fattorizzazione LU compatta
    esito = 0;
    n = length(b);
    x = zeros(n,1);
    for k = 1:n-1
        if A(k,k) == 0
            esito = k;
            return
        end
        for i = k+1:n
            m = A(i,k)/A(k,k);
            A(i, k) = m;                        % memorizza m
            for j = k+1:n
                A(i,j) = A(i,j) - m*A(k,j);
            end
            b(i) = b(i) - m*b(k);
        end
    end
    if A(n,n) == 0
        esito = n;
        return
    end
    x = trisup(A, b);
end

