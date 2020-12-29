%Midterm Problem 2
clear all
clc

%{
Problem 2  [50 pts]: Write a Matlab scritp named problem2.m that performs the following operations:

(a) [5 pts] Load to Matlab the file input.txt, which has numerical data in columns of fixed width
(b) [5 pts] Use the Matlab command size() to determine the number of rows Nr and number of columns Nc of your input data
(c) [10 pts] Store in a column vector x the fourth column of the file input.txt
(d) [15 pts] Compute a scalar R equal to the sum of the cosines of each and every element of x
(e) [15 pts] Compute a scalar S that stores the sum of all elements of the vector x that are larger than 5.38
You must use the FOR and IF statemnts to create a loop and decision structure to solve problem 2(e)
%}

%(a) [5 pts] Load to Matlab the file input.txt, which has numerical data in columns of fixed width
data=importdata('input.txt');

%(b) [5 pts] Use the Matlab command size() to determine the number of rows Nr and number of columns Nc of your input data
size_a=size(data);
Nr=size_a(1,1);
Nc=size_a(1,2);

%(c) [10 pts] Store in a column vector x the fourth column of the file input.txt
x=data(:,4);

%(d) [15 pts] Compute a scalar R equal to the sum of the cosines of each and every element of x
x_mod=zeros(Nr,1);
for r = 1:Nr
    x_mod(r,1)=cos(x(r,1));
end
R=sum(x_mod);

%{
check=0;
for n = 1:Nr
    check=check+x_mod(n,1);
end
%}

%(e) [15 pts] Compute a scalar S that stores the sum of all elements of the vector x that are larger than 5.38
x_moe=zeros(Nr,1);

for r = 1:Nr
    if x(r,1)>5.38
        x_moe(r,1)=cos(x(r,1));
    end
end
S=sum(x_moe);



