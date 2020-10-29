for n = 10:100
    A = rand(n);
    A = (A + A')/2;
    A = A + 5*eye(n);
    b = rand(n,1);
    x = zeros(n, 1); % 初期状態の設定

    maxit = 2000; % 最大反復回数
    tol = 1e-08; % 判定条件

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
        t2 = i;
        if v < tol
            break;
        end
    end
    c(n) = t2;
end

plot(c);
xlim([10 100]);
xlabel('Matrix Size')
ylabel('Number of Iterations')