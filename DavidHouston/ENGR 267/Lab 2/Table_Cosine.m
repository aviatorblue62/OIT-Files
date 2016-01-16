% Task #3 & #4
clc
n = 1:256;
cos_val(n) = cos(2*pi*n/256);

%Task #4

wave2 = cos_val(mod(2*n,256)+1);

wave3 = cos_val(mod(4*n,256)+1);

wave4 = cos_val(mod(6*n,256)+1);

subplot(221)
plot(cos_val)
title('Fundemental')
xlabel('0 \leq t \leq 256  (ms)')
ylabel('Harmonic 1')
axis([0 256 -1 1])

subplot(222)
plot(wave2)
xlabel('0 \leq t \leq 256  (ms)')
ylabel('Harmonic 1')
title('First Harmonic')
axis([0 256 -1 1])

subplot(223)
plot(wave3)
xlabel('0 \leq t \leq 256  (ms)')
ylabel('Harmonic 2')
title('Second Harmonic')
axis([0 256 -1 1])

subplot(224)
plot(wave4)
xlabel('0 \leq t \leq 256  (ms)')
ylabel('Harmonic 3')
title('Third Harmonic')
axis([0 256 -1 1])

%Tasks #6,#7,#8

synth_1(n) = 10*cos_val(mod(n,256)+1);
synth_2(n) = 0.5*synth_1(mod((2*n+64),256)+1);
synth_3(n) = 0.25*synth_1(mod((3*n+128),256)+1);

subplot(311)
plot(n,synth_1)
xlabel('0 \leq t \leq 256  (ms)')
ylabel('Synthetic 1')
title('1st Wave')
axis([0 256 -10 10])

subplot(312)
plot(n,synth_2)
xlabel('0 \leq t \leq 256  (ms)')
ylabel('Synthetic 2')
title('2nd Wave')
axis([0 256 -10 10])

subplot(313)
plot(n,synth_3)
xlabel('0 \leq t \leq 256  (ms)')
ylabel('Synthetic 3')
title('3rd Wave')
axis([0 256 -10 10])



%Task #9

sin_val(n) = sin(2*pi*n/256);

square_1(n) = sin_val(mod(n,257));
square_3(n) = .3*square_1(mod(3*n,257));
square_5(n) = 0.15*square_1(mod(5*n,257));
square_7(n) = 0.075*square_1(mod(7*n,257));
square_9(n) = .0375*square_1(mod(9*n,257));
square_11(n) = 0.01875*square_1(mod(11*n,257));

subplot(211)
plot(n,square_1,n,square_3,n,square_5,n,square_7,n,square_9,n,square_11)
xlabel('t (ms)')
ylabel('Amplitude')
title ('Seperate Harmonics')

subplot(212)
harmonic = square_1 + square_3 + square_5 + square_7 + square_9 + square_11;
plot(n,harmonic)
xlabel('t (ms)')
ylabel('Amplitude')
title ('Harmonic Square Wave')


