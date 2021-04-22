%% Esercizio 2

f = @(x)(2*x.^3+21*x.^2-26*x-240);
% La radice si trova in [-11, -10]
fplot(f, [-11, -10]);
grid on; grid minor
[flag1, x1, y1, k1, a1, b1] = bisezione(f, -11, -10, 1e-6, 1e-6, 0, 100);
[flag2, x2, y2, k2, a2, b2] = bisezione(f, -11, -10, 1e-10, 1e-10, 0, 100);
tmp = roots([2,21,-26,-240]);
x3 = tmp(1);

%% Esercizio 3
%#ok<*ASGLU>

f = @(x) cosh(x)-10;
[flag, x, y, k, a, b] = bisezione_stampe(f, 2.5, 3.5, 1e-15, 0, 0, 100, 0);
[flag, x, y, k, a, b] = bisezione_stampe(f, 2.5, 3.5, 0, 1e-15, 0, 100, 0);

f = @(x) cosh(x)-8000;
[flag, x, y, k, a, b] = bisezione_stampe(f, 9, 10, 1e-15, 0, 0, 100, 0);
[flag, x, y, k, a, b] = bisezione_stampe(f, 9, 10, 0, 1e-15, 0, 100, 0);

f = @(x) cosh(x)-(1+1e-6);
[flag, x, y, k, a, b] = bisezione_stampe(f, 0, 1, 1e-15, 0, 0, 100, 0);
[flag, x, y, k, a, b] = bisezione_stampe(f, 0, 1, 0, 1e-15, 0, 100, 1);

%% Esercizio 4

fplot(@oneeq2a, [0, 100]);
[flag, x, y, k, a, b] = bisezione_stampe(@oneeq2a, 0, 100, 1e-15, 1e-15, 0, 100, 1);

%% Esercizio 5

f = @(x)(x.^3 - (2*sqrt(3)+1)*x.^2 + (3+2*sqrt(3))*x - 3);
fplot(f, [0, 3]);
grid on
[flag, x, y, k, a, b] = bisezione_stampe(f, 0, 3, 1e-15, 1e-15, 0, 100, 1);

%% Esercizio 6

[flag, x, y, k, a, b] = bisezione_stampe(@sin, 3, 4, 0, 1e-10, 0, 100, 1);


