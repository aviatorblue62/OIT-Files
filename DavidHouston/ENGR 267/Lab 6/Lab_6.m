%% *Lab 6*

%% Task #1

% Create a 9x9x9 Multiplication table using for loops
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

XX = zeros(1,257);
REF = zeros(1,65);
IMF = zeros(1,65);

% Mythical Program which loads data into REF and IMF

for f = 1:5
    REF(f) = 3*f^2;
    IMF(f) = 2*f;
end

N = length(XX);
K = length(REF);
H = length(IMF);

for k = 1:K
    REF(k) = REF(k)/(N/2);
    IMF(k) = IMF(k)/(N/2);
end

REF(1) = REF(1)/2;
REF(K) = REF(K)/2;


for h = 1:N
    XX(h) = 0;
end
for k = 1:K
    for h = 1:N
        XX(h) = XX(h) + REF(k)*cos(2*pi*k*h/N);
        XX(h) = XX(h) + IMF(k)*sin(2*pi*k*h/N);
    end
end


plot(XX)



