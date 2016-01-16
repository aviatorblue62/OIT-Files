%% *Lab 6*

%% Task #1

% Create a 9x9 Multiplication table using for loops
clear all
format SHORT

for n = 1:9
    for k = 1:9
        for u = 1:9
        table(n,k,u) = n*k*u;
        end
    end
end

table

%% Task #2
clear all
format short

XX = zeros(1,512);
REF = zeros(1,257);
IMF = zeros(1,257);

n = input('Number of Frequencies');
for k = 1:n
    XX(k) = input('Input Frequencies: ');
end

% Mythical Program which loads data into REF and IMF

    REF(5) = 10;
    IMF(5) = 15;

N = length(XX);

for k = 1:257
    REF(k) = REF(k)/(N/2);
    IMF(k) = IMF(k)/(N/2);
end

REF(1) = REF(1)/2;
REF(257) = REF(257)/2;


for h = 1:512
    XX(h) = 0;
end
for k = 1:257
    for h = 1:512
        XX(h) = XX(h) + REF(k)*cos(2*pi*k*h/N);
        XX(h) = XX(h) + IMF(k)*sin(2*pi*k*h/N);
    end
end






