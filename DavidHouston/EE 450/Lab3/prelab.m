%% EE 450: Lab 3
%-----------------------------------------
clear all;
close all;
clc

h = [0.1;1]*1e-3; % object height
y = linspace(0,5,1000)*1e-3; % distance
lambda = 633e-9; % (mm) wavelength
D = 500e-3;
FP = (1-cos(2*pi*h*y/(lambda*D)));

figure('Color', [1 1 1]);
subplot(2,1,1)
plot(y*1e3,FP(1,:));
xlabel('y (mm)');
ylabel('Fringe Pattern');
title('Fringe Pattern at h(1)');

subplot(2,1,2)
plot(y*1e3,FP(2,:));
ylabel('y (mm)');
xlabel('Fringe Pattern');
title('Fringe Pattern at h(2)');

