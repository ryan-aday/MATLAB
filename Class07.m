clear all
clc

%at the top of the code make SBUID variable
%Class 07

A=[1 3 7; -1 4 4; 1 10 18];
b =[5;2;12];
determ=det(A);

%Estimation with a matrix A with det=0
x=pinv(A)*b;

%Normal Error
normE=norm(A*x-b)/norm(b);  %  4.3893e-16

%n = norm(A) returns the largest singular value of A, max(svd(A)).
%n = norm(A,p) returns a different kind of norm, depending on the value of p.

%svd returns vector of singular values

%Max Error
maxE=max(A*x-b)/norm(b);  % -1.0129e-16

%Both the max and norm error must be REALLY small

%How to carefully solve a linear system
syms x y z;
eqn1= 2*x + y + 3*z==-3;
eqn2= -y + 5*z==1;
sol = solve([eqn1, eqn2], [x, y, z], 'ReturnConditions',true);
disp('Solution is :');
[sol.x; sol.y; sol.z];
disp('With parameters : ');
sol.parameters;
disp('Under the conditions :');
sol.conditions;

clear all
clc

A=[1 3 7; -1 4 4; 1 10 18];
b =[5;2;12];

%Gaussian Elimination 
gauss_elim=rref([A b]);

%PLOTTING!!!
%1) Create array for independent variable x
%2) Create array for function f
%3) Plot in 1D
%4) Additional operations (limits, legends, labels, export file, etc.)

%linspace(0, 4*pi, 1000); returns imaginary numbers

x = -1:.01:1; 
y=asin(x.*x);
%plot(y);

p=plot(x,y,'ok')

p.Color='red';
grid on;
hold on;

figure(1);

%To have multiple axes in one figure

subplot(2,3,1);
%makes a figure of e1 rows by e2 columns of axes, activates first axis for
%plotting
%each axis can be labeled, legended, titled

subplot(2,3,4:6);
grid on;
grid minor;
%activates range of axes and fuses them into one

figure(2);
subplot(3,3,1);
grid on;
grid major;

%hold on; %keeps graph in display 
%To close existing figures
%close([1 3]);
%closes figures 1 and 3
%close all;
%closes all figures

close all;
hold off;
%'->' gives you left pointing triangle

%'ok' makes thick line

%To make axis square
%axis square;

%To fit axis to data
%axis tight;

%To make axes equal
%axis equal;

%To make origin in the lower left hand corner
%axis xy;

%To make origin upper left hand corner
axis ij;

time=0:0.001:4*pi;
x=sin(time);
y=cos(time);
z=time;
plot3(x,y,z);
zLabel('Time');