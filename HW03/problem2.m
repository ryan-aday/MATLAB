%Ryan Aday
%112754800
%MEC 102
%HW #03

clear all
clc

SBUID=112754800;

%Problem #2

%a)
inputs=importdata('input.dat');
A=inputs(:,1);
B=inputs(:,2);

%b)
global a b c d
a=4;
b=8;
c=0;
d=0;

%c)

%Keep in note that compute cannot be used as a function name
compute_=compute(A,B);

%d)
a=compute_(:,1);
b=compute_(:,2);

function compute_=compute(computeA_input,computeB_input)
global a b c d
computeA=computeA_input*a/c;
computeB=computeB_input.^(b/c);
compute_=[computeA computeB];
end

