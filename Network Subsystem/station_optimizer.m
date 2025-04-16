clear;
lb = [0,0,0,0,0,0,0,0,0,0,0,0];
ub = [133,307,133,307,133,307,133,307,133,307,133,307];
intcon = [1,2,3,4,5,6,7,8,9,10,11,12];
nvars = 12;
nonlincon = @nonlincon;
fun = @networkScore;
options = optimoptions('ga', ...
    'Display', 'iter', ...                          
    'PlotFcn', {@gaplotbestf, @gaplotbestindiv}, ... 
    'UseParallel', true, ...                        % faster evals
    'PopulationSize', 120, ...
    'EliteCount', ceil(0.15 * 120), ...             % 15% of population kept as elite
    'CrossoverFraction', 0.70, ...                   % 70% of population undergoes crossover
    'CrossoverFcn', @crossoverlaplace, ...          % good for real-valued obj funcs
    'MutationFcn', @mutationadaptfeasible, ...      % adaptive mutation but only in the feasible space
    'SelectionFcn', @selectiontournament, ...       % tournament selection
    'MaxGenerations', 120, ...
    'FunctionTolerance', 1e-3, ...                  % stop if improvement in func value is very small
    'ConstraintTolerance', 1e-3, ...                % tight, but not zero, tolerance on constraints
    'InitialPenalty', 5, ...
    'PenaltyFactor', 100, ...                       % quickly increase penalties for violating constraints
    'MaxStallGenerations', 20);                     % stop if no improvement (beyond tolerance) after 20 generations

[x,fval,exitflag,output,population,scores] = ga(fun,nvars,[],[],[],[],lb,ub,nonlincon,intcon,options);
%%

% Get population data (heatmap)
pop_density = read_pop();

% Get station locations from x
stations = round(reshape(x, 2, [])');  % [x1, y1; x2, y2; ...]
numStations = size(stations, 1);

% Plot heatmap
figure;
imagesc(pop_density');  % Transpose to match axis orientation
colormap hot;           % Use heat colormap
colorbar;
axis equal tight;
title('Optimized Station Locations on Population Heatmap');
xlabel('X'); ylabel('Y');

Overlay station locations
hold on;
scatter(stations(:,1), stations(:,2), 100, 'w', 'filled', 'DisplayName', 'Stations');
text(stations(:,1)+2, stations(:,2), ...
    compose('S%d', 1:numStations), ...
    'Color','white', 'FontSize', 12);

legend;

%% 
run1_loc = x;
run1_score = networkScore(x)