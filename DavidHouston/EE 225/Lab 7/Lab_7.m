%% Part B
clear all
format shorte

n = [-10:1:39];

x1a = zeros(1,50);
x1b = zeros(1,50);
x1c = zeros(1,50);

for k = 1:50
    if(n(k) == 0) 
        x1a(k) = 1;
    end
    if(n(k) == 3) 
        x1b(k) = 1;
    end
    if(n(k) == -4)
        x1c(k) = 1;
    end
end

figure(1);
stem(n,x1a);

figure(2)
stem(n,x1b);

figure(3)
stem(n,x1c);

x2a = zeros(1,50);
x2b = zeros(1,50);

for k = 1:50
    if (n(k) >= 0)
        x2a(k) = 1;
    end
    
    if(n(k) >= 2)
        x2b(k) = 1;
    end
end

figure(4)
plot(n,x2a);

figure(5)
plot(n,x2b);

x3a = zeros(1,50);
x3b = zeros(1,50);
x3c = zeros(1,50);

for k = 1:50
    if((n(k) >= 0) & (n(k) <= 10))
        x3a(k) = 1;
    end
    
    h(k) = (n(k)+5);
    if((h(k) >= 0) & (h(k) <= 10))
        x3b(k) = 1;
    end
    
    g(k) = (3-n(k));
    if((g(k) >= 0) & (g(k) <= 10))
        x3c(k) = 1;
    end
end

figure(6)
plot(n,x3a)

figure(7)
plot(n,x3b)

figure(8)
plot(n,x3c)

x4 = zeros(1,50);

t = input('input factor of sampling rate: ')

for k = 1:50
    if((n(k) >= 8*t) & (n(k) <= (8*t+3)))
        x4(k) = 1;
    end
end

figure(9)
stem(n,x4)



%% SAMPLING_01_MAT

%

% MATLAB example of a continuous-time signal being sampled at various

% frequencies, illustrating the problem of aliasing caused by sampling

% at too low of a frequency.

%

% Sampling periods and sampling frequencies to be used.

% ws1 = 125.6637, ws2 = 62.8319, ws3 = 31.4159

%

fig_size = [232 84 774 624];

Ts1 = 0.05; Ts2 = 0.1; Ts3 = 0.2;

ws1 = 2*pi/Ts1; ws2 = 2*pi/Ts2; ws3 = 2*pi/Ts3;

%

% Frequencies for the continous-time signal and the time vector.

%

w1 = 7; w2 = 23;

t = [0:0.005:2];

%

% Original continuous-time signal is the sum of two cosines, with

% frequencies of 7 r/s and 23 r/s, respectively.

%

x = cos(w1*t) + cos(w2*t);

figure(1),clf,plot(t,x),grid,xlabel('Time (s)'),ylabel('Amplitude'),...

title('Continuous-Time Signal; x(t) = cos(7t) + cos(23t)'),...

set(gcf,'Position',fig_size)

%

% Sampling the continuous-time signal with a sampling period Ts = 0.05 s.

% The sampled signal is exactly equal to the continuous-time signal at the

% sample times, and the samples accurately model the original signal in

% the following respect: if you look at the samples by themselves and

% wanted to guess what the continuous-time signal looks like, you would be

% able to get pretty close. Note that ws1 is approximately 5.5*w2.

%

t1 = [0:Ts1:2];

xs1 = cos(w1*t1) + cos(w2*t1);

figure(2),clf,stem(t1,xs1);grid,hold on,plot(t,x,'r:'),hold off,...

xlabel('Time (s)'),ylabel('Amplitude'),...

title('Sampled Version of x(t) with T_s = 0.05 s'),...

set(gcf,'Position',fig_size)

%

% Sampling the continuous-time signal with a sampling period Ts = 0.1 s.

% The sampled signal is exactly equal to the continuous-time signal at the

% sample times. The samples are a less accurate representation of the

% original signal than with the smaller Ts (higher sampling frequency ws).

% Note that ws2 is approximately 2.7*w2.

%

t2 = [0:Ts2:2];

xs2 = cos(w1*t2) + cos(w2*t2);

figure(3),clf,stem(t2,xs2);grid,hold on,plot(t,x,'r:'),hold off,...

xlabel('Time (s)'),ylabel('Amplitude'),...

title('Sampled Version of x(t) with T_s = 0.1 s'),...

set(gcf,'Position',fig_size)

%

% Sampling the continuous-time signal with a sampling period Ts = 0.2 s.

% The sampled signal is exactly equal to the continuous-time signal at the

% sample times. The samples now are not a good representation of the

% original signal at all. Note that ws3 is approximately 1.37*w2.

%

t3 = [0:Ts3:2];

xs3 = cos(w1*t3) + cos(w2*t3);

figure(4),clf,stem(t3,xs3);grid,hold on,plot(t,x,'r:'),hold off,...

xlabel('Time (s)'),ylabel('Amplitude'),...

title('Sampled Version of x(t) with T_s = 0.2 s'),...

set(gcf,'Position',fig_size)

%

% Since ws3 < 2*w2, the Nyquist Sampling Theorem is violated, and x(t)

% could not be recovered from the samples obtained with Ts3 using an ideal

% low-pass filter. Aliasing has occurred. The samples of the original

% x(t) using a sampling period Ts3 have exactly the same values that the

% signal x1(t) = cos(w1*t) + cos((w2-ws3)*t) would have when sampled with

% a sampling period Ts3. w2 - w3 = -8.4159 r/s.

%

w2s3 = w2 - ws3;

x1 = cos(w1*t) + cos(w2s3*t);

%

figure(5),clf,stem(t3,xs3);grid,hold on,plot(t,x,'k:',t,x1,'r:'),...

hold off,xlabel('Time (s)'),ylabel('Amplitude'),...

title('Sampling x(t) and x_1(t) with T_s = 0.2 s'),...

set(gcf,'Position',fig_size),...

text(1.13,1.2,'x(t)'),text(0.1,1.6,'x_1(t)')

%

% Computing the first few frequencies in the sampled signals.

n = [-1 0 1]; wx = [-w2 -w1 w1 w2];

wx1 = []; wx2 = []; wx3 = [];

for i = 1:length(n)

wx1 = [wx1 (wx + n(i)*ws1)];

wx2 = [wx2 (wx + n(i)*ws2)];

wx3 = [wx3 (wx + n(i)*ws3)];

end

wx1 = sort(wx1); wx2 = sort(wx2); wx3 = sort(wx3);

clear i