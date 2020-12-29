clear all
clc

%Exercise 7
x = 0:.1:10; 
f_x=((x-2).^2);
g_x=x-2;
plot(x,f_x,'k')
hold on;
plot(x,g_x,'r')
grid on;
