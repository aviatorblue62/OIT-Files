function [] = speckle_stats(x);
% speckle_stats(x)
% calculate first and second order statistics of specified speckle pattern
% x = speckle pattern to be analyzed
% 09/22/07
%
[rows,cols] = size(x);
numbins = fix(0.001*rows*cols);
figure(1);imagesc(sqrt(x));colorbar;colormap gray;axis square
title('Speckle realization');
[count,center] = hist(x(:),numbins);
delta = center(2)-center(1);
pdf = count/(sum(count)*delta);
K = std(x(:))/mean(x(:));
figure(2);semilogy(center,pdf,'r.');
title('Probability density functions')
xlabel('Intensity, I');ylabel('PDF, p_I(i)')
title(['speckle contrast, K = ' num2str(K)]);
psd = fftshift(fft2(x));
psd = psd.*conj(psd);
figure(3);imagesc(log(psd));
title('Speckle Power Spectral Density');axis square

