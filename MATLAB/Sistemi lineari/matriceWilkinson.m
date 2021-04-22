function [A] = matriceWilkinson(n)
%MATRICEWILKINSON Costruisce la matrice dell'esercizio 2, Lab XI
    A = eye(n) - tril(ones(n,n),-1);
    A(:, end) = 1;
end
