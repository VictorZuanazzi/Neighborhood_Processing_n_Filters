im1='images/image1_saltpepper.jpg';
im2='images/image1.jpg';


orig_image = imread(im1);

approx_image = imread(im2);


filtered_image = imboxfilt(approx_image,3);
filtered_image2 = imboxfilt(approx_image,5);
filtered_image3 = imboxfilt(approx_image,7);

filtered_image4 = medfilt2(approx_image,[3 3]);
filtered_image5 = medfilt2(approx_image,[5 5]);
filtered_image6 = medfilt2(approx_image,[7 7]);

% imshowpair(approx_image,filtered_image2,'montage');
% imshowpair(approx_image,filtered_image3,'montage');


box_filter = [approx_image,filtered_image,filtered_image2,filtered_image3];
montage(box_filter,'size',[1 NaN]);




h=[-1 0 1];

filtered_image3=imfilter(approx_image,h);


%imshowpair(approx_image,filtered_image3,'montage');




