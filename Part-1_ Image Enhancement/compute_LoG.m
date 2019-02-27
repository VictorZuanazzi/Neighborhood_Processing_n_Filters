function imOut = compute_LoG(image, LOG_type)

s1 = 0.5;
s2 = s1*1.6; %from literature use factor of 1.6
kernel_size=5;

image=im2double(imread(image));

switch LOG_type
    case 1
        
        laplacian_kernel = fspecial('laplacian');
        gauss_kernel= gauss2D(s1,kernel_size);

        intermediate=imfilter( image,gauss_kernel);
        image_m1= imfilter(intermediate,laplacian_kernel);
        %imOut=image_m1;
        imOut=rescale(image_m1);  %rescales image to [0,1]

    case 2
        
        log_kernel =  fspecial('log',kernel_size,s1);
        image_m2= imfilter(image,log_kernel);
        %imOut=image_m2;
        imOut=rescale(image_m2);

    case 3
        
        %DoG=gauss2D(s1,5)-gauss2D(s2,5);
        DoG=gauss2D(s2,5)-gauss2D(s1,5);
        image_m3= imfilter(image,DoG);
        %imOut=image_m3;
        imOut=rescale(image_m3);

end
end

