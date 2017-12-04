%% Beef Prices (Monday Sales)
%Alex Rhoads
%Date: June 20, 2017
%Script Name: Beef2.m

% The beef prices for the past couple of months. These prices have been
% taken from the union stockyards website. You can view a full list by going
% to wayback machine and typing in the union stockyards website.

clear all
clc

%% Import the data, extracting spreadsheet dates in Excel serial date format

startRow250=[3,10,17,24,31,38,45,52,59,66,73,81,88,95,102,109,116,123,130,138,145,152,159,166,173];
endRow250=[3,10,17,24,31,38,45,52,59,66,73,81,88,95,102,109,116,123,130,138,145,152,159,166,173];

startRow300 = startRow250+1;
endRow300 = endRow250+1;
startRow400 = startRow300+1;
endRow400 = endRow300+1;
startRow500 = startRow400+1;
endRow500 = endRow400+1;
[Date,Steerlow250,Steerhigh250] = importfile('Beef_price.xlsx','Sheet1',startRow250,endRow250);
[Date,Steerlow300,Steerhigh300] = importfile('Beef_price.xlsx','Sheet1',startRow300,endRow300);
[Date,Steerlow400,Steerhigh400] = importfile('Beef_price.xlsx','Sheet1',startRow400,endRow400);
[Date,Steerlow500,Steerhigh500] = importfile('Beef_price.xlsx','Sheet1',startRow500,endRow500);

%% Plots

%250-300
figure1 = figure;

plot1 = plot(Date,[Steerlow250,Steerhigh250]);

set(plot1(1),'DisplayName','Steerlow250');
set(plot1(2),'DisplayName','Steerhigh250');
title({'Steer prices 250-300 pounds'});
xlabel('Date');
ylabel('Price per pound ($/lb)');
grid on 
legend('Lowest Price','Highest Price','Location','Best')
ylim([0 inf])
yticklabels({'0','.20','.40','.60','.80','1.00','1.20','1.40','1.60','1.80','2.00'});

%305-400 Steer
figure2 = figure;

plot1 = plot(Date,[Steerlow300,Steerhigh300]);

set(plot1(1),'DisplayName','Steerlow300');
set(plot1(2),'DisplayName','Steerhigh300');

title({'Steer prices 305-400 pounds'});
xlabel('Date');
ylabel('Price per pound ($/lb)');
grid on
legend('Lowest Price','Highest Price','Location','Best')
ylim([0 inf])
yticklabels({'0','.20','.40','.60','.80','1.00','1.20','1.40','1.60','1.80','2.00'});

%405-500 Steer
figure3 = figure;

plot1 = plot(Date,[Steerlow400,Steerhigh400]);

set(plot1(1),'DisplayName','Steerlow400');
set(plot1(2),'DisplayName','Steerhigh400');

title({'Steer prices 405-500 pounds'});
xlabel('Date');
ylabel('Price per pound ($/lb)');
grid on
legend('Lowest Price','Highest Price','Location','Best')
ylim([0 inf])
yticklabels({'0','.20','.40','.60','.80','1.00','1.20','1.40','1.60','1.80','2.00'});

%505-600 Steer
figure4 = figure;

plot1 = plot(Date,[Steerlow500,Steerhigh500]);

set(plot1(1),'DisplayName','Steerlow500');
set(plot1(2),'DisplayName','Steerhigh500');

title({'Steer prices 505-600 pounds'});
xlabel('Date');
ylabel('Price per pound ($/lb)');
grid on
legend('Lowest Price','Highest Price','Location','Best')
ylim([0 inf])
yticklabels({'0','.20','.40','.60','.80','1.00','1.20','1.40','1.60','1.80','2.00'});

