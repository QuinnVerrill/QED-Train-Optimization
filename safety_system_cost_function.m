function [total_cost] = safety_system_cost_function(x)
%variables:
% Capacity of onboard battery (B) [Watt-hours]
% Earthquake detection system accuracy (A) [percentage]
% Earthquake detection system speed (S) : ratio of speed to magnitude? [meters/second/magnitude]
% Earthquake magnitude resistance threshold of derailment guards on tracks (t)
B = x(1);
A = x(2);
S = x(3);
t = x(4);
V = x(5); %just added this NEW

% [r1, r2] = getGlobalVars;
% numberofcars = r2;
%need to adjust m using nubmer of cars 

%cost estimates:
%Battery is $139/kWh for lithium-ion battery pack (source:%https://about.bnef.com/blog/lithium-ion-battery-pack-prices-hit-record-low-of-139-kwh/)
%Earthquake system accuracy cost is alert_cost = ((4000*(A*100)^2) + 2000*(S^2)) (guess - made up equation)
%guard cost: 10000*t (guess)

total_cost = (139*(B/1000)) + ((4000*(A*100)^2) + 2000*(S^2)) + (10000*t);

% %parameters:
% %load earthquake data for 6 months in japan (9/27/2024 ~ 3/26/2025)
% earthquake_data_sorted = load("earthquake_data_sorted.mat");
% data = earthquake_data_sorted.earthquakes;
end