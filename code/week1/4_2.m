%1
a = [-2 1 2 3];
xfrom = -3;
xto = 3;

%2
%a = [0.4 0 -4.7 4.1 -4];
%xfrom = -4;
%xto = 4;

xdiv = 30;

[x,y]=func_plotpoly(xfrom,xto,xdiv,a);


title('y = −2x^3 + x^2 + 2x + 3 (−3<=x<=3)')
%title('y = 0.4x^4 − 4.7x^2 + 4.1x − 4 (−4<=x<=4))')

xlabel('x')
ylabel('y')