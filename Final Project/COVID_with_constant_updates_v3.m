
%{
This is a COVID tracker for the state of Wyoming.  I've written a
rudimentary predictor for when COVID cases for the state are expected to
reach 20% (positive/total cases).  This is not based off of daily data, just
total composites.  

To adjust for different states, change the state abbreviation on the API
address. (Line 19)  When changing states, uncomment lines 97 to 107.  This
will print out the equations for the piecewise functions.  Replace the
coefficients of these functions in the current order for the variables at
lines 112-115.

To change the tolerance for the prediction, change the percentage from 0.05
to whatever, as long as it's less than 100%. (Line 134)

%}

clear all;clc;

api = 'https://covidtracking.com/api/';
url = [api 'v1/states/WY/daily.csv'];
data = webread(url);
writetable(data,'current_data.xls');

%Turns into matrix from table
data = xlsread('current_data.xls');
data=sortrows(data,1);

%Creates dates with removing headers in mind.
%Keep note that the size of date is to be referenced for most array sizes.
cdate = data(:,1);
days = zeros(size(cdate,1),1);

for r = 1:size(cdate,1) 
        days(r,1) = r;
end

total_pos_viral = data(1:size(cdate, 1), 24);
total_test = data(1:size(cdate, 1), 23);

%Creates blank array for percentages
percentage = zeros(size(days,1),1);

for r = 1:size(days,1)
    if (total_pos_viral(r,1) == 0 && total_test(r,1) == 0) || isnan(total_pos_viral(r,1)) || isnan(total_test(r,1))
        percentage(r,1)=0;
    else
        percentage(r,1) = total_pos_viral(r,1)/total_test(r,1);
        %fprintf('percentage = %f\n', percentage(r,1));  % Checks percentages
    end
end

%Initializes plot figure
figure(1)

%total_test references days, so fine
n = size(days,1);

actualD = zeros(1, size(total_test,1));
for r = 1:size(total_test,1)
    % Need to convert to a 1 x n array
    actualD(1,r) = percentage(r,1);
end

x = 1:size(days,1);

%Regular Exponential Fit

%{
f = fit(days,percentage,'poly2');
f1 = f.p1;
f2 = f.p2;
f3 = f.p3;
%}
%{
f = 

     Linear model Poly2:
     f(x) = p1*x^2 + p2*x + p3
     Coefficients (with 95% confidence bounds):
       p1 =   1.354e-06  (1.167e-06, 1.541e-06)
       p2 =  -0.0002916  (-0.0003504, -0.0002329)
       p3 =     0.04311  (0.03925, 0.04698)
%}

%Brute Force Spline

[g, goodness, output] = fit(days,percentage,'smoothingspline')
plot(g, days, percentage);

a = days;
b = percentage;

%Segments splines into 200 different segements and prints out piecewise fxns

%{
cs = spline(a,b);
xx = linspace(1,size(days,1),200);
plot(a,b,'o',xx,ppval(cs,xx),'-');

coefficients = cs.coefs
fprintf('The equation for the different segments are:\n');
for k = 1 : size(coefficients, 1)
  fprintf('y = %7.4f * x^3 + %7.4f * x^2 + %7.4f * x + %7.4f\n', coefficients(k,:));
end
%}

%Last function is y = -0.0001 * x^3 + -0.0003 * x^2 + -0.0002 * x +  0.0784

%Replace these if state changed from WY.
g1 = -0.0001;
g2 = -0.0003;
g3 = -0.0002;
g4 = 0.0784;

hold on
actual = bar(x, actualD,'b');
%pre = plot(f,days,percentage);
pre = plot(g, days, percentage);
hold off

title('Daily Percentage of Positive Viral Cases Since 03-06-2020')
xlabel('Days Since 03-06-2020');
ylabel('Daily Percentage of Positive Viral Cases');
legend([actual(1), pre(1)], 'Actual Data', 'Predictions');

%{
Computes a variable that guesses when COVID positive cases reach 20% of
total cases.
%}
syms t 

eqn = g1 * (size(days, 1) + t)^3 + g2 * (size(days, 1) + t)^2 + g3 * (size(days, 1) + t) +  g4 == 0.20;

daytarget_solve = vpasolve(eqn, t, [-Inf Inf]);
start_date = datetime('now');
daytarget = start_date+caldays(int16(abs(daytarget_solve)))


