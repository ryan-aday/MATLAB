% OOP problem for homework#4
clear all
clc

temperature=importdata('measurements.csv');

% Get number of columns for the imported data matrix
N=size(temperature.data,2);

%Create N objects of the class "measurements" 
%using the class definition file measurements.m
for ii=1:N
data(ii)=measurements(temperature.data(:,ii));
end

%Convert the entire set of measurements to Celsius degress 
for ii=1:N
data(ii)=data(ii).Celsius;
end

%Subtract the mean to the measurements to Celsius degress 
for ii=1:N
data(ii)=data(ii).SubtractMean;
end

%Store the results in matrix array and output to a .xls file
for ii=1:N
Output(:,ii)=data(ii).values;
end

%Output the matrix with results into an excel file
writematrix(Output,'Celsius.xls');