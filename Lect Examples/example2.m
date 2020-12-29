clear all

L=1;    % in meters
a=0.01; %K/m2
T1=300; %K
T2=325; %K
Ta=293; %K

x=0:L/50:L;
k=sqrt(a);
B=(T2-Ta-(T1-Ta)*exp(k*L))/(exp(-k*L)-exp(k*L));
A=T1-Ta-B;
Theta=A*exp(k*x)+B*exp(-k*x);

T=Ta+Theta;

figure(1)
plot(x,T,'r')
grid on
hold on;
xlabel('x [m]')
ylabel('T [K]')



