clear
close all

%% The process's transfer function

s=tf('s');

G = 10^4 * (s+2) * (s-1) / ( (s+3) * (s+2) * (s+100)^2 );

% Hinf(G);
% [F_num, F_denom] = ss2tf(F.a, F.b, F.c, F.d)
% Fsim = minreal(tf(F_num, F_denom))

Gsim = G;

% Load the controller determined by Hinf.
% The weight Ws is 10^4 / ((s+a)(s+b))
% where 
% a = -0.1 + i * sqrt((100π)^2 - 0.1^2)
% b = -0.1 - i * sqrt((100π)^2 - 0.1^2)
% The weight Wt is 3 / (s+2)
load('Fsim_2.mat')
Fsim = Fsim_2;

%% Run the simulation
macro