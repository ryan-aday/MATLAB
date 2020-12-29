%{
x= [ 1 2 3 4 5;
    2 3 4 5 6;
    3 4 5 6 7;];

clear all
clc
%}

%{
xmin=0;
xmax=1.5*pi;
f=@myfunction
a=integral(f, xmin, xmax)

function y=myfunction(x)
    y=sin(x).^3
end
%}

clear all
clc 

a=1;
b=[2 3];
our=sample(a,b)

function our=sample(a, b, c)
a=b(1)+2*a
b=a.*b;
our=a+b(1);
end