function [A,b] = func(n,x)

A = rand(n,n);
b = [x A*b];
end