rng(20201023, 'twister')
n = 1000;
avg = 5;
ind = randi(n, avg*n, 1);
jnd = randi(n, avg*n, 1);
P = sparse(ind, jnd, ones(avg*n, 1));

for j = 1:n
    non0 = nnz(P(:, j));
    if non0 > 0
        P(P(:, j)~=0, j) = 1 / non0;
    else
        P(:, j) = 1 / n;
    end
end

clear ind jnd avg j n non0;