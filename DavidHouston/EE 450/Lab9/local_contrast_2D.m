function [C] = local_contrast_2D(x,kernel)
%
% C = local_contrast_2D(x,kernel)
% Calculate local (2D) spatial contrast and determine first order
% statistics.
% x = speckle pattern for which contrast is to be calculated
% kernel = local region over which contrast is to be calculated
% For example, kernel = ones(7,5)
% Note that this is a standard convolutional kernel and that all operations
% associated with calculation of the contrast use regular Matlab functions.
% C = resulting contrast image
% Note that the dimensions of C are not the same as for the speckle
% pattern, x as only valid pixels resulting from the convolution are
% returned.
% 09/22/07
%
Nk = sum(kernel(:));
[rows,cols] = size(x);
K = std(x(:))./mean(x(:));
figure(1);imagesc(sqrt(x));colorbar;colormap gray;axis image
title(['Speckle realization; contrast, K = ' num2str(K)])
numbins = fix(0.001*rows*cols);
[num,bincen] = hist(x(:),numbins);
delta = bincen(2)-bincen(1);
factor = 1/(delta*sum(num));
pdf_g = num*factor;
figure(2);semilogy(bincen,pdf_g,'r.');
title('PDF of speckle realization');xlabel('Gray level, g');
ylabel('PDF, f_G(g)')
% calculate local speckle contrast
mu_x = filter2(kernel,x,'valid')/Nk;
x_sq = filter2(kernel,x.*x,'valid');
var_x = (x_sq - Nk*mu_x.*mu_x)/(Nk-1);
sig_x = sqrt(var_x);
C = sig_x./mu_x;
figure(3);imagesc(C);colorbar;axis image
title('Local speckle contrast')
[num,bincen] = hist(C(:),numbins);
delta = bincen(2)-bincen(1);
factor = 1/(delta*sum(num));
pdf_c = num*factor;
figure(4);plot(bincen,pdf_c,'r.');
title('PDF of local speckle contrast');
xlabel('Local contrast, C');ylabel('PDF, f_C(c)');
 