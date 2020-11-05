P =[0 0 0 1/2 0 0;
    1 0 0 0 0 0;
    0 0 0 0 1 0;
    0 1/2 0 0 0 1/2;
    0 0 0 1/2 0 1/2;
    0 1/2 1 0 0 0];

%%%%%
n = 6;


e = ones(n,1);
v = e/n;
x = v;
alpha = 0.85;

maxit = 2000;
tol = 1e-04;


for it = 1:maxit
    R = 0;
    l = 1/norm(x);
    ll1 = alpha*P + (1-alpha)*v*transpose(e);
    ll2 = norm(ll1*x - x);
    R = l*ll2;
    x = alpha*P*x + (1-alpha)*v;
    if R < tol
        break;
    end
end

k = 6;
M = maxk(x, k);

for i = 1:k
    q(i) = find(x==M(i));
    X = [q(i),M(i)];
    disp(X);
end




