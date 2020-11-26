rng(0);
U1 = rand(100,10);
V1 = rand(70, 10);

U2 = rand(100, 40);
V2 = rand(70, 40);

A = U1*V1' + 1.0E-5*U2*V2' + 1.0E-10*rand(100,70);


[U, S, V] = svd(A);
s = diag(S)
n = 70;
val = zeros(70,1);

for i=2:n
    l = i;
    
    val(l) = sqrt(s(i));
end

semilogy(val)