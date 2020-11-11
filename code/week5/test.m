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

inv(A);


interval = 0.01;
x2 = 3;
x1 = 2;

n = (x2-x1)/ interval +1;

sigma = linspace(2, 3, n);
sigma(3);
I_ = ones(1, 10);
I = diag(I_);
2.01*I