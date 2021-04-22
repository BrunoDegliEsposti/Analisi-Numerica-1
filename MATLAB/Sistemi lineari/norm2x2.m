function [raggio] = norm2x2(A)
    S = A' * A;
    a = S(1,1); c = S(2,1); d = S(2,2);
    ro = (a+d+sqrt((a-d)^2+4*c*c))/2;
    raggio = sqrt(ro);
end