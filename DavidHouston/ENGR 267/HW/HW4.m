%% Title: Homework Code
% Name: David Houston\
% Course: ENGR 267\
% Inst.: Paul Dingman

%% IDFT
clear all
format short

XX = zeros(1,512);
REF = zeros(1,257);
IMF = zeros(1,257);

% Mythical Program which loads data into REF and IMF

N = length(XX);
K = length(REF);
H = length(IMF);

for k = 1:K
    REF(k) = REF(k)/(N/2);
    IMF(k) = IMF(k)/(N/2);
end

REF(1) = REF(1)/2;
REF(K) = REF(K)/2;


for h = 1:N
    XX(h) = 0;
end
for k = 1:K
    for h = 1:N
        XX(h) = XX(h) + REF(k)*cos(2*pi*k*h/N);
        XX(h) = XX(h) + IMF(k)*sin(2*pi*k*h/N);
    end
end

%% DFT

XX = zeros(1,512);
REF = zeros(1,257);
IMF = zeros(1,257);

% Mythical Program which loads data into REF and IMF

N = length(XX);
K = length(REF);
H = length(IMF);

for k = 1:N
    for h = 1:K
        REF(h) = REF(h) + XX(k)*cos(2*pi*k*h/N);
        IMF(h) = IMF(h) - XX(k)*sin(2*pi*k*h/N);
    end
end
