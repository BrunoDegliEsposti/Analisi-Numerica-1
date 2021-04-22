%% Esercizio 1

fprintf('\n n    cond(A)\t       errNoPP\t\tstimaNoPP\t resNoPP');
fprintf('\t  errPP\t\t   stimaPP\t    resPP\n');
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
    [x1, esito1] = gauss(A, b);
    [x2, esito2] = gaussPP(A, b);
    errNoPP   = norm(x-x1)/norm(x);
    errPP     = norm(x-x2)/norm(x);
    resNoPP   = norm(b-A*x1)/(norm(A)*norm(x1));
    resPP     = norm(b-A*x2)/(norm(A)*norm(x2));
    stimaNoPP = cond(A) * resNoPP;
    stimaPP = cond(A) * resPP;
    fprintf(' %02u %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e\n', ...
        n, cond(A), errNoPP, stimaNoPP, resNoPP, errPP, stimaPP, resPP);
end

%% Esercizio 2

fprintf('\n n    cond(A)\t       errNoPP\t\tstimaNoPP\t resNoPP');
fprintf('\t  errPP\t\t   stimaPP\t    resPP\n');
for n = 10:10:80
    A = eye(n) - tril(ones(n,n),-1);
    A(:, end) = 1;
    x = 1.1 + zeros(n, 1);
    b = A*x;
    [x1, esito1] = gauss(A, b);
    [x2, esito2] = gaussPP(A, b);
    errNoPP   = norm(x-x1)/norm(x);
    errPP     = norm(x-x2)/norm(x);
    resNoPP   = norm(b-A*x1)/(norm(A)*norm(x1));
    resPP     = norm(b-A*x2)/(norm(A)*norm(x2));
    stimaNoPP = cond(A) * resNoPP;
    stimaPP = cond(A) * resPP;
    fprintf(' %02u %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e\n', ...
        n, cond(A), errNoPP, stimaNoPP, resNoPP, errPP, stimaPP, resPP);
end

%% Esercizio 3

fprintf('\n n    cond(A)\t       errNoPP\t\tstimaNoPP\t resNoPP');
fprintf('\t  errPP\t\t   stimaPP\t    resPP\n');
for n = 4:2:14
    A = hilb(n);
    b = A*(1.1 + zeros(n, 1)) + [0; 5e-12; zeros(n-2, 1)];
    x = invhilb(n)*b;
    [x1, esito1] = gauss(A, b);
    [x2, esito2] = gaussPP(A, b);
    errNoPP   = norm(x-x1)/norm(x);
    errPP     = norm(x-x2)/norm(x);
    resNoPP   = norm(b-A*x1)/(norm(A)*norm(x1));
    resPP     = norm(b-A*x2)/(norm(A)*norm(x2));
    stimaNoPP = cond(A) * resNoPP;
    stimaPP = cond(A) * resPP;
    fprintf(' %02u %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e %16.8e\n', ...
        n, cond(A), errNoPP, stimaNoPP, resNoPP, errPP, stimaPP, resPP);
end

%% Esercizio 4

A = [1, 1, -1; 1, 5, 1; -1, 1, 11];
invA1 = gaussLU(A, [1; 0; 0]);
invA2 = gaussLU(A, [0; 1; 0]);
invA3 = gaussLU(A, [0; 0; 1]);
invA = [invA1, invA2, invA3];


