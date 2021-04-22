function [x1,fx,it,ind] = secanti_stampe(x0,x1,f,tolla,tollr,tollf,Nmax,i_stampe)
%
%  Funzione che realizza il metodo delle secanti per approssimare
%  una radice di $f(x)$, con  f: R -> R
%  Parametri in ingresso:
%       x0, x1:    approssimazioni iniziali
%       f:    funzione che dato x in ingresso restituisce il valore f(x)
%       tolla,tollr: tolleranze per il criterio di arresto sulle iterate
%       tollf:  tolleranza per il criterio di arresto sulla funzione
%       Nmax:  numero massimo di iterazioni
%       i_stampe: se i_stampe=1 ad ogni iterazione viene stampato:
%   	x (iterata corrente), f(x), |dx|, |dx|/|dxold|, |dx|/|dxold|^1.618
%  Parametri in uscita:
%       x:  approssimazione calcolata
%       fx: valore di f(x)
%       it: numero di iterazioni effettuate
%       ind: 1 verificato uno dei 2 criteri di arresto
%            0 effettuato il numero massimo di iterazioni
%              senza verificare alcun criterio di arresto
%           -1 errore: f(xn) = f(xn+1) -> la secante è parallela all'asse x

	fx = f(x1);
    if abs(fx) <= tollf
        it=0;
        ind=1;
        return
    end
    phi = (1+sqrt(5))/2;
	dxold = 1;
    if i_stampe == 1
        fprintf(['\n      it              x                 ', ...
                 'fx                 dx             rapp      rapp ^ 1.618\n']);
    end
	for it = 1:Nmax
		deltaf = f(x1)-f(x0);
		if deltaf == 0
			ind = -1;
			return
		end
		dx = (f(x1)*(x1-x0))/deltaf;
        x0 = x1;
        x1 = x1 - dx;
        fx = f(x1);
		if i_stampe == 1
			fprintf('%8.0f   %22.15e %16.8e  %16.8e  %11.3e  %11.3e\n', ...
                it,x1,abs(fx),abs(dx),abs(dx/dxold),abs(dx/dxold^phi));
		end
		if abs(dx)<=tolla+tollr*abs(x1) || abs(fx)<=tollf
			ind = 1;
			return
		end
		dxold = dx;
	end
	ind = 0;
end

