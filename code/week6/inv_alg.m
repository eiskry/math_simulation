A = zeros(100,10);

for i=1:100
    for j=1:10
        A(i,j)=abs(i-j+1);
    end
end

A_ = transpose(A);

x = ones(10, 1);

maxit = 2000;
tol = 1e-05;

for it = 1:maxit
    r = 0;
    w = A_*A\x;
    x = w / norm(w);
    l1 = dot(x, x);
    l2 = dot(x,A_*A\x);
    lambda = l1/l2;
    r = norm(A_*A*x - lambda*x);
    if r < tol
        break;
    end
    T_(it)=r;
    t=it;
end

x
lambda
sqrt(lambda)

