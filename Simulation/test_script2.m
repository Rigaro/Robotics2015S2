%script for testing cons_ik.m

clc
clear all
close all

[jd_opt, error] = cons_ik([0;0; 0.45], [10;0;0]);

TM0_G0prime = [1 0 0 0.064;
    0 1 0 0;
    0 0 1 (-0.062-0.0525);
    0 0 0 1];


plot_robot(jd_opt, inv(TM0_G0prime))
xlabel('x')
ylabel('y')
zlabel('z')
error