%% Esercizio 1.1

fprintf('\n n    cond(A)\t       errNoPP\t\tstimaNoPP\t resNoPP');
fprintf('\t  errPP\t\t   ro\t\t    resPP\n');
for n = 5:5:20
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
    x = 1.1 + zeros(n, 1);
    b = A*x;
    [x1, esito] = gauss(A, b);
    [L, U, P] = lu(A);
    x2 = U\(L\(P*b));
    ro = max(max(abs(U)))/max(max(abs(A)));
    errNoPP   = norm(x-x1)/norm(x);
    errPP     = norm(x-x2)/norm(x);
    resNoPP   = norm(b-A*x1)/(norm(A)*norm(x1));
    resPP     = norm(b-A*x2)/(norm(A)*norm(x2));
    stimaNoPP = cond(A) * resNoPP;
    stimaPP = cond(A) * resPP;
    fprintf(' %02u %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e\n', ...
        n, cond(A), errNoPP, stimaNoPP, resNoPP, errPP, ro, resPP);
end

%% Esercizio 1.2

fprintf('\n n    cond(A)\t       errNoPP\t\tstimaNoPP\t resNoPP');
fprintf('\t  errPP\t\t   ro\t\t    resPP\n');
for n = 10:10:80
    A = eye(n) - tril(ones(n,n),-1);
    A(:, end) = 1;
    x = 1.1 + zeros(n, 1);
    b = A*x;
    [x1, esito] = gauss(A, b);
    [L, U, P] = lu(A);
    x2 = U\(L\(P*b));
    ro = max(max(abs(U)))/max(max(abs(A)));
    errNoPP   = norm(x-x1)/norm(x);
    errPP     = norm(x-x2)/norm(x);
    resNoPP   = norm(b-A*x1)/(norm(A)*norm(x1));
    resPP     = norm(b-A*x2)/(norm(A)*norm(x2));
    stimaNoPP = cond(A) * resNoPP;
    stimaPP = cond(A) * resPP;
    fprintf(' %02u %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e\n', ...
        n, cond(A), errNoPP, stimaNoPP, resNoPP, errPP, ro, resPP);
end

%% Esercizio 1.3

fprintf('\n n    cond(A)\t       errNoPP\t\tstimaNoPP\t resNoPP');
fprintf('\t  errPP\t\t   ro\t\t    resPP\n');
for n = 4:2:14
    A = hilb(n);
    b = A*(1.1 + zeros(n, 1)) + [0; 5e-12; zeros(n-2, 1)];
    x = invhilb(n)*b;
    [x1, esito] = gauss(A, b);
    [L, U, P] = lu(A);
    x2 = U\(L\(P*b));
    ro = max(max(abs(U)))/max(max(abs(A)));
    errNoPP   = norm(x-x1)/norm(x);
    errPP     = norm(x-x2)/norm(x);
    resNoPP   = norm(b-A*x1)/(norm(A)*norm(x1));
    resPP     = norm(b-A*x2)/(norm(A)*norm(x2));
    stimaNoPP = cond(A) * resNoPP;
    stimaPP = cond(A) * resPP;
    fprintf(' %02u %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e\n', ...
        n, cond(A), errNoPP, stimaNoPP, resNoPP, errPP, ro, resPP);
end

%% Esercizio 2

A = [10, 2, 3, 1; 2, 10, -2, -1; 3, -2, 10, 5; 1, -1, 5, 3];
B = [10, 2, 3, 1; 2, 10, -2, -1; 3, -2, 10, 5; 1, -1, 5, 1];
[R1, flag1] = cholesky(A);
[R2, flag2] = cholesky(B);

%% Esercizio 3.1
% La matrice non è definita positiva

%% Esercizio 3.2
% La matrice non è simmetrica

%% Esercizio 3.3

