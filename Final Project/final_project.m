%final_project script
clear all;clc;close all
ID=input('Enter your 9-digit SBUID: ');

M=num2str(ID);
if (size(M,2) ~= 9)
display('You must enter a 9-digit number')
return
end

filename=['FinalProject_for_SBUID',M,'.txt']
an=str2num(M(6));bn=str2num(M(7));cn=str2num(M(8));dn=str2num(M(9));
idx=1+mod(str2num(M(9:-1:8)),50)

S(1)="Alabama";
S(2)="Alaska";
S(3)="Arizona";
S(4)="Arkansas";
S(5)="California";
S(6)="Colorado";
S(7)="Connecticut";
S(8)="Delaware";
S(9)="Florida";
S(10)="Georgia";
S(11)="Hawaii";
S(12)="Idaho";
S(13)="Illinois";
S(14)="Indiana";
S(15)="Iowa";
S(16)="Kansas";
S(17)="Kentucky";
S(18)="Louisiana";
S(19)="Maine";
S(20)="Maryland";
S(21)="Massachusetts";
S(22)="Michigan";
S(23)="Minnesota";
S(24)="Mississippi";
S(25)="Missouri";
S(26)="Montana";
S(27)="Nebraska";
S(28)="Nevada";
S(29)="New Hampshire";
S(30)="New Jersey";
S(31)="New Mexico";
S(32)="New York";
S(33)="North Carolina";
S(34)="North Dakota";
S(35)="Ohio";
S(36)="Oklahoma";
S(37)="Oregon";
S(38)="Pennsylvania";
S(39)="Rhode Island";
S(40)="South Carolina";
S(41)="South Dakota";
S(42)="Tennessee";
S(43)="Texas";
S(44)="Utah";
S(45)="Vermont";
S(46)="Virginia";
S(47)="Washington";
S(48)="West Virginia";
S(49)="Wisconsin";
S(50)="Wyoming";

yourstate=S(idx)

fileID = fopen(filename,'w');
fprintf(fileID,'Your SBUID is %9.0f\n',ID);
fprintf(fileID,'MAKE SURE THAT YOU ENTERED YOUR SBUID CORRECTLY\n',ID);
fprintf(fileID,'\n',ID);

fprintf(fileID,'For your project you will analyze the data reported at https://covidtracking.com/data for the state of %s.\n',yourstate);
fprintf(fileID,'To complete your project you must upload BOTH your script final_project.m AND readable input data file for your script on blackboard by 11:59PM ET on May 20th.\n');
fprintf(fileID,'\n');

%QUESTION 1-a
switch(cn)
case{0, 3, 6, 9}

fprintf(fileID,'The data you will analyze is the daily percentage of positive covid-19 tests in the state of %s.\n',yourstate)    
fprintf(fileID,'\n');
fprintf(fileID,'(a) [50 pts] Report the set of parameters (a and b, or a, b, and c) that produce the best fit to the analyzed data by using either one of these functions:\n')
fprintf(fileID,'Option#1: 1/x/a/sqrt(2*pi)*exp(-(log(x)-b)^2/2/a^2)\n')
fprintf(fileID,'Option#2: 1/x/a/sqrt(2*pi)*exp(-(log(x)-b)^2/2/a^2)*exp(-x/c)\n')
fprintf(fileID,'Use the root mean square error (rmse) reported by the fit command to select the best fit option above.\n') 
fprintf(fileID,'You will need to modify the option ''StartPoint'' [...,..,..] in fittype for using either option.\n') 
fprintf(fileID,'\n');
fprintf(fileID,'(b) [20 pts] Plot on the same figure the following:\n')
fprintf(fileID,'>The analyzed data vs the day number in a bar chart.\n')
fprintf(fileID,'>Predictions for 150 days from the best fit obtained with your chosen curve option #1 or # 2.\n')
fprintf(fileID,'\n');
fprintf(fileID,'(c) [30 pts] Compute a variable named daytarget with the date for which your curve fit predicts 5%% of postive daily tests.\n')

otherwise

fprintf(fileID,'The data you will analyze is the percentage of daily fatalities for the reported positive covid-19 cases in the state of %s.\n',yourstate)    
fprintf(fileID,'\n');
fprintf(fileID,'(a) [50 pts] Report the set of parameters (a and b, or a, b, and c) that produce the best fit to the analyzed data by using either one of these functions:\n')
fprintf(fileID,'Option#1: 1/x/a/sqrt(2*pi)*exp(-(log(x)-b)^2/2/a^2)\n')
fprintf(fileID,'Option#2: 1/x/a/sqrt(2*pi)*exp(-(log(x)-b)^2/2/a^2)*exp(-x/c)\n')
fprintf(fileID,'Use the root mean square error (rmse) reported by the fit command to select the best fit option above.\n') 
fprintf(fileID,'You will need to modify the option ''StartPoint'' [...,..,..] in fittype for using either option.\n') 
fprintf(fileID,'\n');
fprintf(fileID,'(b) [20 pts] Plot on the same figure the following:\n')
fprintf(fileID,'>The analyzed data vs the day number in a bar chart.\n')
fprintf(fileID,'>Predictions for 150 days from the best fit obtained with your chosen curve option #1 or # 2.\n')
fprintf(fileID,'\n');
fprintf(fileID,'(c) [30 pts] Compute a variable named daytarget with the date for which your curve fit predicts 0.2%% of daily positive case fatalities.\n')

end


fclose all;

disp('THE PROJECT FILE HAS BEEN SUCCESSFULLY CREATED.')
disp('IMPORTANT: MAKE YOUR SBUID WAS ENTERED CORRECTLY TO RECEIVE A SCORE')
fprintf('Your ENTERED SBUID IS: %9.0f \n',ID);
clear all
