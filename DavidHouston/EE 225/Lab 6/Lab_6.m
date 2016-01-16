%% Lab 6

%% Part A: Symbolic Fourier Anlaysis

clear all
format short

syms t w

x1 = exp(-t)*heaviside(t);
x2 = exp(-abs(t));
x3 = t*exp(-abs(t));

%% For x1(t)

fourier_x = fourier(x1);
t_vec = [-3:0.01:3];
x_t = subs(x1,t,t_vec);
figure(1)
plot(t_vec,x_t);
axis([-3 3 -.1 1.1]);
xlabel('t (sec)');
ylabel('x1(t)');

w_vec = [-50:0.01:50];
fourier_x3_w = subs(fourier_x,w,w_vec);
figure(2)
subplot(211)
plot(w_vec,abs(fourier_x3_w));
axis([-50 50 -.50 1.5]);
xlabel('\omega (rad/s)')
ylabel('|X(\omega)|');
subplot(212)
plot(w_vec, angle(fourier_x3_w));
xlabel('\omega (rad/s)')
ylabel('phase (rads)')

fourier_x3_w_theo = sinc(w_vec/(2*pi));
subplot(211)
hold on
plot(w_vec, abs(fourier_x3_w_theo), 'r--');
legend('symbolic', 'theoretical');
subplot(212)
hold on
plot(w_vec, angle(fourier_x3_w_theo), 'r--');
legend('symbolic', 'theoretical');

%% For x2(t)

fourier_x = fourier(x2);
t_vec = [-3:0.01:3];
x_t = subs(x2,t,t_vec);
figure(1)
plot(t_vec,x_t);
axis([-3 3 -.1 1.1]);
xlabel('t (sec)');
ylabel('x1(t)');

w_vec = [-50:0.01:50];
fourier_x3_w = subs(fourier_x,w,w_vec);
figure(2)
subplot(211)
plot(w_vec,abs(fourier_x3_w));
axis([-50 50 -.50 1.5]);
xlabel('\omega (rad/s)')
ylabel('|X(\omega)|');
subplot(212)
plot(w_vec, angle(fourier_x3_w));
xlabel('\omega (rad/s)')
ylabel('phase (rads)')

fourier_x3_w_theo = sinc(w_vec/(2*pi));
subplot(211)
hold on
plot(w_vec, abs(fourier_x3_w_theo), 'r--');
legend('symbolic', 'theoretical');
subplot(212)
hold on
plot(w_vec, angle(fourier_x3_w_theo), 'r--');
legend('symbolic', 'theoretical');

%% For x3(t)

fourier_x = fourier(x3);
t_vec = [-3:0.01:3];
x_t = subs(x3,t,t_vec);
figure(1)
plot(t_vec,x_t);
axis([-3 3 -.1 1.1]);
xlabel('t (sec)');
ylabel('x1(t)');

w_vec = [-50:0.01:50];
fourier_x3_w = subs(fourier_x,w,w_vec);
figure(2)
subplot(211)
plot(w_vec,abs(fourier_x3_w));
axis([-50 50 -.50 1.5]);
xlabel('\omega (rad/s)')
ylabel('|X(\omega)|');
subplot(212)
plot(w_vec, angle(fourier_x3_w));
xlabel('\omega (rad/s)')
ylabel('phase (rads)')

fourier_x3_w_theo = sinc(w_vec/(2*pi));
subplot(211)
hold on
plot(w_vec, abs(fourier_x3_w_theo), 'r--');
legend('symbolic', 'theoretical');
subplot(212)
hold on
plot(w_vec, angle(fourier_x3_w_theo), 'r--');
legend('symbolic', 'theoretical');


%% Part B: Band Pass Filtering of Audio Signals

clear all
format short
cutoff_freq = 100;
[data,Fs,Nbits] = wavread('amy.wav');
data = data(:,1).';
Ts = 1/Fs;
%sound(data,Fs)
t = [-10:Ts:10];
wb = cutoff_freq*2*pi;
ht = wb/(2*pi)*sinc(wb*t/(2*pi));
y = conv(data,ht,'same');
y = y/max(abs(y));
%sound(y,Fs);

%% I am now corrupting the data
corrupt_100 = zeros(1,length(y));
corrupt_6000 = zeros(1,length(y));

for k = 1:length(y)
    corrupt_100(k) = ((-1)^(2*k-1))*1.5*(cos(2*pi*100*k/length(y)));
end

for k = 1:length(y)
    corrupt_6000(k) = ((-1)^(k))*1.5*sin(2*pi*6000*k/length(y));
end

corrupted_data = corrupt_100 + corrupt_6000 + data;

sound(corrupted_data,Fs);

%% I am now sorting out the data

t = [-10:Ts:10];
fb = 1750;
f0 = 2000;
ht = (2*(fb-f0))*sinc(t*2*(fb-f0));
uncor_data = conv(corrupted_data,ht,'same');
uncor_data = uncor_data/max(abs(uncor_data));

sound(uncor_data,Fs);






