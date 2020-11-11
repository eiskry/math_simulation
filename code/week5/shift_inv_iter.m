n = 100;
x3 = 3 * ones(n, 1);
x2 = 2 * ones(n-1, 1);
x1 = ones(n-2,1);
A3 = diag(x3)
A2_1 = diag(x2, -1)
A2_2 = diag(x2, 1)
A1_1 = diag(x1, -2)
A1_2 = diag(x1, 2)

A = A3+A2_1+A2_2+A1_1+A1_2;


x = ones(100, 1);

interval = 0.01;
x2 = 3;
x1 = 2;

n = (x2-x1)/ interval +1

sigma = linspace(2, 3, n)

maxit = 2000;
tol = 1e-04;

for it = 1:maxit
    r = 0;
    w = inv(A)*x;
    x = w / norm(w);
    l1 = dot(x, x);
    l2 = dot(x,inv(A)*x);
    lambda = l1/l2;
    r = norm(A*x - lambda*x);
    if r < tol
        break;
    end
    T_(it)=r;
    t(it)=it;
end
lambda
t
size(T_)
plot(t,T_)
% semilogy(t,T_)

