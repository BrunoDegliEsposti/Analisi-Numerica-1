function [Lval, Pval] = lagrange_vec(x, xval, f)
	n = length(x);
    if n ~= length(f)
        error('x e f non hanno la stessa dimensione.');
    end
    m = length(xval);
    Lval = ones(n, m);
    for i = 1:n
        for j = 1:n
            if j == i, continue; end;
			Lval(i,:) = Lval(i,:) .* ((xval - x(j)) ./ (x(i) - x(j)));
        end
    end
    Pval = f * Lval;
end