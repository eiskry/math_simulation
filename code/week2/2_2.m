n = 50;
u = zeros(n+2,n+2); % 初期状態の設定

% 境界条件の設定
x = linspace(0,1,n+2);
u(:,1) = 0;
u(:,n+2) = 50.*(1-x).*(1-x).*(1-x).*(1-x);
y = linspace(0,1,n+2);
u(1,:) = 50.*y;
u(n+2,:) = 0;

p=ceil((n+2)/3);
q=floor(2*(n+2)/3);
 
for k=p:q
     for l=p:q
         u(k, l) = 40;
     end
 end


maxit = 2000; % 最大反復R回数
tol = 1e-04; % 判定条件

for it = 1:maxit
    R = 0;
    for i = 2:n+1
        for j = 2:n+1
            j
            if p <= j && p <= i
                j = q-p+j;
                j
            end
            r =  (u(i, j + 1) + u(i, j-1) + u(i-1, j) + u(i + 1, j)) /4 - u(i, j);
            u(i,j) = u(i,j) + r;
            R = max(R, abs(r));
        end
    end
    if R < tol
        break;
    end
end

x = linspace(0, 1, n+2)
y = linspace(0, 1, n+2)
surf(x, y, u)
xlabel('x')
ylabel('y')
zlabel('z')