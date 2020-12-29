%Initialization Types
 o=ones(1,10); %row col of 1s
 z=zeros(23,1); %row col of 0s
 r=rand(1,45); %row col with vals from 0.0 to 1.0
 n=nan(1,69); %row col of NaN
 
lin=linspace(0,10,4); %Initializes 5 numbers equally spaced from 0 to 10
x=linspace(0,10,100);
y=linspace(0,10,10);
f=sin(x);
g=sin(y);
plot(x,f);
hold on;
plot(y,g);
hold on; %Makes linspace with increments of 100/10, graphs and displays sin(x)
%Smaller third criteria is, lower resolution

C=1:5;  %Creates all #s between 1 and 5
Cadv=1:2:20;  %Creates numbers from 1-20 with diff of 2

%More advance Formatting

%load file.mat Matlab data files
%load file.dat Text files with simple formatting (e.g. single or fixed-sized col)

%fileID=fopen('nums2.txt, 'r');
%formatSpec='%d %f';  %d for doubles, %f for floating
%sizeA=[2 Inf];
%A=fscanf(fileID, formatSpec,sizeA);

%Subindexing
%Examples
ex1=1:3:5;

%Non-equally Spaced Spaces
ex2=logspace(0, 10, 10);

M=[0 1 3; 1 1 2; 1 1 0; 2 0 1; -1 0 2];
max(M);
min(M)
max(max(M));
[a,b]=max(M);