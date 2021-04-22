function [xm, xp] = radici_stabile(a, b, c)
    if b > 0
        xm = (-b-sqrt(b*b-4*a*c))/(2*a);
        xp = c/(a*xm);
    else
        xp = (-b+sqrt(b*b-4*a*c))/(2*a);
        xm = c/(a*xp);
    end
end
