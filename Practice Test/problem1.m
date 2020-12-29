%Practice exam problem 1 solution

%Input data
A=[1 -1 3; -1 2 5; 3 0 -4];
b=[1; 0; -2];

%(a) [10 pts] The norm n=|b| of the vector b
n=norm(b)

%(b) [10 pts] The minimum value amin of the matrix A

amin=min(min(A))

%(c) [10 pts] The maximum value amax of the matrix A
amin=max(max(A))

%(d) [10 pts] The determinat D of the matrix A
D=det(A)

%(e) [10 pts] The matrix B which is the inverse of A
B=inv(A)

%(f) [10 pts] The column vector x which is the solution of the linear system A x = b
x=inv(A)*b

%(g) [10 pts] The residual error err=|B x- b| for the solution vector x computed in (f)
err=norm(B*x-b)
