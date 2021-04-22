%% Esercizio 3

switch input('Funzione da interpolare [1-runge 2-(1+sin3x)x^2]: ')
	case 1
		a = -5; b = 5;
		fun  = @(x) 1./(1+x.^2);
		funp = @(x) (-2*x)./(1+x.^2).^2;
    otherwise
		a = -pi; b = pi;
		fun  = @(x) x.^2 .* (1+sin(3*x));
		funp = @(x) 2*x.*(1+sin(3*x)) + x.^2.*cos(3*x)*3;
end
n = input('Numero di ascisse di interpolazione: ');
switch input('Distribuzione delle ascisse [1-uniforme 2-chebichev]: ')
    case 1
        x = linspace(a, b, n);
    otherwise
        x = (a + b + (b-a)*cos( (1:2:2*n-1)*pi/(2*n) ))/2;
end
risoluzione = 10000;
xval = linspace(a, b, risoluzione);
f = fun(x);
fp = funp(x);
A1 = diff_divise(x, f);
Pval1 = horner_vec(x, A1, xval);
[A2, X2] = diff_divise_hermite(x, f, fp);
Pval2 = horner_vec(X2, A2, xval);

figure(1);
plot(xval, fun(xval));
hold on;
plot(xval, Pval1);
plot(xval, Pval2);
plot(x, f, 'o');
legend('Funzione esatta', 'Polinomio semplice', 'Polinomio di Hermite');
grid on;
hold off;

%% Esercizio 4

fun = @(x) 1./(1+x.^2);
E = zeros(1,8);
for j = 1:8
	a = -5;
	b = a + 10*(0.5^(j-1));
	xval = linspace(a, b, 201);
	Fval = fun(xval);
	x = linspace(a, b, 4);
	A = diff_divise(x, fun(x));
	Pval = horner_vec(x, A, xval);
	E(j) = max(abs(Fval - Pval));
end









