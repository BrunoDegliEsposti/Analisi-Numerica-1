prec = 1;
while 1 + (prec/2) > 1
    prec = prec/2;
end

z = 1:20;

v(1) = 3;
v(2:100) = 1e-3;

w = 0:1/20:1;

a = zeros(1,20);
for i=1:20
    n = 10^i;
    a(i) = (1+(1/n))^n;
end