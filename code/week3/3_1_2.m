load n_50

n = 50;

x = zeros(n*n, 1); % 初期状態の設定

maxit = 2000; % 最大反復回数
tol = 1e-04; % 判定条件

r = b - A*x;
p = r;
t = 0;
t2 = 0;
for i = 1:maxit
    v = 0;
    Ap = A*p;
    alpha = dot(p,r)/dot(p,Ap);
    x = x + alpha*p;
    r = r - alpha*Ap;
    beta = -dot(r,Ap)/dot(p,Ap);
    p = r + beta*p;
    v = norm(r);
    t(i) = v;
    t2(i) = i;
    if v < tol
        break;
    end
end
t2
semilogy(t)
ylim([tol inf])
xlabel('Number of Iterations')
ylabel('2-Norm of r_k')

