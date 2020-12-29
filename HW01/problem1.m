%Ryan Aday
%112754800
%MEC 102
%HW #01

clear all
clc

a_=4;
b_=8;
c_=0;
d_=0;

%Problem #1

%a)
x(1,1)=a_;
x(2,1)=b_;
x(3,1)=c_;
x(4,1)=1;

%b)
A(1,:)=[a_, b_, c_, d_];
A(2,:)=[b_, b_, b_, b_];
A(3,:)=[d_, c_, b_, a_];
A(4,:)=[1, 1, 1, 1];

%c)
b=A*x;

%d)
c=x'*A;

%e)
save 'results.mat' x A b c;