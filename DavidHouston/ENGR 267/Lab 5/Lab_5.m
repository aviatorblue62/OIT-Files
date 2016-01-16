%% Lab 5

%% Task #1

clear all
format SHORTE

A = [0 0 0];

A(1) = input('Amplitude of 1st signal: ');
X = input('Freq of Samples 1st signal: ');

A(2) = input('Amplitude of 2nd signal: ');
Y = input('Freq of Samples 2nd signal: ');

A(3) = input('Amplitude of 3rd signal: ');
Z = input('Freq of Samples 3rd signal: ');

n = 0:120;
f = round([120/X 120/Y 120/Z]);
cos_val = cos(2*pi*n/120);

signal_1 = A(1)*cos_val(1+mod(f(1)*n,120));
signal_2 = A(2)*cos_val(1+mod(f(2)*n,120));
signal_3 = A(3)*cos_val(1+mod(f(3)*n,120));

mixed_signal = signal_1 + signal_2 + signal_3;

subplot(411)
plot(n,signal_1)

subplot(412)
plot(n,signal_2)

subplot(413)
plot(n,signal_3)

subplot(414)
plot(n,mixed_signal)

%% Task #2
clear all
format SHORTE
A = [0 0 0];

A(1) = input('Amplitude of 1st signal: ');
X = input('Freq of Samples 1st signal: ');

A(2) = input('Amplitude of 2nd signal: ');
Y = input('Freq of Samples 2nd signal: ');

n = 0:120;
f = round([120/X 120/Y]);
cos_val = cos(2*pi*n/120);

signal_1 = A(1)*cos_val(1+mod(f(1)*n,120));
signal_2 = A(2)*cos_val(1+mod(f(2)*n,120));

mod_signal = signal_1 .* signal_2;
mixed_signal = signal_1 + signal_2;

subplot(411)
plot(n,signal_1)

subplot(412)
plot(n,signal_2)

subplot(413)
plot(n,mod_signal)

subplot(414)
plot(n,mixed_signal)

%% Task #3

clear all
format SHORTE

Matrix_one = [0 0 0; 0 0 0; 0 0 0];
for k = 1:3
    Matrix_one(1,k) = input('Enter first row: '); 
end

for k = 1:3
    Matrix_one(2,k) = input('Enter second row: ');
end

for k = 1:3
    Matrix_one(3,k) = input('Enter third row: ');
end
Matrix_one

% Task #4

format SHORTE

Matrix_one + Matrix_one

Matrix_one - Matrix_one

5*Matrix_one

Matrix_one/3

1.6666667*Matrix_one
