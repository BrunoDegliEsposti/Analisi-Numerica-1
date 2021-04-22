%% Esercizio 1
%#ok<*ASGLU>

f = @(x)  x.^3 - (2*sqrt(3)+1)*x.^2 + (3+2*sqrt(3))*x - 3;
[x, fx, it, ind] = secanti_stampe(1.2, 1.1, f, 0, 1e-8, 0, 100, 0); % 8 iterazioni
[x, fx, it, ind] = secanti_stampe(1.9, 1.8, f, 0, 1e-8, 0, 100, 1); % 31 iterazioni

%% Esercizio 2

f = @(x)  x.^3 - (2*sqrt(3)+1)*x.^2 + (3+2*sqrt(3))*x - 3;
fp = @(x) 3*x.^2 - (4*sqrt(3)+2)*x + 3+2*sqrt(3);
[x, fx, it, ind] = newton1d_stampe(1.1, f, fp, 0, 1e-8, 0, 100, 0); % 6 iterazioni
[x, fx, it, ind] = newton1d_stampe(1.8, f, fp, 0, 1e-8, 0, 100, 0); % 25 iterazioni
[x, fx, it, ind] = newton_staz_stampe(1.1, f, fp(1.1), 0, 1e-6, 0, 1000, 0); % 289 iterazioni
[x, fx, it, ind] = newton_staz_stampe(1.8, f, fp(1.8), 0, 1e-6, 0, 1000, 1); % 292 iterazioni

%% Esercizio 4

g = @(x) log(x+sqrt(2)).*(x.^2-3+2*sqrt(2));
% radice doppia in -0.4 circa, singola in 0.4 circa
% fzero usa il metodo di Brent
[x1, fval, exitflag, output] = fzero(g, 0.4, optimset('Display','iter')); % 2+4 iterazioni
[x2, fx, it, ind] = secanti_stampe(0.5, 0.45, g, 0, 1e-10, 0, 100, 1); % 6 iterazioni


