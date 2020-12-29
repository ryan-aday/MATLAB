% lecture #1: Script file for basic calculations: 
clear all
clc

%This is a scalar
s=15

% this is the natural log of s
fs=log(s);
%Also known as ln(s);

% this is the base 10 log of s
f10=log10(s);

%This is a vector 
v=[5 1 3 5 9]

%This is the magnitude of v
magv=sqrt(v*v')

% it can be also obtained by using 
%magv=norm(v)

% This is a 3 x 3 matrix
M=[1 2 3; 4 5 6; 3 1 -2]

%Result vector 1 x 3
R=[1; 4; 6]

I=inv(M)

%Finding the solution of M*X=R
X=inv(M)*R

% Expect orders of mag for inputs to be the sameas outputs

% QUESTION: WHY THE SOLUTION OF X GIVES SUCH LARGE SET OF NUMBER?
% There is no inverse of matrix M; the large number is just a way to tell
% us the matrix is wack

% det of matrix M is also 0
% Mx=R
% 0x=R

% To make it close to 0, computer uses 10^-16

%max(size(X)) returns max size, size(X) returns size of x and y of mat



%To save file:
%save 'result.mat'
%load('results.mat')
%clear all
%load results.mat
