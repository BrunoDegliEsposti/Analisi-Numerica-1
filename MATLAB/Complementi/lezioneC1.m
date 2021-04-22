%% Esercizio 2
%#ok<*ASGLU>

F = @(x) [dot(x,x)-2; exp(x(1)-1)+x(2)^3-2];
J = @(x) [2*x(1), 2*x(2); exp(x(1)-1), 3*x(2)^2];
[x,fx,k,flag] = newton_stampe([1.9; 1.8], F, J, 0, 1e-6, 0, 100, 1);
[x,fx,k,flag] = newton_stampe([1.9; 0.5], F, J, 0, 1e-6, 0, 100, 1);
[x,fx,k,flag] = newton_stampe([2.0; 0.5], F, J, 0, 1e-6, 0, 100, 1);
[x,fx,k,flag] = newton_stampe([-1.0; -1.0], F, J, 0, 1e-6, 0, 100, 1);
[x,fx,k,flag] = newton_stampe([0.0; 2.0], F, J, 0, 1e-6, 0, 100, 1);

%% Esercizio 3

F = @(x) [dot(x,x)-4; x(1)^2*x(2)^2+3*x(1)-3];
J = @(x) [2*x(1), 2*x(2); 2*x(1)*x(2)^2+3, 2*x(2)*x(1)^2];
[x,fx,k,flag] = newton_stampe([-2.0; 2.0], F, J, 0, 1e-5, 0, 100, 1);
% x = (0.5840, 1.9128)
[x,fx,k,flag] = newton_stampe([2.0; -2.0], F, J, 0, 1e-5, 0, 100, 1);
% x = (0.5840, -1.9128)

