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
A_ = inv(A);

x = ones(n, 1);

maxit = 2000;
tol = 1e-05;

for it = 1:maxit
    r = 0;
    w = A\x;
    x = w / norm(w);
    l1 = dot(x, x);
    l2 = dot(x,A\x);
    lambda = l1/l2;
    r = norm(A*x - lambda*x);
    if r < tol
        break;
    end
    T_(it)=r;
    t(it)=it;
end

x
lambda

semilogy(t,T_)
xlabel('Number of Iterations')
ylabel('r')

