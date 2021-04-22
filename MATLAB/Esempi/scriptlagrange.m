%
% script per graficare i polinomi di base di Lagrange, calcolare la corrispondente
% costante di Lebesgue Lam, costruire il polinomio interpolante una funzione assegnata 
% Forma di Lagrange
%
clear
close all
ntab=201;
ifunc= input('assegna la funzione da interpolare (1=Runge, 2=coseno) ');
switch ifunc
    case 1
        a= -5;
        b=  5;
        func = @(x) 1./(1+x.^2);
    case 2
        a= 0;
        b= 2*pi;
        func = @(x) cos(x);
    otherwise
        error('errore, funzione non definita!');
end
xval =linspace(a,b,ntab);
n = input('assegna il numero di ascisse: ');
itest = input('assegna il test da eseguire (1=uniformi,2=Chebychev): ');
switch itest
    case 1 % ascisse uniformi       
        x = linspace(a,b,n);
    case 2
        x = pi*(2*n-1:-2:1)/(2*n);
        x = (a+b+(b-a)*cos(x))/2; % ascisse di Chebychev generalizzate
    otherwise
        error('errore, test non definito!');
end
f = func(x); % valori della funzione sulle ascisse di interpolazione (dati)
metodo = 0;
tic
if metodo==0
  [Lval,Pval]=lagrange(x,xval,f);
else
  [Lval,Pval]=lagrange2(x,xval,f);
end
toc
Lam = max(sum(abs(Lval)));
disp(['costante di Lebesgue= ',num2str(Lam)]);
igraf= input('vuoi graficare i polinomi di Lagrange (0=no,1=yes) ?');
if igraf==1
    figure(1)
    plot(x,zeros(1,n),'r+')
    hold on
    for i=1:n
        plot(xval,Lval(i,:))
    end
    xlabel(['Costante di Lebesgue: ',num2str(Lam,'%10.5e')]);
end

figure(2)
fval=func(xval);
plot(xval,fval,'r',xval,Pval,'g',x,f,'ro')
ermax=max(abs(fval-Pval));
xlabel(['errore massimo: ',num2str(ermax,'%10.5e')])
%
%