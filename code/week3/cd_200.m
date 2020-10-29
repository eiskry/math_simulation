load n_200

n = 200;
% 
x = zeros(n*n, 1); % 初期状態の設定

maxit = 2000; % 最大反復回数
tol = 1e-04; % 判定条件

r = b - A*x;
p = r;

for i = 1:maxit
    Ap = A*p;
    alpha = (p.*r)/(p.*Ap);
    x = x + alpha*p;
    r = r - alpha*Ap;
    beta = -(r.*Ap)/(p.*Ap);
    p = r + beta*p;
    v(i)=norm(r);
    t(i) = i;
    if v(i) < tol
        break;
    end
end


X = reshape(x,[n,n]);

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
surf(u);

