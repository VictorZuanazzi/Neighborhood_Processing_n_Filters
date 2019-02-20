function [Gx, Gy, im_magnitude,im_direction] = compute_gradient(image)

image=imread(image);

Sobel_x = [ 1 0 -1 ; 2 0 -2 ; 1 0 -1 ];
Sobel_y = [ 1 2 1 ; 0 0 0 ; -1 -2 -1 ];

% G_x=conv2( image,Sobel_x,'same');
% G_y=conv2( image,Sobel_y,'same');

% convert to double so that ^2 works 
Gx=double(imfilter( image,Sobel_x)); 
Gy=double(imfilter( image,Sobel_y));

% G_x=conv2( Sobel_x,image);
% G_y=conv2( Sobel_y,image);

im_magnitude = sqrt((Gx.^2+Gy.^2));


% what to do with division by 0 NaN's? 
im_direction = atan(Gy./Gx);

%replace values where G_x = 0 with 90 degrees
im_direction(isnan(im_direction))=pi/2; 

end

