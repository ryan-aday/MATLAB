% lecture #1: Script file for basic calculations: 
clear all
clc

%This is a scalar
s=15

% this is the natural log of s
fs=log(s);
% this is the base 10 log of s
f10=log10(s);

%This is a vector 
v=[5 1 3 5 9]

%This is the magnitude of v
magv=sqrt(v*v')

% it can be also obtained by using 
%magv=norm(v)

% This is a 3 x 3 matrix
%M=[1 2 3; 4 5 6; 3 1 -2]
M=[1 1; -1 3]

%Result vector 1 x 3
%R=[1; 4; 6]
R=[0; 0]

%Finding the solution of M*X=R
X=inv(M)*R

% QUESTION: WHY THE SOLUTION OF X CAN GIVE EXTREMELY LARGE NUMBERS?

% Save solution vector only
save 'results.mat' X

%clear all variables
clear all

% load solutions vector from file
load results.mat