function [flag, x, y, k, a, b] = bisezione(f, a, b, tolla, tollr, tollf, kmax)
	fa = f(a);
	for k = 1:kmax
		x = (a+b)/2;
		y = f(x);
		if abs(y) <= tollf
			flag = 2;
			return
		end
		if (b-a) <= (tolla + tollr * abs(a))
			flag = 1;
			return
		end
		if fa*y < 0
			b = x;
		else
			a = x;
			fa = y;
		end
	end
	flag = 0;
end
