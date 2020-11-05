% make P
rng(20201023, 'twister')
n = 1000;
avg = 5;
ind = randi(n, avg*n, 1);
jnd = randi(n, avg*n, 1);
P = sparse(ind, jnd, ones(avg*n, 1));

for j = 1:n
    non0 = nnz(P(:, j));
    if non0 > 0
        P(P(:, j)~=0, j) = 1 / non0;
    else
        P(:, j) = 1 / n;
    end
end

clear ind jnd avg j n non0;

%%%%%
n = 1000;


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
    T_(it)=R;
    t(it)=it;
    if R < tol
        break;
    end
end

k = 3;

M = maxk(x, k);

for i = 1:k
    q(i) = find(x==M(i));
    X = [q(i),M(i)];
    disp(X)
end



