function xdot = ckt(t,x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
vg = 1;

C1 = 100e-9;
C2 = C1;
R = 30;
L = 184e-6;

xdot(1) = x(2)/C1;
xdot(2) = -(x(1) + x(3))/L + vg/L;
xdot(3) = x(2)/C2 - x(3)/(R*C2);
xdot = [xdot(1); xdot(2); xdot(3)];

end

