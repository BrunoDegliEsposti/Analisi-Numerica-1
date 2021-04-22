function [Lval,Pval] = lagrange(x,xval,f)
% function [Pval,Lval] = lagrange(x,xval)
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

n = length(x); ntab=length(xval);
Lval=ones(n,ntab);
Pval=zeros(1,ntab);
for i=1:n
    
    for j=1:i-1
       Lval(i,:) = Lval(i,:).*(xval-x(j))/(x(i)-x(j));
    end
    for j=i+1:n
       Lval(i,:) = Lval(i,:).*(xval-x(j))/(x(i)-x(j));
    end
    
    Pval=Pval+f(i)*Lval(i,:);
end
 
    
     
        
    
     
end

