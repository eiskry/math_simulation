function [W,D] = make_WD(U,sigma)
N = length(U);
W = zeros(N);
sigma2 = sigma^2;

for j = 1:N
    for i = 1:j
        W(i,j) = exp(-norm(U(:,i)-U(:,j))^2/sigma2);
    end
end

W = W + triu(W,1)';
D = diag(sum(W,2));