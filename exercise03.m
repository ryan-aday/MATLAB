clear all
clc

x1=[0 1 -1];
x2=[1 2 -3];
x3=[-1 4 0];

X(1,:)=x1;
X(2,:)=x2;
X(3,:)=x3;

%Find Xmax, Xmin, Ymax, Ymin
Xmax=max(X(:,1));  %1
Xmin=min(X(:,1));  %-1
Ymax=max(X(:,2));  %4
Ymin=min(X(:,2));  %1

length=Xmax-Xmin  %2
width=Ymax-Ymin  %3