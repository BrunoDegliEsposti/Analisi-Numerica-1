%% Esercizio 4

x = [0 3 1.5 1.7 1.9 2.1 2.3 2.6 2.8 0.6];
f = [-0.8 1.44 0.59 0.59 0.23 0.1 0.28 1.03 1.5 -0.34];
save('dati_interpolazione.mat', 'x', 'f');

%% Esercizio 5

clearvars
load dati_interpolazione.mat
[x, p] = sort(x);
f = f(p);
if length(x) ~= length(unique(x))
    error('Le ascisse di x non sono tutte distinte');
end
A = diff_divise(x, f);
a = min(x);
b = max(x);
nval = 1000;
xval = linspace(a, b, nval);
Pval = horner_vec(x, A, xval);

figure(1);
plot(xval, Pval);
hold on;
plot(x, f, 'o');
hold off;
grid on;

figure(2);
xhat = 0.25;
fhat = -0.5;
[Pval, x, A] = ascissa_aggiuntiva(xhat, fhat, x, A, xval, Pval);
plot(xval, Pval);
hold on;
plot(x, [f fhat], 'o');
hold off;
grid on;




