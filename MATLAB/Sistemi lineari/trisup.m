function [x] = trisup(U, b)
%TRISUP Algoritmo di sostituzione all'indietro, O(n²)
    n = length(b);
    x = zeros(n,1);
    for i = n:-1:1
        s = 0;
        for j = i+1:n
            s = s + U(i,j)*x(j);
        end
        x(i) = (b(i)-s)/U(i,i);
    end
end