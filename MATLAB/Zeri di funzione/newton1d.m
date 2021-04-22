function [flag, x, fx, k] = newton1d(f, fp, x0, tolla, tollr, tollf, kmax)
	x = x0;
	fx = f(x);
	for k = 1:kmax
		dfx = fp(x);
		if dfx == 0
			flag = -1;
			return
		end
		dx = fx/dfx;
		x = x - dx;
		fx = f(x);
		if abs(fx) <= tollf
			flag = 2;
			return
		end
		if abs(dx) <= tolla + tollr*abs(x)
			flag = 1;
			return
		end
	end
	flag = 0;
end