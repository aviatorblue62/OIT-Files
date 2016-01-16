%% Task #1

n = 1:120;

cos_val = cos(2*pi*n/120);

cos_40 = cos_val(1+mod(3*n,120));
cos_20 = cos_val(1+mod(6*n,120));

cos_sum = cos_40 + cos_20;

subplot(311)
plot(n,cos_40)

subplot(312)
plot(n,cos_20)

subplot(313)
plot(n,cos_sum)

%% Task #2

cos_10 = cos_val(1+mod(12*n,120));

cos_mod = (cos_sum).*(cos_10);

plot(n,cos_mod)

%% Task #3

decay = ((2.^(n/40)).^-1);

plot(n,decay)

%% Task #4

cos_decay = decay.*cos_mod;

subplot(211)
plot(n,cos_mod)

subplot(212)
plot(n,cos_decay)

%% Task #5

clear all
format SHORT
final = input ('Enter number of samples: ');
n = 0:final;

signal = input('Enter Signal Table w/ variable "n": ');

plot(n,signal)

halflife = input('Enter Halflife (in samples): ');

decay = ((2.^(n/halflife)).^-1);

cos_decay = decay.*signal;

plot(n,cos_decay)

%User Input





