

% 境界条件の設定

p=ceil((n+2)/3);
q=floor(2*(n+2)/3);
 
for k=p:q
    for l=p:q
        u(k, l) = 40;
    end
end

p=ceil((n+2)/3)
q=floor(2*(n+2)/3)

n=5;
u = zeros(n+2,n+2); % 初期状態の設定

n = 50;
u = zeros(n+2,n+2); % 初期状態の設定

% 境界条件の設定
x = linspace(0,1,n+2);
u(:,1) = 0;
u(:,n+2) = 50.*(1-x).*(1-x).*(1-x).*(1-x);
y = linspace(0,1,n+2);
u(1,:) = 50.*y;
u(n+2,:) = 0;

surf(x,y,u)
xlabel('x')
ylabel('y')
zlabel('z')