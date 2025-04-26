function [c, ceq] = nonlincon_safety(x)
    global cd_mdl
    
    %%% Train Saftey Constraints
    % maximum number of accidents per year
    maxAccidents = 3; % paramater to tune!!!!!!!
    c(index+4) = maxAccidents - accident_count_function(x(17:21));
   
    ceq = [];
end
