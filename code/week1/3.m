x = linspace(-0.5, 0.5, 100)
y = linspace(-0.5, 0.5, 100)

[X, Y] = meshgrid(x, y)

z = exp(X.^2+Y.^2)
surf(x, y, z)

title('z = e^{x^2+y^2}')
xlabel('x')
ylabel('y')
zlabel('z')