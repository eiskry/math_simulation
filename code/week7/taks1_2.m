A = [1 0 0;
     0 2 0;
     0 0 3];
 
B = [1 0 0;
     0 1 0;
     0 0 0];
 
eig(A,B);

eig(B, A);


[V, D] = eig(B,A);
V;
D
V_=transpose(V);

C=A;
A=B;
B=C;

1
V_*A*V
tmp = A\V;
2
V_*tmp;

3
V_*B*V
tmp = B\V;
4
V_*tmp

V_*B*V*D
V_*A*V