%% *State Variables*

%% Part I
clear all
format SHORTE

t0=0; tf=60e-6;
tspan = [t0,tf];
x0 = [-1 0 0];
[t,x] = ode45('ckt',tspan,x0);
plot(t,x)
xlabel('0 \leq t \leq 6')
ylabel('x')
title('State Vector')
axis([0 6e-5 -2 2])

%% Part II

clear all
format SHORTE
t0=0; tf=1e-4;
tspan = [t0,tf];
x0 = [0; -1; -1];
[t,x] = ode45('ckt1',tspan,x0);
i3 = -(x(:,3)-1)/(5);
plot(t,x(:,1))
hold on 
plot(t,i3,'r-')
xlabel('0 \leq t \leq 6')
ylabel('x')
title('State Vector')
axis([0 1e-4 -.04 .04])

%% Part III

format SHORTE
hold off
clear all
s = tf('s');

R1 = 20;
R2 = 5;
L = 300e-6;
C1 = 100e-9;
C2 = 200e-9;

A = [-R1/L -1/L 1/L; 1/C1 0 0; -1/C2 0 -1/(C2*R2)];
B = [0; 0; 1/(C2*R2)];
C = [0 0 1];
D = -1;

%Z_s = 1/s

I = eye(3);

X_s = (inv(s*I - A))*B
Y_s = (C*X_s + D)
i3 = (-Y_s)/(R2);

step(2*i3)
step(2*X_s(1))
axis([0 .0001 -.02 .03])








