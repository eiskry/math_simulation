load n_4

n = 4;

x = zeros(n*n, 1) % 初期状態の設定

maxit = 2000; % 最大反復回数
tol = 1e-04; % 判定条件

r = b - A*x
p = r
Ap = A*p
ert = dot(p,r)
% /(p.*Ap)
alpha = (r.*r)./(p.*Ap);
% x+alpha*p
% r = r-alpha*Ap
% beta = -(r.*Ap)/(p.*Ap)
for i = 1:maxit
    Ap = A*p;
    
    alpha = (r.*r)/(p.*Ap);
    x = x + alpha*p;
    r = r - alpha*Ap;
    beta = -(r.*r)/(p.*Ap);
    p = r + beta*p;
    v(i)=norm(r);
    t(i) = i;
    if v(i) < tol
        break;
    end
end