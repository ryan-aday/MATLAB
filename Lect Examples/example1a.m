% Statics problem
clear all

%Data
D1=5;   % in m
D2=7;   % in m
H=10;   % in m
%W=100*9.8;  % in Newtons

W=[0:10:200]*9.8;   % in Newtons
N=size(W,2)

%Find angles in radians
theta1=atan(H/D1);   
theta2=atan(H/D2);

% Define force matrix
A=[-cos(theta1) cos(theta2); sin(theta1) sin(theta2)];

for ii=1:N
b=[0; W(ii)];

%Find forces
S=inv(A)*b;
S1(ii)=S(1);
end

figure(1)
plot(W/9.8,S1,'-k')
grid on
hold on
xlabel('W [kg]')
ylabel('S1 [N]')

