
%print on image requires `computer vision system toolbox`, 
%turn it to false if you don't want to install the trial version.
PRINT_ON_IMAGE = true;

label = ["original", "gaussian_noise", "salt_n_peper"];
images = ["./images/image1.jpg", "./images/image1_gaussian.jpg", "./images/image1_saltpepper.jpg"];
true_im = imread(images(1));

for k = 1: length(label)
    
    image = imread(images(k));
    [w, h, ~] = size(image);           
            
    % calculate psnr 
    im_psnr = myPSNR(true_im, image)
    matlab_psnr = psnr(image, true_im)

    if (PRINT_ON_IMAGE)
        % write the psnr and box size on the image
        text = char(label(k) + ": psnr = " +  num2str(im_psnr, 5));
        position = [w/2, 1];
        im_text = insertText(image, position, text);

        %insertText modifies the size of the image, but not in a noticible
        %way.
        %clips the image to the original size.
        image = im_text(1:w, 1:h);
    end
    filtered_im{k} = image;
    
end

%saves images concatenated
path = "./images/myPSNR.png";
visualize_n_save(path, filtered_im{1}, filtered_im{2}, filtered_im{3})


        
    


