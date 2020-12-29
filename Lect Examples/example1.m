% Statics problem
clear all

%Data
D1=5;   % in m
D2=7;   % in m
H=10;   % in m
W=100*9.8;  % in Newtons

%Find angles in radians
theta1=atan(H/D1);   
theta2=atan(H/D2);

% Define force matrix
A=[-cos(theta1) cos(theta2); sin(theta1) sin(theta2)];
b=[0; W];

%Find forces
S=inv(A)*b


