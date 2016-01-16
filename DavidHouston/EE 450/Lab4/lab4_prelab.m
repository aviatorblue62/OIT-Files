%% EE 450: Lab 4 | PreLab
%----------------------------
clear all;
close all;
clc;

syms theta

M = [(cos(theta)).^2, sin(theta).*cos(theta);...
      sin(theta).*cos(theta), (sin(theta).^2)];
I = [ones(1,length(theta));1i*ones(1,length(theta))];

R = M*I;

Int = R(1)*conj(R(1)) + R(2)*conj(R(2));

ezplot(theta,Int);

  