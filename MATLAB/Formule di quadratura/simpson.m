function [q] = simpson(fun, a, b, m)
    x = linspace(a, b, m+1);
    h = (b-a)/m;
    f = fun(x);
    q = f(1) + 4*sum(f(2:2:m)) + 2*sum(f(3:2:m-1)) + f(m+1);
    q = q*h/3;
end
