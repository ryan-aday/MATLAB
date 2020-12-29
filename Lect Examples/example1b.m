% Statics problem
clear all

%Data
%D1=5;   % in m
D1=[0:0.5:20]; %in m
D2=7;   % in m
H=10;   % in m
W=100*9.8;  % in Newtons

N=size(D1,2)

for ii=1:N
%Find angles in radians
theta1=atan(H/D1(ii));   
theta2=atan(H/D2);

% Define force matrix
A=[-cos(theta1) cos(theta2); sin(theta1) sin(theta2)];
b=[0; W];

%Find forces
S=inv(A)*b
S1(ii)=S(1);
S2(ii)=S(2);
end

figure(2)
plot(D1,S1/9.8,'-k')
grid on
hold on
plot(D1,S2/9.8,'-r')
xlabel('D1 [m]')
ylabel('force [kg]')
legend('S1','S2')
