a=[1 2 3]; 
b=[4; 2; 1];

%Works

%a.*b Cross Product of a and b
%a*b Dot Product of a and b

% ; after line hides results

% No Work

%a*b. -Invalid Cross Product

x1=[0 1 3];
x2=[1 1 2];
x3=[1 1 0];
x4=[2 0 1];
x5=[-1 0 2];

%Can also use x1(1)

%Can also also use sqrt(r1=x1*x1');

x1_dist=sum(x1.^2)^.5;
x2_dist=sum(x2.^2)^.5;
x3_dist=sum(x3.^2)^.5;
x4_dist=sum(x4.^2)^.5;
x5_dist=sum(x5.^2)^.5;


%For loop for Distance Matrix

%More advanced indexing
M(1,:)=x1;
M(2,:)=x2;
M(3,:)=x3;
M(4,:)=x4;
M(5,:)=x5;
%M=[0 1 3; 1 1 2; 1 1 0; 2 0 1; -1 0 2];
solution=[0; 0; 0; 0; 0];

%Optional, but don't need
%AMA= [0; 0; 0; 0; 0];;

sumR=0;

for r=1:5
    for c=1:3
        sumR=sumR+(M(r,c))^2;
    end
    AMA(r,1)= sqrt(sumR);
    sumR=0;
end

%Hillbert Matrix
s = 10;
H = zeros(s);

for c = 1:s
    for r = 1:s
        H(r,c) = 1/(r+c-1);
    end
end

