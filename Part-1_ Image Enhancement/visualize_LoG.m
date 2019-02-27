
img1=compute_LoG('images/image2.jpg',1);
img2=compute_LoG('images/image2.jpg',2);
img3=compute_LoG('images/image2.jpg',3);


box1 = [img1,img2,img3];
box2 = [imbinarize(img1),imbinarize(img2),imbinarize(img3)];

figure(1)
montage(box1,'size',[1 NaN]);
figure(2)
montage(box2,'size',[1 NaN]);

imwrite(box1,'images/laplacian.png')

imwrite(box2,'images/laplacian_binarized.png')

