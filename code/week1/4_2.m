%1
% a = [-2 1 2 3];
% xfrom = -3;
% xto = 3;

%2
 a = [0.4 0 -4.7 4.1 -4];
 xfrom = -4;
 xto = 4;

xdiv = 30;

x = linspace(xfrom, xto, xdiv);
y = zeros(1,xdiv);
n = size(a,2) - 1;
for i=1:n
    y = (y + a(i)) .* x;
end
y = y + a(n+1);

plot(x,y);