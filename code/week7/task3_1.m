sigma = 0.4;
[W,D] = make_WD(U,sigma);

L = D - W;

maxit = 2000;
tol = 1e-02;

A = L;
B = D;

v = ones(300, 1);
shift = 0.006;
R = chol(B);

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
end

plot(x,'ro');
xlabel('添字番号i')
ylabel('非ゼロ最小固有値に対応する固有ベクトルの第i要素x_i')