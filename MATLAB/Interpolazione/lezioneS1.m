%% Esercizio 3

switch input('Funzione da interpolare [1-runge 2-coseno]: ')
    case 1
        fun = @(x) 1./(1+x.^2);
        a = -5; b = 5;
    otherwise
        fun = @cos;
        a = -pi; b = pi;
end
n = input('Numero di ascisse di interpolazione: ');
switch input('Distribuzione delle ascisse [1-uniforme 2-chebichev]: ')
    case 1
        x = linspace(a, b, n);
    otherwise
        x = (a + b + (b-a)*cos( (1:2:2*n-1)*pi/(2*n) ))/2;
end
risoluzione = 10000;
f = fun(x);
xval = linspace(a, b, risoluzione);
[Lval, Pval] = lagrange_vec(x, xval, f);

figure(1);
plot(xval, Lval);

figure(2);
plot(xval, fun(xval));
hold on;
plot(xval, Pval);
plot(x, fun(x), 'o');
grid on;
hold off;

costante_lebesgue = max(sum(abs(Lval)));
e = max(abs(fun(xval)-Pval));




