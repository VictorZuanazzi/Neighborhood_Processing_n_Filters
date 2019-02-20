function [ PSNR ] = myPSNR( orig_image, approx_image )

%image size
[w, h] = size(orig_image);

%datatype from uint8 to double
I = double(orig_image);
Ihat = double(approx_image);

%calculate Mean Squared Error
MSE = sum((I - Ihat).^2, "all")/(w*h);

%gets max pixel value
Imax = double(max(orig_image, [], 'all'));

%return PSNR
PSNR = 10*log10(Imax^2/MSE);
end

