load("data_MNIST.mat");
m = 784;
n = 1000;

for w=1:10
    n_tmp = w*1000;
    xval(w)=n_tmp;
    %X_tmp
    X_tmp = zeros(m,n_tmp);
    for j=1:n_tmp
        X_tmp(:,j)=X(:,j);
    end
    %Y_tmp
    Y_tmp = zeros(10,n_tmp);
    for j=1:n_tmp
        Y_tmp(:,j)=Y(:,j);
    end
    
    %%%%%%%%% X_tmp_kを求める
    tol = 1e-14;
    [U,S,V] = svd(X_tmp);
    s = svd(X_tmp);
    s_max = s(1);
    
    for i =1:m
        val = s(i)/s_max;
        if val < tol
            i = i-1;
            break;
        end
    end

    k = i;
    U_k = zeros(m,k);
    for j=1:k
        U_k(:,j)=U(:,j);
    end
    
    V_k = zeros(n_tmp, k);
    for j=1:k
        V_k(:,j)=V(:,j);
    end

    sk = zeros(1,k);
    for j=1:k
        sk(j)=s(j);
    end

    sig_k = diag(sk);

    tmp = sig_k\transpose(U_k);

    X_tmp_k = V_k *tmp;

    %%%%%%%%% Wを求める

    W_tmp = Y_tmp*X_tmp_k;

    %%%%%%%%% Wをテストする
    ch(w)=check(W_tmp, test_X, test_Y);
end
ch
plot(xval,ch)
xlabel('学習データ数')
ylabel('正解率')
