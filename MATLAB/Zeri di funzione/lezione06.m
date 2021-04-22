%% Esercizio 2
%#ok<*ASGLU>

f = @(x)  x.^3 - (2*sqrt(3)+1)*x.^2 + (3+2*sqrt(3))*x - 3;
fp = @(x) 3*x.^2 - (4*sqrt(3)+2)*x + 3+2*sqrt(3);
fplot(f, [0.5, 2]);
grid on; grid minor;
% Le radici sono 1 (singola), sqrt(3) (doppia)
[x, fx, it, ind] = newton1d_stampe(0.5, f, fp, 0, 1e-8, 0, 100, 0);
[x, fx, it, ind] = newton1d_stampe(2, f, fp, 0, 1e-8, 0, 100, 1);

%% Esercizio 3

g = @(x, a) (x.^2-a^2);
gp = @(x) 2*x;
[x, fx, it, ind] = newton1d_stampe(2, @(x)g(x,1), gp, 0, 3e-3, 0, 100, 0); % 4 iterazioni
[x, fx, it, ind] = newton1d_stampe(1+1e-4, @(x)g(x,1e-4), gp, 0, 3e-3, 0, 100, 0); % 16 iterazioni
[x, fx, it, ind] = newton1d_stampe(1+1e-8, @(x)g(x,1e-8), gp, 0, 1e-2, 0, 100, 0); % 29 iterazioni
[x, fx, it, ind] = newton1d_stampe(1+1e-12, @(x)g(x,1e-12), gp, 0, 3e-3, 0, 100, 0); % 43 iterazioni
[x, fx, it, ind] = newton1d_stampe(1, @(x)g(x,0), gp, 1e-5, 0, 0, 100, 1);
% impossibile ottenere cifre significative

%% Esercizio 4

[x, fx, it, ind] = newton1d_stampe(1.3917452, @atan, @(x)(1./(1+x.^2)), 0, 0, 1e-10, 100, 1);
% il numero magico è la soluzione di 2x-atan(x)*(1+x^2) = 0









