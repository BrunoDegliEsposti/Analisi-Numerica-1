%
% script per testare le splines cubiche interpolanti nei nodi
%
clear
close all
nval=201;
ifunc= input('assegna la funzione da interpolare (1=Runge,2=Rungeristretta,3=coseno,4=valoreassoluto) ');
switch ifunc
    case 1 % funzione di Runge
        a= -5;
        b=  5;
        func = @(x) 1./(1+x.^2);
    case 2 % funzione di Rungeristretta
        a=  0;
        b=  5;
        func = @(x) 1./(1+x.^2);
    case 3 % coseno
        a= 0;
        b= 2*pi;
        func = @(x) cos(x);
    case 4 % valore assoluto
        a = -1;
        b=1;
        func = @(x) abs(x);
    otherwise
        error('errore, funzione non definita!');
end
xval =linspace(a,b,nval);
fval=func(xval);
itype = input('assegna fra apici il tipo di spline da usare (NAT,NAK e PER): ');

itest=input('vuoi assegnare tu n (0) o fare un ciclo (1)? ');
if itest==0
    n = input('assegna il numero di ascisse: ');
    x = linspace(a,b,n);
    f = func(x); % valori della funzione sulle ascisse di interpolazione (dati)
    if f(1)~=f(end)
        warning('dati non periodici!')
        decidi=input('vuoi comunque procedere (0=no,1=si)? ');
        if decidi==0
            spval=[];
            return
        end
    end
    spval = cubspline(x,f,xval,itype);
    ermax=max(abs(fval-spval));
else
    n = [5 10 20 40 80]; ermax=zeros(1,5);
    for k=1:length(n)
        x = linspace(a,b,n(k));
        f = func(x); % valori della funzione sulle ascisse di interpolazione (dati)
        spval = cubspline(x,f,xval,itype);
        ermax(k) = max(abs(fval-spval));
    end
    numord(1)=0;
    numord(2:length(n))=log2(ermax(1:end-1)./ermax(2:end));
    
    filerep=fopen('repsplinecub','w');
    fprintf(filerep,'report su errore spline cubica interpolante nei nodi \n');
    fprintf(filerep,['tipo di spline: ',itype, '\n']);
    fprintf(filerep,['funzione interpolata: ',num2str(ifunc) '\n\n']);
    formatspec= 'n = %2d  ermax = %10.5e \n';
    fprintf(filerep,formatspec,[n(1),ermax(1)]);
    formatspec= 'n = %2d  ermax = %10.5e numord = %5.2f \n';
    
    for k=2:length(n)
        fprintf(filerep,formatspec,[n(k),ermax(k),numord(k)]);
    end
    fclose(filerep);
end


figure
plot(xval,fval,'r',xval,spval,'g',x,f,'ro')
xlabel(['errore massimo: ',num2str(ermax(end),'%10.5e')])
%
%