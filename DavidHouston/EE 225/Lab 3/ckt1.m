function xdot = ckt1( t,x )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
vg = 1;

C1 = 100e-9;
C2 = 200e-9;
R1 = 20;
R2 = 5;
L = 300e-6;

xdot(1) = ( (x(3)-x(2))/L ) - ( x(1)*R1/L );
xdot(2) = x(1)/C1;
xdot(3) = (-x(1)/C2) + ((vg-x(3))/(R2*C2));
xdot = [xdot(1); xdot(2); xdot(3)];

end

