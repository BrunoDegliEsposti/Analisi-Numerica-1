function  [x,fx,it,ind]=newton_staz(x0,f,fd,tolla,tollr,tollf,Nmax,i_stampe)
%
%     Funzione che realizza il metodo di Newton stazionario per approssimare
%     una radice di $f(x)$, con  f: R -> R 
%     Parametri in ingresso:
%          x    approssimazione iniziale
%          f    funzione che dato x in ingresso restituisce il valore f(x)
%          fd   funzione che dato x  in ingresso resituisce il valore f'(x)    
%          tolla,tollr tolleranze per il criterio di arresto sulle iterate
%          tollf  tolleranza per il criterio di arresto sulla funzione
%          Nmax  numero massimo di iterazioni
%         i_stampe: se i_stampe=1 ad ogni iterazione viene stampato:
%      	  x(1) (iterata corrente), |f(x)|, |dx|, |dx|/|dxold| 
%    Parametri in uscita:
%          x approssimazione calcolata
%          fx  valore di f(x)
%          it  numero di iterazioni effettuate
%          ind  indicatore di errore:
%                              ind=1  verificato uno dei 2 criteri di arresto
%                              ind=0 effettuato il numero massimo di iterazioni
%                                     senza verificare alcun criterio di arresto
%                              ind=-1 il procedimento si e' interrotto perche'
%                                     f'(x)=0
%
ind=1;  x=x0;  dold=1;  fx=f(x);  fdx=fd(x);
if fdx==0
     ind=-1;
     return
end
disp('it              x                fx                 dx             rapp')
for it=1:Nmax
   dx=fdx\fx;  x=x-dx;  fx=f(x);
   if i_stampe==1
       disp(sprintf('%8.0f   %16.8e %16.8e  %16.8e  %11.3e',...
           it,x,abs(fx),abs(dx),abs(dx)/dold))
   end    
   if (abs(dx)<=tolla+tollr*abs(x) | abs(fx)<=tollf)
          return
   end
   dold=abs(dx);
end    
ind=0;
