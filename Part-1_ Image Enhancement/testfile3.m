%function [Gx, Gy, im_magnitude,im_direction] = compute_gradient(image)

image= 'images/image2.jpg';
image=im2double(imread(image));

Sobel_x = [ 1, 0, -1 ; 2, 0, -2 ; 1, 0, -1 ];
Sobel_y = Sobel_x';

Gx=imfilter( image,Sobel_x); 
Gy=imfilter( image,Sobel_y);

im_magnitude = sqrt((Gx.^2+Gy.^2));

% what to do with division by 0 NaN's? 
im_direction = atan(Gy./Gx);

%replace values where G_x = 0 with 90 degrees; don't know if really
%necessary

figure(1);
imshow(im_direction);

%im_direction(isnan(im_direction))=pi/2; 

figure(2);
imshow(im_direction);


out_image = [rescale(Gx),rescale(Gy),rescale(im_magnitude),rescale(im_direction)];
%visualize(out_image);

% visualize(x,Gy,im_magnitude,im_direction);
visualize(rescale(Gx),rescale(Gy),rescale(im_magnitude),rescale(im_direction));

imwrite(out_image,'images/gradients.png');

%end

