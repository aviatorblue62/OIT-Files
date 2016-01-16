%% EE 450: Lab 9
clear all; close all; clc;
format short

path = input('Enter Path to Image: ');
kernel = input('Enter Kernel');

x = imread(path);
x = double(x);

%% Speckel_STATS
[rows,cols] = size(x);
numbins = fix(0.001*rows*cols);
figure('Color',[1 1 1]);imagesc(sqrt(x));colorbar;colormap gray;axis square
title('Speckle realization');
[count,center] = hist(x(:),numbins);
delta = center(2)-center(1);
pdf = count/(sum(count)*delta);
K = std(x(:))/mean(x(:));
figure('Color',[1 1 1]);semilogy(center,pdf,'r.');
title('Probability density functions')
xlabel('Intensity, I');ylabel('PDF, p_I(i)')
title(['speckle contrast, K = ' num2str(K)]);
psd = fftshift(fft2(x));
psd = psd.*conj(psd);
figure('Color',[1 1 1]);imagesc(log(psd));
title('Speckle Power Spectral Density');axis square

% Plot X and Y axis vs contrast

figure('Color',[1 1 1]);
plot(psd(960/2,:));
title('Speckle Power Spectral Density Y axis');axis square

figure('Color',[1 1 1]);
plot(psd(:,1280/2));
title('Speckle Power Spectral Density X axis');axis square

%% LOCAL_CONTSRAST_2D



C = local_contrast_2D(x,kernel);
