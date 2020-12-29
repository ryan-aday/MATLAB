clear all
clc 

A=[1 3 7; -1 4 4; 1 10 19];
b =[5;2;12];

d=det(A);

x=inv(A)*b; % or use A\b

A=[1 3 7; -1 4 4; 1 10 18];
b =[5;2;12];
det(A);

%x=inv(A)*b;

%rank(A); % gives rank of matrix, if rank<n inf many sol

clc
clear all
syms x y z
eqn1= 2*x + y + 3*z==-3
eqn2= -y + 5*z==1
sol = solve([eqn1, eqn2], [x, y, z], 'ReturnConditions',true);
disp('Solution is :')
[sol.x; sol.y; sol.z]
disp('With parameters : ')
sol.parameters
disp('Under the conditions :')
sol.conditions

clear all 
clc

%Gauss Jordan Elimination
A=[3 2 2 -5; 0.6 1.5 1.5 -5.4; 1.2 -0.3 -0.3 2.4];
b=[8 2.7 2.1];

syms x1 x2 x3 x4
eqn1= 3*x1 + 2*x2 + 2*x3 + -5*x4 == 8
eqn2= 0.6*x1 + 1.5*x2 + 1.5*x3 + -5.4*x4 == 2.7
eqn3= 1.2*x1 + -0.3*x2 + -0.3*x3 + 2.4*x4 == 2.1

sol = solve([eqn1, eqn2, eqn3], [x1, x2, x3, x4], 'ReturnConditions',true);
disp('Solution is :')
[sol.x1; sol.x2; sol.x3; sol.x4]
disp('With parameters : ')
sol.parameters
disp('Under the conditions :')
sol.conditions

%Exercise 6
clear all
clc

A=[3 2 2 -5; 0.6 1.5 1.5 -5.4; 1.2 -0.3 -0.3 2.4];
b=[8; 2.7; 2.1];

rref([A b])

%2 unknowns
%