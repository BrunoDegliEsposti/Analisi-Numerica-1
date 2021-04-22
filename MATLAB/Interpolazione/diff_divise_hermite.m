function [A, X] = diff_divise_hermite(x, f, fp)
	X = kron(x, [1, 1]);
	n = length(x) - 1;
	N = 2*n+1;
	% Inizializza A(2i-i) = f(i), A(2i) = fd(i)
	A = zeros(1, N+1);
	A(1:2:end-1) = f;
	A(2:2:end) = fp;
	for j = N:-2:3
		A(j) = (A(j) - A(j-2)) / (X(j) - X(j-2));
	end
	for k = 2:N
		for j = N+1:-1:k+1
			A(j) = (A(j) - A(j-1)) / (X(j) - X(j-k));
		end
	end
end
