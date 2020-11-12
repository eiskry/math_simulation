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
tol = 1e-05;


shift = sigma(1);
x = ones(100, 1);
w = (shift*I-A)\x;
x = w / norm(w);
l1 = dot(x, x);
l2 = dot(x,(shift*I-A)\x);
lambda = l1/l2;
r = norm(A*x - lambda*x)

w = inv(shift*I-A)*x;
x = w / norm(w);
l1 = dot(x, x);
l2 = dot(x,inv(shift*I-A)*x);
lambda = l1/l2;
r2 = norm(A*x - lambda*x)
    

