function [total_yearly_accident_count] = accident_count_function2(x)
%variables:
% Capacity of onboard battery (B) [Watt-hours]
% Earthquake detection system accuracy (A) [percentage]
% Earthquake detection system speed (S) : ratio of speed to magnitude? [meters/second/magnitude]
% Earthquake magnitude resistance threshold of derailment guards on tracks (t)

x1 = [120	181	32	234	16	77	109	146	34	195	21	281	31.17124424	28.8394559	15.76329319	4	3115335256	0.9721863654	58.06164593	197.4586855	78.59754594];
num_cars=x1(16);
B = x(1);
A = x(2);
S = x(3);
t = x(4);
V = x(5); 

%parameters:
%load earthquake data for 6 months in japan (9/27/2024 ~ 3/26/2025)
earthquake_data_sorted = load("earthquake_data_sorted.mat");
data = earthquake_data_sorted.earthquakes;

%general parameters
m = num_cars*44687.5; %mass of train, placeholder [kg]
% Vmax = 44; %max allowed velocity of train, placeholder [meters/second]
percent_tunnels = 0.02; %percentage of tracks that are tunnels, placeholder
percent_bridges = 0.02; %percentage of tracks that are bridges, placeholder
V_battery = 5; %speed when traveling on battery, placeholder [m/s] roughly = 10mi/hr
power_outage_threshold = 5; %earthquake magnitude that causes power outage/blackout (placeholder)
safe_max_acceleration = 1.5; %placeholder, [m/s^2] safe deceleration amount when braking

%from: https://www.jrtt.go.jp/english/construction/shinkansen.html
%major tunnels: Kaga Tunnel (5.5km),No.2 Fukui Tunnel (3.5km),Shin-Hokuriku Tunnel (19.8km)
%major bridges: Tedorigawa river bridge (558m),No.2 Takedagawa river bridge (311m),Kuzuryugawa river bridge (414m）
%ideally should be average, but here are maxes:
max_tunnel_length = 5000; %meters
max_bridge_length = 500; %meters

%calculated parameters
earthquakes_power_outage = data;
earthquakes_power_outage(earthquakes_power_outage<power_outage_threshold) = [];
number_power_outage = length(earthquakes_power_outage);


%Objective function:
%f(X) = [number of bridge accidents] + [number of tunnel accidents] + [number of rail speed accidents]

% Number of rail speed accidents:
safe_speeds_to_reach = t./data; %speed train must slow down to during each earthquake 
safe_speeds_to_reach(safe_speeds_to_reach>V) = []; %if train is already moving at a safe speed, remove from dataset
no_warning_high_speed = (length(safe_speeds_to_reach))-(A*length(safe_speeds_to_reach)); %number of times train is moving at dangerous speed and no warning is given for an earthquake

safe_speeds_to_reach(safe_speeds_to_reach>(V - (safe_max_acceleration*S))) = []; %remove times train can slow down in time with a warning from dataset
railspeed_accident_count = length(safe_speeds_to_reach) + no_warning_high_speed; %take total count and add count of times no warning is given

total_yearly_accident_count = 2*((number_power_outage*percent_bridges*((((V_battery*(B/((1/2)*m*V_battery^2)))-(max_bridge_length/2))<0))) + (number_power_outage*percent_tunnels*((((V_battery*(B/((1/2)*m*V_battery^2)))-(max_tunnel_length/2))<0))) + (railspeed_accident_count));
end