%% Esercizio 7

fun = @(x) cos(10*x).*exp(sin(x));
a = 1; b = 10;
simpson(fun, a, b, 71);
simpson(fun, a, b, 416);
simpson(fun, a, b, 1310);

%% Esercizio 8

fun = @(x) cos(10*x).*exp(sin(x));
a = 1; b = 10;
trapezi(fun, a, b, 782);
trapezi(fun, a, b, 7816);
trapezi(fun, a, b, 78156);

%% Esercizio 9

fun = @(x) cos(10*x).*exp(sin(x));
a = 1; b = 10;
[Q, fcnt] = quad_plot(fun, a, b, 1e-8, true);

