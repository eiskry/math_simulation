rng(0);
U1 = rand(100,10);
V1 = rand(70, 10);

U2 = rand(100, 40);
V2 = rand(70, 40);

A = U1*V1' + 1.0E-5*U2*V2' + 1.0E-10*rand(100,70);


[U, S, V] = svd(A);
s = diag(S)
n = 70;
fro = zeros(70,1);

for i=1:n
    k = i;
    A_ = zeros(100,70);
    for j=1:k
        u_tmp = U(:,j);
        v_tmp = transpose(V(:,j));
        tmp = s(j)*u_tmp*v_tmp;
        A_ = A_ +tmp;
    end
    val = A - A_;
    fro(i) = norm(val, 'fro');
end

semilogy(fro)