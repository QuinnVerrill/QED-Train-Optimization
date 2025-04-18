clear all
global cd_mdl

var = [15,30,10,3;15,15,10,3;50,30,20,3;15,50,20,3;15,15,10,7;30,50,10,15;15,15,20,7;15,30,10,15;50,50,10,3;30,15,20,3;50,30,20,7;15,15,20,3];
sol = [0.7306;0.49511;0.603478;0.865479;0.825286;1.33042;0.7927;1.16979;0.869678;0.51569;1.02362;0.438809];
cd_mdl=fitlm(var,sol);
nvars=4;

lb=[15,15,10,3];
ub=[50,50,20,15];
intcon=[4]; % Makes number of cars discrete

[xopt,fval]=ga(@train_obj,nvars,[],[],[],[],lb,ub,@nonlincon,intcon)
TrainVelocity(fval)
 