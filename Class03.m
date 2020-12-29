% Class exercise for 1 & 2
clear all
clc

%Scalar
s=15

%Vector
v=[5 1 3 5 9]

%M x N Matrix
M=[1 1; -1 3]
N=M.'
%Result Vector
E=[0; 0]

L=M*M

%Save results
save 'results.mat'

%Clear all variables
clear all

%load sol vector from file
load results.mat

%sqrt(2)
%helpwin 
%Call helpwin <fxn> to know how to use it

%exp(<#>) calls e^#
T=exp(3)

%M*M = M^2

%M.^n finds power of n of all elements in matrix M

