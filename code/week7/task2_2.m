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
 

shift = 2;
R = chol(B);

interval = 0.01;
x2 = 1.995;
x1 = 0.005;

q = (x2-x1)/ interval +1;

sigma = linspace(x1, x2, q);

maxit = 2000;
tol = 1e-10;


for i = 1:numel(sigma)
    shift = sigma(i);
    v = ones(5, 1);
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
        tmp_l = lambda;
        tmp_t = it;
    end
    s(i) = shift;
    l(i) = tmp_l;
    c(i) = tmp_t;
end

%  plot(s,l);
plot(s,c);
xlabel('Value of Shift')
% ylabel('Eigenvalue')
ylabel('Number of Iterations')
