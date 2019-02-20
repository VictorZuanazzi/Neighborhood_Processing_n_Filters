image='images/image2.jpg';

[Gx, Gy, im_magnitude,im_direction] = compute_gradient(image);

visualize(Gx,Gy,im_magnitude,im_direction)

min(min(Gx))

min(min(Gy))

max(max(im_magnitude))

%im_direction

