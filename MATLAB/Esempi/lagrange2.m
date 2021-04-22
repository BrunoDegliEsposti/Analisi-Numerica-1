function [Lval,Pval] = lagrange2(x,xval,f)
% function [Pval,Lval] = lagrange2(x,xval)
% Versione 2
% function che valuta in tutte le ascisse di xval 
% i polinomi di Lagrange di grado n-1 relativi alle ascisse in x,
% dove n = numero di elementi di x.
% Se i parametri in ingresso sono 3, viene anche valutato in xval
% il polinomio di grado minore o uguale a n-1 che interpola le coppie 
% (x_i,f_i), i=1,...n,  utilizzando la forma di Lagrange
%
% Input:
% -----
% x    = vettore di n componenti contenente le ascisse di interpolazione
% xval = vettore di ntab componenti contenente tutte le ascisse in cui 
%        si vogliono valutare i polinomi di Lagrange
% f    = vettore di n componenti contenente i valori che assume sulle ascisse 
%        di interpolazione la funzione da interpolare 
% Output:
% ------
%
% Lval = matrice nxntab contenente sulla riga i i valori dell'i-esimo
%        polinomio di Lagrange nelle ascisse di xval
% Pval = vettore di ntab componenti contenete i valori assunti in xtab dal 
%        polinomio che interpola le coppie (x_i,f_i), i=1,...n

n = length(x); nval=length(xval);
Lval=ones(n,nval);
Pval=zeros(1,nval);
num= ones(1,nval);
for i=1:n
    num=num.*(xval-x(i));
end
for i=1:n
    
    den=1;
    for j=1:i-1
        den = den*(x(i)-x(j));
    end
    for j=i+1:n
        den = den*(x(i)-x(j));
    end
    
    [mx,imx]= max(x(i)==xval);
    if mx==0 % nessun elemento di xval coincide con x(i)
        Lval(i,:) = num./(den*(xval-x(i)));
    else
        Lval(i,1:imx-1) = num(1:imx-1)./(den*(xval(1:imx-1)-x(i)));
        Lval(i,imx+1:nval) = num(imx+1:nval)./(den*(xval(imx+1:nval)-x(i)));
        Lval(i,imx)=1;
    end
    Pval=Pval+f(i)*Lval(i,:);
end


end

