function [X,f] = ComputeSpectrum(x,fs,N)
% Creates X magnitude frequency spectrum
% on input signal based on parameters
X=abs(fft(x,N));
f=(fs/N)*[0:N-1]; %make the axis freq
X=X(1:end/2);
f=f(1:end/2); 

end

