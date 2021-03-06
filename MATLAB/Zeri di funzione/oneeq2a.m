function [result] = oneeq2a(T)
    x1 = 0.332112;
    x2 = 1-x1;
    G12 = 0.07858889;
    G21 = 0.30175355;
    P2 = 10.^(6.87776-1171.53./(224.366+T));
    P1 = 10.^(8.04494-1554.3./(222.65+T));
    t1 = x1+x2*G12;
    t2 = x2+x1*G21;
    gamma2 = exp(-log(t2)-(x1*(G12*t2-G21*t1))/(t1*t2));
    gamma1 = exp(-log(t1)+(x2*(G12*t2-G21*t1))/(t1*t2));
    k1 = gamma1*P1/760;
    k2 = gamma2*P2/760;
    result = 1-k1*x1-k2*x2;
end

