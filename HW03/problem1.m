%Ryan Aday
%112754800
%MEC 102
%HW #03

clear all
clc

SBUID=112754800;

a=4;
b=8;
c=0;
d=0;

%Problem #1
%a)
load data.dat;

%b)
data=importdata('data.dat');
t=data(:,1);
x=data(:,2);

%c)
summation=0;
for i= 1:length(x)
    summation= summation+x(i,1);
end

%d)
summation_d=0;
double_check=double(string(c)+string(d));

for i=1:length(x)
    if double(x(i,1)) >= double_check
        summation_d=summation_d+x(i,1);
    end
end
    