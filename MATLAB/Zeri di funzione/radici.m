function [xm, xp] = radici(a, b, c)
    xm = (-b-sqrt(b*b-4*a*c))/(2*a);
    xp = (-b+sqrt(b*b-4*a*c))/(2*a);
end
