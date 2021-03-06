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
alpha = 0.5;

for j = 1:10
    alpha = 0.5+0.05*(j-1);
    e = ones(n,1);
    v = e/n;
    x = v;
    maxit = 2000;
    tol = 1e-04;


    for it = 1:maxit
        R = 0;
        l = 1/norm(x);
        ll1 = alpha*P + (1-alpha)*v*transpose(e);
        ll2 = norm(ll1*x - x);
        R = l*ll2;
        if R < tol
            break;
        end
        x = alpha*P*x + (1-alpha)*v;
        T_(it)=R;
        t=it;
        
    end
    aa(j) = alpha;
    c(j) = t;
end

plot(aa,c)

xlim([0.45 1]);
ylim([5 13]);

xlabel('alpha')
ylabel('Number of Iterations')

