% RAHUL VIVEK SAWANT
% 09/09/2018
% Problem Number 3
% % Description of the Code
% Find if system is stable or unstable and if stable then 
% calculate settling time of the system. Include the transient 
% responses in your assignment for those systems that are stable. 

%% The Code

close all 
clear all
clc
%% PART A:
sys1 = tf([-1 2],[1 2 4])
% poles will be
p = pole(sys1)
% transient response
figure;
step(sys1)
% calculate settling time
S = stepinfo(sys1)
st1 = S.SettlingTime
fprintf('Settling time = %f sec\n',st1)


%% PART B:
sys2 = tf([1 1 1],[1 6 11 6])
% poles will be
p = pole(sys2)
% transient response
figure;
step(sys2)
% calculate settling time
S = stepinfo(sys2)
st2 = S.SettlingTime
fprintf('Settling time = %f sec\n',st2)


%% PART C:
sys3 = tf([1 0],[1 0 7 6])
% poles will be
p = pole(sys3)
% transient response
figure;
step(sys3)
% calculate settling time
fprintf('Since 2 poles are on RHS of imaginary axis. System is unstable.')

