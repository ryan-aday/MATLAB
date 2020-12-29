%Ryan Aday
%112754800
%MEC 102
%HW #02

clear all
clc

SBUID=112754800;

%Problem #2

A=[-1 1 3;
    1 3 5;
    -2 0 2;];
B=[1; 3; 0;];

%a)
rref([A B]);

%Results:
%     1     0    -1     0
%    0     1     2     1
%    0     0     0     0

%b)
x3=-1:0.1:3;


%x3 is independent
%x1 = x3
%x2 = 1 - 2*x3

%c) 
x1=x3;
x2 = 1 - 2*x3

close all

subplot(2,1,1);
plot(x3,x1,'k')

title('x1 as a Function of x3')
xlabel('-1 < x3 < 3') 
ylabel('x1') 

grid on;
axis tight;

subplot(2,1,2);
plot(x3,x2,'r')

title('x2 as a Function of x3')
xlabel('-1 < x3 < 3') 
ylabel('x2') 

grid on;
axis tight;