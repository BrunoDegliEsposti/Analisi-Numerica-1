%% Esercizi 2,3,4,6

switch input('Funzione da integrare [1-sin 2-x*sqrt(x-1) 3-5sin+8 4-sqrt]: ')
	case 1
		a = 0; b = pi;
		fun  = @sin;
        I = 2;
    case 2
        a = 1; b = 2;
        fun = @(x) x.*sqrt(x-1);
        I = 16/15;
    case 3
        a = 0; b = pi;
        fun = @(x) 8+5*sin(x);
        I = 8*pi+10;
    otherwise
        a = 0; b = 1;
        fun = @sqrt;
        I = 2/3;
end
switch input('Metodo di integrazione [1-Trapezi 2-Simpson]: ')
    case 1
        metodo = @(x)trapezi(fun, a, b, x);
        costante_richardson = 3;
    otherwise
        metodo = @(x)simpson(fun, a, b, x);
        costante_richardson = 15;
end
m = 2.^(2:15);
T = arrayfun(@(x)trapezi(fun, a, b, x), m);
e = abs(I-T);
rapp = [0, e(1:end-1)./e(2:end)];
richardson = [0, T(2:end)-T(1:end-1)]./costante_richardson;
fprintf(['\n     m               T              ei=I-Ti        ', ...
                 '   rapp          richardson\n']);
for i = 1:14
    fprintf('%6.0f %22.15f %16.8e %16.8e %16.8e\n', ...
                m(i),T(i),e(i),rapp(i),richardson(i));
end
