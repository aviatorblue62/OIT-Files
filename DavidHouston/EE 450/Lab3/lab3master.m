%% EE 450: Lab 3

clear all;
close all;
clc;

image_plot = load('Values.txt');
object_sep = 1.826; % mm
s = 177;
sp = 70;
D = 230+55;
h = object_sep*s/sp;
peaks_final = [];
Ir = max(image_plot(1:263,2))

figure(1);
plot(image_plot(:,1),image_plot(:,2));
xlabel('Distance (mm)');
ylabel('Gray Value (Intesity)');
title('Intensity Plot');
axis tight;

fs = 1/(-image_plot(1,1)+image_plot(2,1));
[X,f] = ComputeSpectrum(image_plot(:,2),fs,2^12);

figure(2);
plot(f,X);
xlabel('Spacial Frequency (1/m)');
ylabel('Amp');
title('FFT Intensity Plot');
axis tight;

index = f(find(X > 1.5e4));

lambda = 2*pi*(h-0.1)*(1/index(9)-0.001)/(D*acos(abs(1-Ir)))



