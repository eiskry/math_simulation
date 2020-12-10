A = [1 1 1 1 1;
     1 2 2 2 2;
     1 2 3 3 3;  
     1 2 3 4 4;
     1 2 3 4 5];
 
B = [2 1 0 0 0;
     1 2 1 0 0;
     0 1 2 1 0;  
     0 0 1 2 1;
     0 0 0 1 2];
 
v = ones(5, 1);
shift = 2;
R = chol(B);

maxit = 2000;
tol = 1e-10;

for it = 1:maxit
    tmp1 = transpose(R)*v;
    tmp2 = A-shift*B;
    tmp3 = tmp2\tmp1;
    w = R*tmp3;
    lambda = 1/dot(v, w) + shift;
    v = w/norm(w);
    
    x = R\v;
    x = x/norm(x);
    
    tmp3 = A*x;
    tmp4 = lambda*B*x;
    r = norm(tmp3 - tmp4);
    if r < tol
        break;
    end
    T_(it)=r;
    t(it)=it;
end
x
lambda
semilogy(t,T_)

xlabel('Number of Iterations')
ylabel('Residual Error')

