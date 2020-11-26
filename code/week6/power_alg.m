A = zeros(100,10);

for i=1:100
    for j=1:10
        A(i,j)=abs(i-j+1);
    end
end

A_ = transpose(A);


v =ones(10,1);

maxit = 2000;
tol = 1e-05;

u = v/norm(v);

for it = 1:maxit
    r = 0;
    x = A_*A*u;
    lambda = dot(x,u);
    l1 = A_*A*x;
    l2 = lambda*x;
    r = norm(l1-l2);
    if r < tol
        break;
    end
    T_(it)=r;
    t(it)=it;
    u = x/norm(x);
end

lambda
sqrt(lambda)