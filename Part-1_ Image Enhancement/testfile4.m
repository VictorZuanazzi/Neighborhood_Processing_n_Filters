 

image = 'images/image2.jpg';
I=im2double(imread(image));
[Gx,Gy, im_magnitude, im_direction] = compute_gradient(image);

% [Gmag,Gdir] = imgradient(I)
% 
% box = [Gdir,imbinarize(rescale(Gdir)),im_direction,imbinarize(rescale(im_direction))];
% montage(box);