fprintf('\n n    cond(A)\t       errNoPP\t\tstimaNoPP\t resNoPP');
fprintf('\t  errChol\t   stimaChol\t    resChol\n');
for n = 4:2:12
    A = hilb(n);
    b = A*(1.1 + zeros(n, 1)) + [0; 5e-12; zeros(n-2, 1)];
    x = invhilb(n)*b;
    [x1, esito] = gauss(A, b);
    [R, flag] = cholesky(A);
    x2 = R\(R'\b);
    errNoPP   = norm(x-x1)/norm(x);
    errChol   = norm(x-x2)/norm(x);
    resNoPP   = norm(b-A*x1)/(norm(A)*norm(x1));
    resChol   = norm(b-A*x2)/(norm(A)*norm(x2));
    stimaNoPP = cond(A) * resNoPP;
    stimaChol = cond(A) * resChol;
    fprintf(' %02u %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e\n', ...
        n, cond(A), errNoPP, stimaNoPP, resNoPP, errChol, stimaChol, resChol);
end

%% Esercizio 4.1

fprintf('\n n    cond(A)\t       errNoPP\t\tstimaNoPP\t resNoPP');
fprintf('\t  errQR\t\t   stimaQR\t    resQR\n');
for n = 5:5:20
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
    x = 1.1 + zeros(n, 1);
    b = A*x;
    [x1, esito] = gauss(A, b);
    [Q, R] = qr(A);
    x2 = R\(Q'*b);
    errNoPP   = norm(x-x1)/norm(x);
    errQR     = norm(x-x2)/norm(x);
    resNoPP   = norm(b-A*x1)/(norm(A)*norm(x1));
    resQR     = norm(b-A*x2)/(norm(A)*norm(x2));
    stimaNoPP = cond(A) * resNoPP;
    stimaQR = cond(A) * resQR;
    fprintf(' %02u %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e\n', ...
        n, cond(A), errNoPP, stimaNoPP, resNoPP, errQR, stimaQR, resQR);
end

%% Esercizio 4.2

fprintf('\n n    cond(A)\t       errNoPP\t\tstimaNoPP\t resNoPP');
fprintf('\t  errQR\t\t   stimaQR\t    resQR\n');
for n = 10:10:80
    A = eye(n) - tril(ones(n,n),-1);
    A(:, end) = 1;
    x = 1.1 + zeros(n, 1);
    b = A*x;
    [x1, esito] = gauss(A, b);
    [Q, R] = qr(A);
    x2 = R\(Q'*b);
    errNoPP   = norm(x-x1)/norm(x);
    errQR     = norm(x-x2)/norm(x);
    resNoPP   = norm(b-A*x1)/(norm(A)*norm(x1));
    resQR     = norm(b-A*x2)/(norm(A)*norm(x2));
    stimaNoPP = cond(A) * resNoPP;
    stimaQR = cond(A) * resQR;
    fprintf(' %02u %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e\n', ...
        n, cond(A), errNoPP, stimaNoPP, resNoPP, errQR, stimaQR, resQR);
end

%% Esercizio 4.3

fprintf('\n n    cond(A)\t       errNoPP\t\tstimaNoPP\t resNoPP');
fprintf('\t  errQR\t\t   stimaQR\t    resQR\n');
for n = 4:2:14
    A = hilb(n);
    b = A*(1.1 + zeros(n, 1)) + [0; 5e-12; zeros(n-2, 1)];
    x = invhilb(n)*b;
    [x1, esito] = gauss(A, b);
    [Q, R] = qr(A);
    x2 = R\(Q'*b);
    errNoPP   = norm(x-x1)/norm(x);
    errQR     = norm(x-x2)/norm(x);
    resNoPP   = norm(b-A*x1)/(norm(A)*norm(x1));
    resQR     = norm(b-A*x2)/(norm(A)*norm(x2));
    stimaNoPP = cond(A) * resNoPP;
    stimaQR = cond(A) * resQR;
    fprintf(' %02u %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e\n', ...
        n, cond(A), errNoPP, stimaNoPP, resNoPP, errQR, stimaQR, resQR);
end


