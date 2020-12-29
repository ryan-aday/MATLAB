%Practice exam problem 2 solution
clear all
%(a) [5 pts] Load the file input.xls, which has 2 columns of fixed width
data=importdata('input.xls')

%(b) [5 pts] Store the first column of input.dat in a vector x
x=data(:,1);

%(c) [5 pts] Store the second column of input.dat in a vector y
y=data(:,2);

%(d) [5 pts] Compute the size N of the vector x
N=size(x,1);

%(d) [10 pts] Compute a scalar S that stores the sum of all elements x(i) that are larger than y(i)
%You must use the FOR and IF statemnts to create a loop and decision structure to verify that x(i)>y(i)
S=0;
for ii=1:N
if (x(ii)>y(ii))
    S=S+x(ii);
end
end

