image= 'images/image2.jpg';
image=im2double(imread(image));

[Gx, Gy, im_magnitude,im_direction] = compute_gradient(image);

box = [Gx,Gy,im_magnitude,im_direction];
montage(box);


