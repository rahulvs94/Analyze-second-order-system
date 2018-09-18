% RAHUL VIVEK SAWANT
% 09/09/2018
% Problem Number 2
% % Description of the Code
% Calculate damping frequency, damping ratio, natural frequency 
% of the second order system, then compute percent overshoot, peak 
% time and settling time to compare with step response.

%% The Code

close all 
clear all
clc
%% PART A:
sys = tf([1 1],[1 0.4 1])
[num,den] = tfdata(sys,'v')
% poles will be
p = pole(sys)
% damping frequncy will be
wd = imag(p(1))
fprintf('Damping frequency = %f rad/sec\n',wd)
% calculate natural frequency and damping ratio
% % method 1
% x0 = [0.1;0.1]; 
% % options = optimoptions('fsolve','Display','iter','MaxFunctionEvaluations',3000,'MaxIterations',1500,'OptimalityTolerance',1.0000e-09)
% options = optimoptions('fsolve','Display','iter');
% x = fsolve(@calculate_freq,x0,options) 
% % x(2) is natural frequency in rad/sec
% % x(1) is damping ratio
% wn = abs(x(2))
% fprintf('Natural frequency = %f rad/sec\n',wn)
% zeta = abs(x(1))
% fprintf('Damping ratio = %f\n',zeta)
% method 2
wn = den(3)
fprintf('Natural frequency = %f rad/sec\n',wn)
zeta = den(2)/(2*wn)
fprintf('Damping ratio = %f\n',zeta)


%% PART B:
% calculate final value using FVT
syms s
fvt = double(limit((s+1)/(s^2+0.4*s+1), s, 0))
fprintf('final value by FVT = %.2f\n',fvt)
% calculate values by formula
tp = pi/(wn*sqrt(1-zeta*zeta))
fprintf('Calculated peak time = %f sec\n',tp)
po = 100*fvt*exp((-zeta*pi)/sqrt(1-zeta*zeta))
fprintf('Calculated percent overshoot = %f\n',po)
st = -log(0.02*sqrt(1-zeta*zeta))/(zeta*wn)
fprintf('Calculated settling time = %f sec\n',st)


%% PART C:
figure;
step(sys)


%% PART D:
% calculate values by simulation
S = stepinfo(sys)
tp_sim = S.PeakTime
fprintf('Simulated peak time = %f sec\n',tp_sim)
po_sim = S.Overshoot
fprintf('Simulated percent overshoot = %f\n',po_sim)
st_sim = S.SettlingTime
fprintf('Simulated settling time = %f sec\n',st_sim)