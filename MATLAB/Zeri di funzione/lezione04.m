%% Esercizio 1

v = linspace(-2*pi, 2*pi, 100);
plot(v, arrayfun(@a_tratti, v));
fplot(@a_tratti, [-2*pi, 2*pi]);

%% Esercizio 2

norma2v = norma2([10^100; 10^10]);
norma2u = norma2([10^200; 10^200]);
normv = norm([10^100; 10^10]);
normu = norm([10^200; 10^200]);

%% Esercizio 3

norma2sv = norma2_stabile([10^100; 10^10]);
norma2su = norma2_stabile([10^200; 10^200]);

%% Esercizio 4

somme1_30 = sum(1:30);

%% Esercizio 6
%#ok<*SAGROW>

for k=1:8
    [xm1(k), xp1(k)] = radici(1, 10^k, 1);
    [xm2(k), xp2(k)] = radici_stabile(1, 10^k, 1);
    tmp = roots([1, 10^k, 1]);
    xm3(k) = tmp(1);
    xp3(k) = tmp(2);
end

%% Esercizio 7

for k=1:8
    [xm1(k), xp1(k)] = radici(1, -(4.2+10^(-k)), 4.41+2.1*10^(-k));
    [xm2(k), xp2(k)] = radici_stabile(1, -(4.2+10^(-k)), 4.41+2.1*10^(-k));
end







