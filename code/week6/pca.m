load data.mat
X_ = mean(X)
Y_ = mean(Y)
x1 = zeros(200,1);
x2 = zeros(200,1);
for i = 1:200
    x1(i)=X(i)-X_;
end

for i = 1:200
    x2(i)=Y(i)-Y_;
end

A = [x1 x2];
A_ = transpose(A);

x = ones(2,1);

maxit = 2000;
tol = 1e-05;

for it = 1:maxit
    r = 0;
    w = A_*A*x;
    x = w / norm(w);
    l1 = dot(x, A_*A*x);
    l2 = dot(x,x);
    lambda = l1/l2;
    r = norm(A_*A*x - lambda*x);
    if r < tol
        break;
    end
    T_(it)=r;
    t=it;
end
t
x

slps = x(2)/x(1);
ints = -x(2)/x(1)*X_+Y_;

x = linspace(-8,10);
y = slps*x +ints;
plot(x,y,'r','LineWidth',3);

hold on
scatter(X,Y,'b');
hold off

