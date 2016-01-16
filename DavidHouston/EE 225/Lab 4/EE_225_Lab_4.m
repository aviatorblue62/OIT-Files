%% EE 225 Lab 4

%% Pre-Lab

% Y = 3 + 5*j;
% 
% abs(Y)
% angle(Y)

%----------------------------------

% xx = [ones(1,4),[2:2:11],zeros(1,3)]
% xx(3:7)
% length(xx)
% xx(2:2:length(xx))
% 
% xx(3,7) = pi*(1:5)


%% Fourier Series
clear all
format SHORT

No = 32;
To = pi;
n = linspace(0,pi,No);
x = exp(-n/2);

X_f = fft(x,No);
X_f = [conj(X_f(No:-1:2)),X_f];
X_fmag = abs(X_f);
X_fangle = angle(X_f);
k = -No/2+1:No/2-1;

subplot(211)
stem(k,X_fmag(No/2+1:length(X_f)-No/2))
title('Magnitude')

subplot(212)
stem(k,X_fangle(No/2+1:length(X_f)-No/2))
title('Phase')

%% Fourier Transform

%% Part I

clear all
format short

N_pnts = 100; % t goes from -5 to 5

t0 = linspace(-5,(-1-1/10),N_pnts/2.5);
t1 = linspace(-1,0,11);
t2 = linspace((0+1/10),1,N_pnts/10);
t3 = linspace((1+1/10),5,N_pnts/2.5);
t = linspace(-5,5,101);

x_1 = [0*t0 (t1+1) 1 1 1 1 1 1 1 1 1 1 0*t3];

subplot(311)
plot(t,x_1)
title('Piecewise Linear Function')
xlabel('-5 \leq t \leq 5')
ylabel('Amplitude')

X1 = fft(x_1);
X1 = fftshift(X1);
X1mag = abs(X1);
X1mag = X1mag/max(X1mag); %Normalization
X1angle = angle(X1);
X1angle = X1angle/max(X1angle);
F1 = [-length(X1)/2:(length(X1)/2)-1]*100/length(X1);

subplot(312)
plot(F1,X1mag)
xlabel('f (Hz)')
ylabel('Amplitude')

subplot(313)
plot(F1,X1angle)
title('Phase')
xlabel('f (Hz)')
ylabel('Angle')

%% Part II

clear all
format short

N_pnts = 100; % t goes from -5 to 5

t0 = linspace(-5,(0-1/10),N_pnts/2);
t1 = linspace(0,1,N_pnts/10);
t2 = linspace(1,2,N_pnts/10);
t3 = linspace((2+1/10),5,N_pnts/(10/3));
t = linspace(-5,5,100);

x_2 = [0*t0 (t1) 1 1 1 1 1 1 1 1 1 1 0*t3];

subplot(311)
plot(t,x_2)
title('Piecewise Linear Function')
xlabel('-5 \leq t \leq 5')
ylabel('Amplitude')

X2 = fft(x_2);
X2 = fftshift(X2);
X2mag = abs(X2);
X2mag = X2mag/max(X2mag); %Normalization
X2angle = angle(X2);
X2angle = X2angle/max(X2angle);
F2 = [-length(X2)/2:(length(X2)/2)-1]*100/length(X2);

subplot(312)
plot(F2,X2mag)
xlabel('f (Hz)')
ylabel('Amplitude')

subplot(313)
plot(F2,X2angle)
title('Phase')
xlabel('f (Hz)')
ylabel('Angle')

%% Part III

clear all
format short

N_pnts = 100; % t goes from -5 to 5

t0 = linspace(-5,(-3-1/10),N_pnts/5);
t1 = linspace(-3,3,N_pnts/(5/3));
t2 = linspace(3+1/10,5,N_pnts/5);
t = linspace(-5,5,100);


x_3 = [0*t0 ones(1,60) 0*t2];

subplot(311)
plot(t,x_3)
title('Piecewise Linear Function')
xlabel('-5 \leq t \leq 5')
ylabel('Amplitude')

X3 = fft(x_3);
X3 = fftshift(X3);
X3mag = abs(X3);
X3mag = X3mag/max(X3mag); %Normalization
X3angle = angle(X3);
X3angle = X3angle/max(X3angle);
F3 = [-length(X3)/2:(length(X3)/2)-1]*100/length(X3);

subplot(312)
plot(F3,X3mag)
xlabel('f (Hz)')
ylabel('Amplitude')

subplot(313)
plot(F3,X3angle)
title('Phase')
xlabel('f (Hz)')
ylabel('Angle')


%% Part IV
clear all
format short

N_pnts = 100; % t goes from -5 to 5

t0 = linspace(-5,(-1-1/10),N_pnts/2.5);
t1 = linspace(-1,1,N_pnts/5);
t2 = linspace(1+1/10,5,N_pnts/2.5);
t = linspace(-5,5,100);


x_4 = [0*t0 ones(1,20) 0*t2];

subplot(311)
plot(t,x_4)
title('Piecewise Linear Function')
xlabel('-5 \leq t \leq 5')
ylabel('Amplitude')

X4 = fft(x_4);
X4 = fftshift(X4);
X4mag = abs(X4);
X4mag = X4mag/max(X4mag); %Normalization
X4angle = angle(X4);
X4angle = X4angle/max(X4angle);
F4 = [-length(X4)/2:(length(X4)/2)-1]*100/length(X4);

