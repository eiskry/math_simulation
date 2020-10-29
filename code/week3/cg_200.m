load n_200

n = 200;

x = zeros(n*n, 1); % 初期状態の設定

maxit = 2000; % 最大反復回数
tol = 1e-04; % 判定条件

r = b - A*x;
p = r;

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

plot(t)

X = reshape(x,[n,n])

u = zeros(n+2,n+2);
% 境界条件の設定
u(:,1) = linspace(0,1,n+2);
u(:,n+2) = linspace(1,0,n+2);
u(1,:) = linspace(0,1,n+2);
u(n+2,:) = linspace(1,0,n+2);

for i = 2:n+1
    for j = 2:n+1
        u(i,j) = X(i-1, j-1);
    end
end

x = linspace(0, 1, n+2);
y = linspace(0, 1, n+2);

surf(x, y, u);

