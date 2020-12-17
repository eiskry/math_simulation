load("data_MNIST.mat");
m = 784;
n = 10000;

%%%%%%%%% X_kを求める
tol = 1e-14;
[U,S,V] = svd(X);
s = svd(X);
s_max = s(1);

for i =1:m
    val = s(i)/s_max;
    if val < tol
        i = i-1;
        break;
    end
end

k = i;

for j=1:k
    U_k(:,j)=U(:,j);
end

for j=1:k
    V_k(:,j)=V(:,j);
end

for j=1:k
    sk(j)=s(j);
end

sig_k = diag(sk);

tmp = sig_k\transpose(U_k);

X_k = V_k *tmp;

%%%%%%%%% Wを求める

W = Y*X_k;

%%%%%%%%% Wをテストする
check(W, test_X, test_Y)

