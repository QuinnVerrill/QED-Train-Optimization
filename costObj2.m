function [totalCost] = costObj2(x1)
%variables:
x = [120	181	32	234	16	77	109	146	34	195	21	281	31.17124424	28.8394559	15.76329319	4	3115335256	0.9721863654	58.06164593	197.4586855	78.59754594];

%network: (x(1:12))
%train: (x(13:16))
%safety: (x(17:21))

%Network Optimization:
% St_x, St_y: station coordinates
% [St1_x, St1_y] = [x(1), x(2)];
% [St2_x, St2_y] = [x(3), x(4)];
% [St3_x, St3_y] = [x(5), x(6)];
% [St4_x, St4_y] = [x(7), x(8)];
% [St5_x, St5_y] = [x(9), x(10)];
% [St6_x, St6_y] = [x(11), x(12)];

%Train Aerodynamics Optimization:
angle_alpha = x(13);
angle_beta = x(14);
angle_gamma = x(15);
num_cars = x(16);

%Safety System Optimization:
% Capacity of onboard battery (B) [Watt-hours]
% Earthquake detection system accuracy (A) [percentage]
% Earthquake detection system speed (S) : ratio of speed to magnitude? [meters/second/magnitude]
% Earthquake magnitude resistance threshold of derailment guards on tracks (t)
B = x1(1);
A = x1(2);
S = x1(3);
t = x1(4);
V = x1(5);

%Function Calls:
%Call Network cost function:
network_cost = networkCost(x(1:12));

%Call train cost function:
train_cost = TrainCost(num_cars);

%Call safety system cost function:
safety_system_cost = safety_system_cost_function(x1);

%Total combined cost
totalCost = network_cost + train_cost + safety_system_cost;
totalCost = double(totalCost);
end

