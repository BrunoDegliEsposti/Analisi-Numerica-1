function [spval] = spline_naturale(x, f, xval)
	n = length(x)-1;
	h = diff(x);
	phi = h(1:end-1) ./ (h(1:end-1) + h(2:end));
	csi = 1 - phi;
	div1 = (f(2:end)-f(1:end-1))./h;
	div2 = (div1(2:end)-div1(1:end-1))./(h(1:end-1)+h(2:end));
    A = diag(2*ones(1,n-1))+diag(phi(2:end),-1)+diag(csi(1:end-1),1);
    b = 6*div2(:); % (:) serve a mettere div2 in colonna
    M = [0 (A\b)' 0];
    r = f(1:end-1)-h.^2.*M(1:end-1)/6;
    q = div1 + h.*(M(1:end-1)-M(2:end))/6;
    spval = splineval(xval, x, h, M, r, q);
    if length(spval) < length(xval) % se è rimasto fuori il valore nell'ultimo nodo
        spval = [spval f(end)];
    end
end

function [spval] = splineval(xval, x, h, M, r, q)
    spval=[]; %#ok<*AGROW>
    n = length(x)-1;
    k = 1;
    for i = 1:n
        old = k-1;
        while xval(k) < x(i+1)
            k = k+1;
        end
        ind = k-1;
        xloc = xval(old+1:ind);
        spvalloc = (M(i+1)*(xloc-x(i)).^3 + M(i)*(x(i+1)-xloc).^3) / (6*h(i)) + ...
            q(i)*(xloc-x(i))+r(i);
        spval = [spval spvalloc];
    end
end




