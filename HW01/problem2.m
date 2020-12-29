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

%Problem #2

%a)
M(1,:)=[a_ d_ 0 7];
M(2,:)=[b_ c_ 1 5];
M(3,:)=[c_ b_ 0 3];
M(4,:)=[d_ a_ 1 1];

%b)
S=M(2:3,2:3);

%c)
V=M(1:4,1);

%d)
[M_maxR, M_maxC]=find(M==max(max(M)));
M_maximum=max(max(M));

%e)
[M_minR, M_minC]=find(M==min(min(M)));
M_minimum=min(min(M));