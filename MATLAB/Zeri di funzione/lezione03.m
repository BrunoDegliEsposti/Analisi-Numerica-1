%% Esercizio 1

s = 0;
for i = 1:10
  s = s + i;
end

%% Esercizio 2

v = zeros(1,1001)+1e-9;
v(1) = 1e8;

s1 = 0;
for i = 1:1001
  s1 = s1 + v(i);
end
s2 = 0;

for i = 2:1001
  s2 = s2 + v(i);
end
s2 = s2 + v(1)

%% Esercizio 3

a = 1;
b = 1e6;
c = 1;
x1_meno = (-b-sqrt(b*b-4*a*c))/(2*a);
x1_piu = (-b+sqrt(b*b-4*a*c))/(2*a);
x2_meno = x1_meno;
x2_piu = c/(a*x2_meno);
x1_err = a*x1_piu*x1_piu+b*x1_piu+c;
x2_err = a*x2_piu*x2_piu+b*x2_piu+c;

%% Esercizio 4

vx = linspace(0,2*pi);
plot(vx, sin(vx));

vx = linspace(0,1);
plot(vx, sin(3*pi*vx));

vx = linspace(0,2*pi);
plot(vx, sin(vx).*cos(vx));

vx = linspace(-2,2);
plot(vx, vx.*vx+4*vx+1);

%% Esercizio 5

fplot(@(t)sin(2*pi*t), [0,1])
fplot(@(t)sin(t).*cos(t), [0,2*pi])

%% Esercizio 6

a = 1;
b = 10.^(1:10);
c = 1;
x1_meno = (-b-sqrt(b.*b - 4*a*c))./(2*a);
x1_piu  = (-b+sqrt(b.*b - 4*a*c))./(2*a);
x2_meno = x1_meno;
x2_piu = c./(a.*x2_meno);

%% Esercizio 7

f = @log;
fp = @(x)(1/x);
h = 10.^(-1:-1:-16);
d = @(x) (f(x+h)-f(x))./h;
e = @(x) abs(fp(x)-d(x));
besth = [];
for i = -1:2
    [minh, index] = min(e(10^i));
    besth = [besth index];
end






