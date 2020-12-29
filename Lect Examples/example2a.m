clear all
%solve 1D heat equation with boundary value solver
global a L T1 T2 Ta
L=1;    % in meters
a=0.01; %K/m2
T1=300; %K
T2=325; %K
Ta=293; %K

%create a mesh for numerical solution
xmesh = linspace(0,L,20);

%create initial guess on the mesh
solinit = bvpinit(xmesh, @guess);

%call ODE solver giving the intial guess as input
% @bvpfcn is the function that prescribes the ODE to solve
% @bcfcn is the function defining the boundary conditions
sol = bvp4c(@bvpfcn, @bcfcn, solinit);

%options = bvpset('RelTol', 1e-1, 'AbsTol', 1e-2, 'Nmax', 50, 'Stats', 'on');
%sol = bvp4c(@bvpfcn, @bcfcn, solinit,options);

x = sol.x;
f = sol.y(1,:);
dfdx = sol.y(2,:);

figure(1)
plot(x, f, 'ok')


function dydx = bvpfcn(x,y) % equation to solve
global a Ta
dydx = zeros(2,1);
dydx = [y(2)
       a*(y(1)-Ta)];
end
%--------------------------------
function res = bcfcn(ya,yb) % boundary conditions
global T1 T2
res = [ya(1)-T1
       yb(1)-T2];
end
%--------------------------------
function g = guess(x) % initial guess for y and y'
global T1 T2 L
g = [T1+x*(T2-T1)/L
     (T2-T1)/L];
end

