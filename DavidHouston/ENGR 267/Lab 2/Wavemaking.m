% David Houston
% Lab #2
% Paul Dingman
% ENGR 267
% 04/15/2014

clear
format short

% Task #1

t = linspace(0,2*pi,120);

f40 = cos(3*t);
f30 = cos(4*t);
f20 = cos(6*t);

fadd = f40 + f30 + f20;

fdecay = (fadd).*exp(-20*log(2)*t/20);

plot(t,f40,'.')
xlabel ('t')
ylabel ('f_4_0(t)')
title ('Cosine w/ 40 samples per cycle')

plot(t,f30,'.')
xlabel ('t')
ylabel ('f_3_0(t)')
title ('Cosine w/ 30 samples per cycle')

plot(t,f20,'.')
xlabel ('t')
ylabel ('f_2_0(t)')
title ('Cosine w/ 20 samples per cycle')

plot(t,fadd,'g-')
xlabel ('0 \leq t \leq 2*pi')
ylabel ('Magnitude')
title ('Cosine waves of various frequencies added together')
axis([0 2*pi -3 3])

plot(t,fdecay,'b-')
xlabel ('0 \leq t \leq 2*pi')
ylabel ('Magnitude')
title ('Decaying wave')
axis([0 2*pi -3 3])







