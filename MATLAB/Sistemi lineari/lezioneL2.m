%% Esercizio 1
%#ok<*NASGU>

U = [10, -7, 0; 0, 2.5, 5; 0, 0, 6.2];
b = [12; 5; 6.2];
x = trisup(U, b);

%% Esercizio extra

F = eye(5) - triu(ones(5,5),1);
invF = eye(5);
for i = 1:5
    invF(:,i) = trisup(F, invF(:,i));
end

%% Esercizio 2

A = [1, 1, -1; 1, 5, 1; -1, 1, 11];
x = [1.1; 1.2; 1.3];
b = A * x;
xhat = gauss(A, b);
errore = norm(x-xhat)/norm(x);

%% Esercizio 3

% L'errore è puramente algoritmico, essendo la matrice ben condizionata
% (piccolo errore inerente) => L'algoritmo di Gauss è instabile!

fprintf('\n    ||x-x̂ ||inf\t        x1\t\t x̂ 1\t\t  cond\t\t ||r||inf\n');
for i = 1:17
    epsilon = 10^(-i);
    A = [epsilon, 0.5; 0.4, -0.3];
    b = [0.5; 0.1];
    xhat = gauss(A, b);
    x = [1-(3*epsilon)/(2+3*epsilon); 1-(4*epsilon)/(2+3*epsilon)];
    errore = norm(x-xhat, Inf);
    r = b - A*xhat;
    fprintf('%16.8e %16.8e %16.8e %16.8e %16.8e\n', ...
        errore, x(1), xhat(1), cond(A, Inf), norm(r, Inf));
end

%% Esercizio extra

A1 = randn(100, 100);
b1 = randn(100, 1);
A2 = randn(200, 200);
b2 = randn(200, 1);
ratio_gauss = timeit(@()gauss(A2, b2))/timeit(@()gauss(A1, b1));
ratio_matlab = timeit(@()A2\b2)/timeit(@()A1\b1);

%% Esercizio 4

A = [1e-8, 0.5; 0.4, -0.3];
b = [0.5; 0.1];
[x, LU, esito] = gaussLU(A, b);
L = eye(size(LU)) + tril(LU, -1);
U = triu(LU);
ro = max(max(abs(U))) / max(max(abs(A)));





