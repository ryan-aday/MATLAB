%Midterm Problem 1
clear all
clc

%Input data
%{
A(1,1) =  2,  A(1,2) =  0,  A(1,3) =  4,
A(2,1) =  1,  A(2,2) = -1,  A(2,3) =  8,
A(3,1) =  4,  A(3,2) =  7,  A(3,3) = -3,

the column vector b = [  5;   9;  -1],
and column vector c = [ -2;   3;   0],
%}
A=[2 0 4;
   1 -1 8;
   4 7 -3];
b=[5; 9; -1];
c=[-2; 3; 0];


%{
Write a Matlab scritp named problem1.m that computes the following:
(a) [10 pts] The vector v=A*(b+3*c)-|c| where |c| is the norm of the vector c
(b) [10 pts] The 3-by-3 matrix B whose elements are B(i,j)= 1.5*cos(A(i,j)+2*sin(A(i,j))
(c) [5 pts] The maximum value Mmax of the matrix M=B-A, where B is the matrix created in 1(b)
(d) [5 pts] The determinant D of the matrix P=2.5*A
(e) [5 pts] The matrix Q which is the inverse of the matrix P created in 1(d)
(f) [15 pts] The column vector x which is the solution of the linear system 2*A x - c=0
%}

%(a) [10 pts] The vector v=A*(b+3*c)-|c| where |c| is the norm of the vector c
v=A*(b+3*c)-norm(c);
%(b) [10 pts] The 3-by-3 matrix B whose elements are B(i,j)= 1.5*cos(A(i,j)+2*sin(A(i,j))

%^ There's a possible typo, should be cos(A(i,j))?

B=zeros(3,3);
for col=1:3
    for row = 1:3
        B(row,col)=1.5*cos(A(row,col))+2*sin(A(row,col));
    end
end

%(c) [5 pts] The maximum value Mmax of the matrix M=B-A, where B is the matrix created in 1(b)
M=B-A;
Mmax=max(max(M));

%(d) [5 pts] The determinant D of the matrix P=2.5*A
P=2.5*A;
D=det(P);

%(e) [5 pts] The matrix Q which is the inverse of the matrix P created in 1(d)
Q=inv(P);

%(f) [15 pts] The column vector x which is the solution of the linear system 2*A x - c=0
%2*Ax=c
%Ax=1/2*c
%inv(A)*A*x=inv(A)*1/2*c
x=inv(A)*1/2*c;

