function [A] = diff_divise(x, f)
	A = f;
	n = length(x) - 1;
	for k = 1:n
		for j = n+1:-1:k+1
			A(j) = (A(j) - A(j-1)) / (x(j) - x(j-k));
		end
	end
end