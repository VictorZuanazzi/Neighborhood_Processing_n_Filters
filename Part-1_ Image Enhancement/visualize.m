function visualize(img1,img2,img3,img4)

box_filter = [img1,img2,img3,img4];
montage(box_filter,'size',[1 NaN]);

end