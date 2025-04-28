function [c, ceq] = nonlincon_train(x)
    global cd_mdl
    [r1, r2] = getGlobalVars;
    vmax = r2;

    %%% Train Optimization constraints   
    cd = predict(cd_mdl,x);
    v = TrainVelocity(cd);
    minVel = 70; %paramter to tune!!!!!! (in m/s)
    minCars = 6; %paramater to tune!!!! assuming 80 passengers per car - 480 capacity 
    %setting maximum velocity & minimum velocity
    c(index+1) = v - vmax; %x(21) is max velocity set by saftey subsystem 
    c(index+2) = minVel - v;
    c(index+3) = minCars - x(17);
      
    ceq = [];
end
