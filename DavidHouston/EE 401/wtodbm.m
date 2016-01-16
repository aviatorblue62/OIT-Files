%% EE 401: Homework 1

clear all
close all
clc

watts = input('Input Power (Watts): ');
dbm = 10*log10((watts)*10^3/1e-3);
display(dbm);

watts = linspace(1e-3,10000,100000);
dbm = 10*log10((watts)*10^3/1e-3);

figure(1);
plot(watts,dbm);
xlabel('Watts');
ylabel('dBm');