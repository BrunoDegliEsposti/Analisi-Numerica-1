function [Pval] = horner(x, A, xval)
	n = length(x)-1;
	Pval = A(n+1);
	for k = n:-1:1
		Pval = Pval * (xval - x(k)) + A(k);
	end
end
