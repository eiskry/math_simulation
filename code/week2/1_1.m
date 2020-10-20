n = 50;
u = zeros(n+2,n+2); % 初期状態の設定
% 境界条件の設定
u(:,1) = linspace(0,1,n+2);
u(:,n+2) = linspace(1,0,n+2);
u(1,:) = linspace(0,1,n+2);
u(n+2,:) = linspace(1,0,n+2);
maxit = 2000; % 最大反復回数
tol = 1e-04; % 判定条件

for it = 1:maxit
    R = 0;
    for i = 2:n+1
        for j = 2:n+1
            r =  (u(i, j + 1) + u(i, j-1) + u(i-1, j) + u(i + 1, j)) /4 - u(i, j);
            u(i,j) = u(i,j) + r;
            R = max(R, abs(r));
        end
    end
    if R < tol
        break;
    end
end