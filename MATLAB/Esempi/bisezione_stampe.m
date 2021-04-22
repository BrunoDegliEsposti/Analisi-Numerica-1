
function  [flag,x,y,k,a,b]=bisezione_stampe(f,a,b,tolla,tollr,tollf,kmax,stampe)
%
% Approssima una soluzione di f(x)=0 con il metodo di bisezione 
%
% Uso:	  [flag,x,y,k,a,b]=bisezione_stampe(f,a,b,tolla,tollr,tollf,kmax,stampe)
%
%  Parametri in ingresso:
%     f: function handle che definisce la funzione 
%   a,b: estremi di un intervallo tale che f(a)f(b)<0
% tolla, tollr: tolleranze assoluta e relativa sull'ampiezza dell'intervallo
% tollf: tolleranza sul valore di f
% kmax: numero massimo di bisezioni
% stampe: specificare 1 per stampare dettagli delle iterazioni
%                     0 altrimenti
%  
%  Parametri in uscita:
%  flag: vale 2 - se il procedimento e' terminato con successo (stop su f)
%             1 - se il procedimento e' terminato con successo (stop su [a,b])
%             0 - se sono state fatte kmax iterazioni senza successo
%     x: ultima iterata calcolata
%     y: valore di f in x
%     k: numero di iterazioni effettuate 
%   a,b: estremi dell'ultimo intervallo calcolato
%
fa=f(a);
%
if stampe == 1
    disp('    it              x                    fx           b-a                 a                      b        ')
end
for k=1:kmax
    x=(a+b)/2;
    y=f(x);
    if stampe==1
        disp(sprintf('%6.0f   %24.15e %12.2e %12.2e  %24.15e %24.15e ',...
             k,x,y,b-a,a,b))
    end    
    % criterio di arresto su f
    if abs(y)<=tollf, flag=2; return, end
    % criterio di arresto sull'intervallo
    if b-a<= tolla+tollr*abs(a), flag=1; return, end
    % aggiornamento dell'iterata
    if fa*y<0,
        b=x;           %  una radice in (a,x)
    else
        a=x;   fa=y;   %  una radice in (x,b)
    end
end
flag=0;