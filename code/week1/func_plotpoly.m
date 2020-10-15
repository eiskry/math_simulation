function [x, y]=func_plotpoly(xfrom,xto,xdiv,a)

x = linspace(xfrom, xto, xdiv);
y = zeros(1,xdiv);
n = size(a,2) - 1;
for i=1:n
    y = (y + a(i)) .* x;
end
y = y + a(n+1);
end