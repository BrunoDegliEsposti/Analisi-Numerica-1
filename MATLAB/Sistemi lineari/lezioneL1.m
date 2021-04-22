%% Esercizio 2

A = [1, 1; 1001, 1000];
b = [2; 2001];
c = [2.001; 2001];
x = sistema2x2(A, b);
y = sistema2x2(A, c);
deltax = y-x;
deltab = c-b;
stimaK2A = (norm(deltax)*norm(b))/(norm(x)*norm(deltab));

%% Esercizio 3

K2A = norm2x2(A)*norm2x2(inv(A));

%% Esercizio 4

D = diag([-10, 2, 100, -56, 0.0025]);
K2D = cond_diag(D);

%% Esercizio 5

x = [1.1; 1.1];
fprintf('  i   err. relativo    condizionamento      xhat1\t     xhat2\n');
for i = 1:15
    epsilon = 10^(-i);
    A = [1.1+epsilon, 1; 1.1, 1];
    b = 1.1 * [2.1+epsilon; 2.1];
    xhat = sistema2x2(A,b);
    fprintf('%3.0f %16.8e %16.8e %16.8e %16.8e\n', ...
        i, norm(xhat-x)/norm(x), cond(A), xhat(1), xhat(2));
end






