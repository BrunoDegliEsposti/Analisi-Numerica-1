function [x, esito] = gaussPP(A, b)
%GAUSSPP Metodo di eliminazione di Gauss con pivoting parziale
    esito = 0;
    n = length(b);
    x = zeros(n,1);
    for k = 1:n-1
        % scambia la riga k-esima con la riga che ha il pivot massimo
        [m, offset_pivot] = max(abs(A(k:end, k)));
        riga_nuovo_pivot = offset_pivot + k - 1;
        if m == 0
            % tutta la sottocolonna è 0, la matrice è singolare
            esito = k;
            return
        end
        if m > abs(A(k, k))
            % m è un pivot migliore di quello sulla diagonale,
            % conviene scambiare le righe
            A([k riga_nuovo_pivot], :) = A([riga_nuovo_pivot, k], :);
            b([k riga_nuovo_pivot], :) = b([riga_nuovo_pivot, k], :);
        end
        for i = k+1:n
            m = A(i,k)/A(k,k);
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



