function [q] = trapezi(fun, a, b, m)
    x = linspace(a, b, m+1);
    h = (b-a)/m;
    f = fun(x);
    q = h*((f(1)+f(m+1))/2 + sum(f(2:m)));
end
