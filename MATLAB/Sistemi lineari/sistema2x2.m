function [x] = sistema2x2(A, b)
    determinante = (A(1,1)*A(2,2)-A(1,2)*A(2,1));
    if determinante == 0
        error('La matrice A non è invertibile');
    end
    invA = [A(2,2), -A(1,2); -A(2,1), A(1,1)] ./ determinante;
    x = invA*b;
end

