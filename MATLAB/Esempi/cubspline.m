function spval = cubspline(x,f,xval,itype)
% function che tabula in xval la spline cubica con nodi in x
% spline interpolante: assume valore f(i) in x(i) 
%
% INPUT:
% -----
% x = vettore di n+1 componenti contenente le ascisse di interpolazione usate
%     anche come nodi
% f = vettore di n+1 componenti contenente i valori che la spline deve
%     assumere nei nodi
% xval = vettore di tabulazione con nval componenti
% itype= stringa che specifica il tipo di spline desiderata
% ('NAT','NAK','PER')
%
% OUTPUT:
% ------
% spval = vettore di nval componenti contenente i valori assunti dalla
%        spline nelle corrispondenti ascisse di xval

n = length(x)-1;
h = diff(x);

phi=h(1:end-1)./(h(1:end-1)+h(2:end)); % vettore con n-1 componenti
csi=1-phi;

% calcolo differenze divise di ordine 1 e 2
diffdiv1 = (f(2:end)-f(1:end-1))./h; % n diff. divise di ordine 1
diffdiv2 = (diffdiv1(2:end)-diffdiv1(1:end-1))./(h(1:end-1)+h(2:end)); % (n-1) diff. div. di ordine 2

% Fase 1: calcolo dei momenti
% ---------------------------
%
switch itype
    case 'NAT' % naturale
        A = diag(2*ones(1,n-1))+diag(phi(2:end),-1)+diag(csi(1:end-1),1); % (n-1) x (n-1)        
        b = 6*diffdiv2; 
    case 'NAK' % not-a-knot
        A = diag(2*ones(1,n-1))+diag(phi(2:end),-1)+diag(csi(1:end-1),1); % (n-1) x (n-1)
        A(1,1) = 2-phi(1);  A(1,2) = csi(1)-phi(1);
        A(n-1,n-1) = 2-csi(end); A(n-1,n-2) = phi(end)-phi(end-1);
        b = 6*diffdiv2; 
        b(1) = 6*(1-phi(1))*diffdiv2(1);
        b(end) = 6*(1-csi(end))*diffdiv2(end);
    case 'PER' % periodica
            phimod = [phi(2:end) h(end)/(h(end)+h(1))];
            A = diag(2*ones(1,n))+diag(phimod,-1)+diag(csi,1); % n x n
            A(1,n) = phi(1);  A(n,1) = h(1)/(h(end)+h(1)); 
            b=6*diffdiv2;
            rapL=(f(2)-f(1))/h(1); 
            rapR=(f(end)-f(end-1))/h(end);
            b(n) = 6*(rapL-rapR)/(h(1)+h(end));
end
        b=b(:);
        M = A\b; % momenti
        switch itype % estensione di M a vettore di (n+1) componenti
            case 'NAT'
                M=[0 M' 0];
            case 'NAK'
                M= [6*diffdiv2(1)-M(1)-M(2) M' 6*diffdiv2(end)-M(end)-M(end-1)];
            case 'PER'
                M=[ M(end) M'];
        end
% Fase 2: calcolo dei coefficienti r e q
r = f(1:end-1)-h.^2.*M(1:end-1)/6;
q = diffdiv1 +h.*(M(1:end-1)-M(2:end))/6;

% Fase 3: tabulazione della spline
spval=splineval(xval,x,h,M,r,q);
if length(spval) < length(xval) % rimasto fuori valore in ultimo nodo
    spval=[spval f(end)];
end

end
%-----------------------

    function spval = splineval(xval,x,h,M,r,q)
    spval=[];
        n = length(x)-1;
        k=1;
        for i=1:n % ciclo sui  sottointervalli
            old=k-1;
            while xval(k) < x(i+1)
             k =k+1;
            end
            ind = k-1;
            xloc=xval(old+1:ind);
            spvalloc = (M(i+1)*(xloc-x(i)).^3 + M(i)*(x(i+1)-xloc).^3)/(6*h(i))+...
                        q(i)*(xloc-x(i))+r(i);
            spval=[spval spvalloc];        
        end
       
        
end

