%Ryan Aday
%112754800
%MEC 102
%HW #02

clear all
clc

SBUID=112754800;

%Problem #3

x=1:0.1:10;
y=1:0.1:10;
[X,Y]=meshgrid(x,y);
Z=sin(X).*cos(Y);

close all

surfc(X,Y,Z);

title('f(x,y)=sin(x)*cos(y)')
xlabel('0 =< x =< 10') 
ylabel('0 =< y =< 10') 
zlabel('z')