subplot(312)
plot(F4,X4mag)
xlabel('f (Hz)')
ylabel('Amplitude')

subplot(313)
plot(F4,X4angle)
title('Phase')
xlabel('f (Hz)')
ylabel('Angle')

%% Circuit Anlaysis

%% Sawtooth Wave
clear all
format SHORTE
t = linspace(0,10,100);
sin_val = sin(t);
yDC = 0.5 + sin(t)/pi;
yh = zeros(10,100);
yh(1,:) = yDC;

for k=2:10
    yh(k,:) = sin(k*t)/(k*pi);
end

%The Fundemental Frequency
subplot(221)
plot(t,yDC,'b')
title('First Harmonic')
xlabel('t (sec)')
ylabel('V (volts)')
grid on

%The first two harmonics

y2 = yDC + yh(2,:);

subplot(222)
plot(t,y2,'r')
title('First Two Harmonics')
xlabel('t (sec)')
ylabel('V (volts)')
grid on

%The first five harmonics
y5 = yDC;
for k=2:5
    y5 = y5 + yh(k,:);
end
subplot(223)
plot(t,y5,'g')
title('First Five Harmonics')
xlabel('t (sec)')
ylabel('V (volts)')
grid on

%The first ten harmonics
y10 = yDC;
for k=2:10
    y10 = y10 + yh(k,:);
end
subplot(224)
plot(t,y10,'m')
title('First Ten Harmonics')
xlabel('t (sec)')
ylabel('V (volts)')
grid on

%% Square Wave
t = linspace(0,10,1000);
Amp = 5;
zero = zeros(1,1000);
yh = zeros(10,1000);

for k=1:10
    yh(k,:) = (4*Amp/pi)*(1/((2*k)-1))*sin((2*k-1)*t);
end

%The Fundemental Frequency

y = yh(1,:);

subplot(221)
plot(t,y,'r')
title('Fundemental Frequency')
xlabel('t (sec)')
ylabel('V (volts)')

%The first two harmonics
y2 = zero;
for k = 1:2
 y2 = y2 + yh(k,:);
end

subplot(222)
plot(t,y2,'r')
title('The First Two Harmonics')
xlabel('t (sec)')
ylabel('V (volts)')

%The first five harmonics
y5 = zero;
for k=1:6
    y5 = y5 + yh(k,:);
end
subplot(223)
plot(t,y5,'g')
title('First Five Harmonics')
xlabel('t (sec)')
ylabel('V (volts)')

%The first ten harmonics
y10 = zero;
for k=1:10
    y10 = y10 + yh(k,:);
end
subplot(224)
plot(t,y10,'m')
title('First Ten Harmonics')
xlabel('t (sec)')
ylabel('V (volts)')

%% Full-wave Rectified Sine
t = linspace(0,10,1000);
Amp = 2;
yh = zeros(10,1000);
yDC = 2*Amp/pi;

for k=1:10
    yh(k,:) = -(4*Amp/pi)*(1/((4*k^2)-1))*cos(4*k*t);
end

%The Fundemental Frequency

y = yDC + yh(1,:);

subplot(221)
plot(t,y,'r')
title('Fundemental Frequency')
xlabel('t (sec)')
ylabel('V (volts)')


%The first two harmonics
y2 = yDC;
for k = 1:2
 y2 = y2 + yh(k,:);
end

subplot(222)
plot(t,y2,'r')
title('The First Two Harmonics')
xlabel('t (sec)')
ylabel('V (volts)')

%The first five harmonics
y5 = yDC;
for k=1:6
    y5 = y5 + yh(k,:);
end
subplot(223)
plot(t,y5,'g')
title('First Five Harmonics')
xlabel('t (sec)')
ylabel('V (volts)')

%The first ten harmonics
y10 = yDC;
for k=1:10
    y10 = y10 + yh(k,:);
end
subplot(224)
plot(t,y10,'m')
title('First Ten Harmonics')
xlabel('t (sec)')
ylabel('V (volts)')

%% Full-wave Rectified Sine
t = linspace(0,10,1000);
Amp = 2;
yh = zeros(10,1000);
y1 = Amp/pi + Amp*sin(4*t)/2;

for k=1:10
    yh(k,:) = -(2*Amp/pi)*(1/((4*k^2)-1))*cos(2*4*k*t);
end

%The Fundemental Frequency

y = y1;

subplot(221)
plot(t,y,'r')
title('Fundemental Frequency')
xlabel('t (sec)')
ylabel('V (volts)')


%The first two harmonics
y2 = y;
for k = 1:2
 y2 = y2 + yh(k,:);
end

subplot(222)
plot(t,y2,'r')
title('The First Two Harmonics')
xlabel('t (sec)')
ylabel('V (volts)')

%The first five harmonics
y5 = y;
for k=1:6
    y5 = y5 + yh(k,:);
end
subplot(223)
plot(t,y5,'g')
title('First Five Harmonics')
xlabel('t (sec)')
ylabel('V (volts)')

%The first ten harmonics
y10 = y;
for k=1:10
    y10 = y10 + yh(k,:);
end
subplot(224)
plot(t,y10,'m')
title('First Ten Harmonics')
xlabel('t (sec)')
ylabel('V (volts)')