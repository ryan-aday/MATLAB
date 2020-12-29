%Final Project
%Finding Daily Percentage of Positive COVID Cases

%This is the version that constantly updates every run.  This means the
%data will change depending on which day it is run, and the variables might
%change as well.  I figured I'd add it since it'd be a shame if I didn't.
%Plus it's way more useful.  Option 1 is likely to stay a better fit
%though.

clear all;clc;

api = 'https://covidtracking.com/api/';
url = [api 'v1/states/AL/daily.csv'];
data = webread(url);
writetable(data,'current_data.xls');

%Turns into matrix from table
data = xlsread('current_data.xls');
data=sortrows(data,1);

%{
(a) [50 pts] Report the set of parameters (a and b, or a, b, and c) that produce the best fit to the analyzed data by using either one of these functions:
Option#1: 1/x/a/sqrt(2*pi)*exp(-(log(x)-b)^2/2/a^2)
Option#2: 1/x/a/sqrt(2*pi)*exp(-(log(x)-b)^2/2/a^2)*exp(-x/c)
Use the root mean square error (rmse) reported by the fit command to select the best fit option above.
You will need to modify the option 'StartPoint' [...,..,..] in fittype for using either option.
%}

cdate=data(:,1);
days=zeros(size(cdate,1),1);

for r = 1:size(cdate,1)
        days(r,1)=r;
end

daily_pos=data(:,26);
daily_test=data(:,27);
percentage=zeros(size(daily_test,1),1);
for r = 1:size(daily_test,1)
    if (daily_pos(r,1)==0 && daily_test(r,1) == 0) || isnan(daily_pos(r,1)) || isnan(daily_test(r,1))
        percentage(r,1)=0;
    else
        percentage(r,1)=daily_pos(r,1)/daily_test(r,1);
    end
end


%#Option 1: 1/x/a/sqrt(2*pi)*exp(-(log(x)-b)^2/2/a^2)
fo1 = fitoptions('Method','NonlinearLeastSquares',...
               'Lower',[0,0],...
               'Upper',[Inf,max(days)],...
               'StartPoint',[1, 0]);

%Function defined, n=number of days
ft1 = fittype('n*1/x/a/sqrt(2*pi)*exp(-(log(x)-b)^2/2/a^2)','problem','n','options',fo1);
[curve1, gof1]= fit(days, percentage, ft1, 'problem', size(daily_test,1))

%Add to Fig 1
%{
     General model:
     curve1(x) = n*1/x/a/sqrt(2*pi)*exp(-(log(x)-b)^2/2/a^2)
     Coefficients (with 95% confidence bounds):
       a =       1.496  (1.137, 1.855)
       b =       4.894  (4.478, 5.31)
     Problem parameters:
       n =          73

gof1 = 

  struct with fields:

           sse: 9.9866
       rsquare: 0.0977
           dfe: 71
    adjrsquare: 0.0850
          rmse: 0.3750
%}

%#Option 2: 1/n/a/sqrt(2*pi)*exp(-(log(x)-b)^2/2/a^2)*exp(-x/c)
fo2 = fitoptions('Method','NonlinearLeastSquares',...
               'Lower',[0,0],...
               'Upper',[Inf,max(days)],...
               'StartPoint',[1 0 10^31]);

%Function defined, n=number of days
ft2 = fittype('n*1/x/a/sqrt(2*pi)*exp(-(log(x)-b)^2/2/a^2)*exp(-x/c)','problem','n','options',fo2);
[curve2, gof2]= fit(days, percentage, ft2, 'problem', size(daily_test,1))

%Add to Fig 2
%{
figure(2)
plot(curve2, '-b')

title('Daily Percentage of Positive Cases Since 03-08-2020')
xlabel('Number of Days Since 03-08-2020')
ylabel('Number of Cases')
%}

%{
    General model:
     curve2(x) = n*1/x/a/sqrt(2*pi)*exp(-(log(x)-b)^2/2/a^2)*exp(-x/c)
     Coefficients (with 95% confidence bounds):
       a =       1.496
       b =       4.894
       c =       1e+31
     Problem parameters:
       n =          73

gof2 = 

  struct with fields:

           sse: 9.9866
       rsquare: 0.0977
           dfe: 70
    adjrsquare: 0.0720
          rmse: 0.3777
%}

%Option 1 has a smaller rmse, so therefore it is a better fit.

%{
(b) [20 pts] Plot on the same figure the following:
>The analyzed data vs the day number in a bar chart.
>Predictions for 150 days from the best fit obtained with your chosen curve option #1 or # 2.
%}

figure(3)
n=size(daily_test,1);
pn=n+150;

actualD=zeros(1, 150+size(daily_test,1));
for r=1:size(daily_test)
    actualD(1,r)=percentage(r,1);
end

a=curve1.a;
b=curve1.b;

x=1:size(daily_test)+150;
px=size(daily_test)+1:size(daily_test)+150;
predict=n*(1./px/a/sqrt(2*pi).*exp(-(log(px)-b).^2/2/a^2));

hold on
actual=bar(x, actualD,'b');
pre=plot(px, predict, '-k');
hold off

title('Daily Percentage of Positive Cases Since 03-08-2020 & Predictions for 150 Days from Today')
legend([actual(1), pre(1)], 'Actual Data', 'Predictions');

%{
(c) [30 pts] Compute a variable named daytarget with the date for which 
your curve fit predicts 5% of postive daily tests.
%}
syms t

eqn=n*1/t/a/sqrt(2*pi)*exp(-(log(t)-b)^2/2/a^2)==.05;
daytarget_solve=vpasolve(eqn, t);
start_date=datetime(2020, 3, 7);
daytarget=start_date+caldays(int16(daytarget_solve))


