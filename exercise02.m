%Class Exercise 02
clear all
clc

A=[1 -1; -1 3];
B=[0 0];

X=B*inv(A);

save 'results.mat' X;
load results.mat;
%.m doesn't work