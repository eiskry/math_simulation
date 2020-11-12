n = 100;
x3 = 3 * ones(n, 1);
x2 = 2 * ones(n-1, 1);
x1 = ones(n-2,1);
A3 = diag(x3);
A2_1 = diag(x2, -1);
A2_2 = diag(x2, 1);
A1_1 = diag(x1, -2);
A1_2 = diag(x1, 2);

A = A3+A2_1+A2_2+A1_1+A1_2;

x = ones(n, 1);

maxit = 2000;
tol = 1e-05;

for it = 1:maxit
    r = 0;
    w = A*x;
    x = w / norm(w);
    l1 = dot(x, A*x);
    
    l2 = dot(x,x);
    lambda = l1/l2;
    r = norm(A*x - lambda*x);
    if r < tol
        break;
    end
end

lambda