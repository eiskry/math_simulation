A = [ 2 1 0;
      1 2 1;
      0 1 2];

x = [ 1; 1; 1];

maxit = 2000;
tol = 1e-05;

for it = 1:maxit
    r = 0;
    w = A*x;
    x = w / norm(w);
    l1 = dot(x, A*x);
    l2 = dot(x,x);
    lambda = l1/l2;
    r = norm(A*x - lambda*x);
    if r < tol
        break;
    end
    T_(it)=r;
    t(it)=it;
end
x