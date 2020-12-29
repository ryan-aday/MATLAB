% new file for examples
clear all

%Scalar Example
s=15
fs=log(s)

%Vector Example
v=[5 1]
q=[3; 1]

qrows=[5 1]

dp=v*q
dp2=qrows*q

clc

speed=sqrt(v*v')

%Matrix
v = [5 1 3 5 9]
M = [1 2 3; 4 5 6; 7 8 9]
inv(M)
