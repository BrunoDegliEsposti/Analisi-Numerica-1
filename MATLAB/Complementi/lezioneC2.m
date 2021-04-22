%% Esercizio 1

t = [ 1.01; 1.02; 1.04; 1.05; 1.06;  1.08;  1.09; 1.10];
b = [-2.29; 2.75; 1.76; 0.42; 0.25; -0.42; -0.92; 3.50];
for n = 3:6
    A = fliplr(vander(t)); A = A(:, 1:n);
    % Equazioni normali
    % Si potrebbe usare Cholesky: R = chol(M); x1 = R\(R'\d);
    % Tuttavia per n=6 chol non riconosce più M come definita positiva
    M = A'*A;
    d = A'*b;
    x1 = M\d;
    % Fattorizzazione QR
    [Q, R] = qr(A);
    b2 = Q'*b;
    R1 = R(1:n,:);
    x2 = R1\b2(1:n);
    % Plot
    xval = linspace(1.0, 1.11, 1000);
    fval1 = polyval(flipud(x1),xval);
    fval2 = polyval(flipud(x2),xval);
    figure(n);
    plot(t, b, 'o', xval, fval1, xval, fval2);
    grid on;
    legend('Dati','Equazioni normali','Fattorizzazione QR');
    r = norm(A*x1-b);
    tantheta = r/norm(A*x1);
    KLS = cond(A)*(1+tantheta*cond(A));
end

%% Esercizio 2

t = (1:7)';
y = [0.5; 2.5; 2.0; 4.0; 3.5; 6.0; 5.5];
p = polyfit(t,y,1); % y = 0.8393x + 0.0714
xval = linspace(0, 8, 1000);
fval = polyval(p, xval);
plot(t, y, 'o', xval, fval);
grid on;
maxr = max(abs(y-polyval(p,t)));




