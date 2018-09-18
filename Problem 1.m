% RAHUL VIVEK SAWANT
% 09/09/2018
% Problem Number 1
% % Description of the Code
% MATLAB file to calculate analytical solution of the plant p(s)
% and verifying the step response of transfer funtion with 
% analytical solution given step input.

%% The Code

close all 
clear all
clc
%% PART A:
syms s
n_S1 = 5 % numerator
p_S = n_S1/(s^2+6*s+5) % plant
input = 1/s % step input
sys = p_S*input % system
ilaplace(sys) % inverse laplace transform
clear all


%% PART B: First plot
t = 0:0.1:7;
y = 1 - (5/4)*exp(-t)+(1/4)*exp(-5*t); % analytical solution
figure;
plot(t,y);
xlabel('Time (secs)');
ylabel('Amplitude of analytical solution');
title('MECE7362/5397 Homework 1 SAWANT');
%% Second plot
sys1 = tf(5,[1 6 5]) % system
figure;
step(sys1) % step response
clear all


%% PART C: n(s)=(2s+1)
% impulse input
syms s
n_S2_1 = 2 % numerator
p_S = n_S2_1/(s^2+6*s+5) % plant
input = 1 % impulse input
sys_1 = p_S*input % system
ilaplace(sys_1) % inverse laplace transform
% step input
n_S2_2 = 1 % numerator
p_S = n_S2_2/(s^2+6*s+5) % plant
input = 1/s % step input
sys_2 = p_S*input % system
ilaplace(sys_2) % inverse laplace transform
% First plot
t = 0:0.1:7;
y1 = exp(-t)/2 - exp(-5*t)/2; % analytical solution
y2 = exp(-5*t)/20 - exp(-t)/4 + 1/5; % analytical solution
figure;
plot(t,y1,'b',t,y2,'r');
xlabel('Time (secs)');
ylabel('Analytical solution system responses');
legend('Impulse Response of System without Zero','Step Response of System Without Zero')
% Second plot
y3 = y1+y2; % analytical solution
figure;
plot(t,y3);
xlabel('Time (secs)');
ylabel('Analytical solution system response');
title('MECE7362/5397 Homework 1 SAWANT');
% Third plot
sys_3 = tf([2 1],[1 6 5]) % system
figure;
step(sys_3) % step response
clear all
%% n(s)=(-2s+1)
% impulse input
syms s
n_S2_1 = -2 % numerator
p_S = n_S2_1/(s^2+6*s+5) % plant
input = 1 % impulse input
sys_1 = p_S*input % system
ilaplace(sys_1) % inverse laplace transform
% step input
n_S2_2 = 1 % numerator
p_S = n_S2_2/(s^2+6*s+5) % plant
input = 1/s % step input
sys_2 = p_S*input % system
ilaplace(sys_2) % inverse laplace transform
% First plot
t = 0:0.1:7;
y1 = exp(-5*t)/2 - exp(-t)/2; % analytical solution
y2 = exp(-5*t)/20 - exp(-t)/4 + 1/5; % analytical solution
figure;
plot(t,y1,'b',t,y2,'r');
xlabel('Time (secs)');
ylabel('Analytical solution system responses');
legend('Impulse Response of System without Zero','Step Response of System Without Zero')
% Second plot
y3 = y1+y2; % analytical solution
figure;
plot(t,y3);
xlabel('Time (secs)');
ylabel('Analytical solution system response');
title('MECE7362/5397 Homework 1 SAWANT');
% Third plot
sys_3 = tf([-2 1],[1 6 5]) % system
figure;
step(sys_3) % step response
clear all



