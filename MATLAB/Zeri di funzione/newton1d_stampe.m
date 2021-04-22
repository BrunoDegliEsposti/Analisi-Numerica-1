function [x,fx,it,ind] = newton1d_stampe(x,f,fd,tolla,tollr,tollf,Nmax,i_stampe)
%
%  Funzione che realizza il metodo di Newton per approssimare
%  una radice di $f(x)$, con  f: R -> R
%  Parametri in ingresso:
%       x:    approssimazione iniziale
%       f:    funzione che dato x in ingresso restituisce il valore f(x)
%       fd:   funzione che dato x  in ingresso resituisce il valore f'(x)
%       tolla,tollr: tolleranze per il criterio di arresto sulle iterate
%       tollf:  tolleranza per il criterio di arresto sulla funzione
%       Nmax:  numero massimo di iterazioni
%       i_stampe: se i_stampe=1 ad ogni iterazione viene stampato:
%   	x (iterata corrente), f(x), |dx|, |dx/dxold|, |dx/dxold^2|
%  Parametri in uscita:
%       x:  approssimazione calcolata
%       fx: valore di f(x)
%       it: numero di iterazioni effettuate
%       ind: 1 verificato uno dei 2 criteri di arresto
%            0 effettuato il numero massimo di iterazioni
%              senza verificare alcun criterio di arresto
%           -1 derivata nulla in x: procedimento interrotto

	fx = f(x);
	if  abs(fx) <= tollf
		ind=1;
        it=0;
		return
	end
	dxold = 1;
    if i_stampe == 1
        fprintf(['\n      it              x                 ', ...
                 'fx                 dx             rapp        rapp^2\n']);
    end
	for it = 1:Nmax
		fdx = fd(x);
		if fdx == 0   
			ind = -1;
			return
		end
		dx = fx/fdx;
        x  = x-dx;
        fx = f(x);
		if i_stampe == 1
			fprintf('%8.0f   %22.15e %16.8e  %16.8e  %11.3e  %11.3e\n', ...
                it,x,abs(fx),abs(dx),abs(dx/dxold),abs(dx)/dxold^2);
		end
		if abs(dx)<=tolla+tollr*abs(x) || abs(fx)<=tollf
			ind = 1;
			return
		end
		dxold = dx;
	end
	ind = 0;
end









