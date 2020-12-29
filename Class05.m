clear all

%can also do [a, val]=max(A(2,:)); for finding max of a specific row

%Basic Concepts: Matrices and Linear Systems

%Matrices
%det(A)=0; then inf many solutions
%det(A)=/=0; then unique sol

A=[6 -3 1; 7 -5 0; 0 1 1];
b=[1; 1; 1];

x=inv(A)*b;
determinant=det(A);

