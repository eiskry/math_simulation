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

interval = 0.01;
x2 = 3;
x1 = 2;

q = (x2-x1)/ interval +1;

sigma = linspace(2, 3, q);

I_ = ones(1, n);
I = diag(I_);

maxit = 2000;
tol = 1e-04;

for i = 1:size(sigma)
    shift = sigma(i)
    x = ones(100, 1);
    for it = 1:maxit
        r = 0;
        w = inv(shift*I-A)*x;
        x = w / norm(w);
        l1 = dot(x, x);
        l2 = dot(x,inv(shift*I-A)*x);
        lambda = l1/l2;
        r = norm(A*x - lambda*x);
        if r < tol
            break;
        end
        t(it) = r;
        t2 = it;
    end
    aa(i) = shift;
    c(i) = t2;
end

plot(aa,c)
% semilogy(t,T_)

