%% Esercizio 3

switch input('Funzione da interpolare [1-runge 2-(1+sin3x)x^2 3-abs 4-sin(1/x)]: ')
	case 1
		a = -5; b = 5;
		fun  = @(x) 1./(1+x.^2);
    case 2
		a = -pi; b = pi;
		fun  = @(x) x.^2 .* (1+sin(3*x));
    case 3
        a = -1; b = 1;
        fun = @abs;
    otherwise
        a = 0.05; b = 0.5;
        fun = @(x) sin(1./x);
end
risoluzione = 10000;
xval = linspace(a, b, risoluzione);
fval = fun(xval);
switch input('Spline cubica interpolante nei nodi [1-naturale 2-not-a-knot]: ')
    case 1
        algoritmo_spline = @spline_naturale;
    otherwise
        algoritmo_spline = @spline;
end
ntot = [5 10 20 40 60 80 100 120 140 160 1000];
m = length(ntot);
ermax = zeros(1,m);
h = (b-a)./ntot;
for k = 1:m
    x = linspace(a, b, ntot(k)+1);
    f = fun(x);
    spval = algoritmo_spline(x, f, xval);
    ermax(k) = max(abs(spval - fval));
end
convergenza = ermax./(h.^4); % dovrebbe essere costante, meglio se piccola








