
%print on image requires `computer vision system toolbox`, 
%turn it to false if you don't want to install the trial version.
PRINT_ON_IMAGE = true;

kernel_type = ["box", "median", "gaussian"];
box_size = [3, 5, 7, 9];
label = ["original", "gaussian_noise", "salt_n_peper"];
images = ["./images/image1.jpg", "./images/image1_gaussian.jpg", "./images/image1_saltpepper.jpg"];
std = [0.8, 1, 1.2];

true_im = imread(images(1));

for k = 1: length(label)
    
    image = imread(images(k));
    [w, h, ~] = size(image);
    for i = 1: length(std)             
        for j = 1:length(box_size)
            
            %denoises the image using the specified filter and box size
            filtered_im{j} = denoise(image, 'gaussian', std(i), box_size(j));
            
            % calculate psnr 
            im_psnr = myPSNR(true_im, filtered_im{j});
            
            if (PRINT_ON_IMAGE)
                % write the psnr and box size on the image
                text = char(num2str(box_size(j)) + "x" + num2str(box_size(j)) + "std =" + num2str(std(i)) + ": psnr = " +  num2str(im_psnr, 5));
                position = [w/2, 1];
                im_text = insertText(filtered_im{j}, position, text);

                %insertText modifies the size of the image,
                %clips the image to the original size.
                filtered_im{j} = im_text(1:w, 1:h);
            end
            
        end
        
        %saves images concatenated
        path = "./images/" + label(k) + "_gaussian_" + num2str(std(i)) + "_filter.png";
        figure()
        visualize_n_save(path, image, filtered_im{1}, filtered_im{2}, filtered_im{3}, filtered_im{4})
    end
end

        
    


