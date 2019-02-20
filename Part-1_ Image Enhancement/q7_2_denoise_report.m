
kernel_type = ["box", "median", "gaussian"];
box_size = [3, 5, 7];
label = ["original", "gaussian noise", "salt & peper"];
images = ["./images/image1.jpg", "./images/image1_gaussian.jpg", "./images/image1_saltpepper.jpg"];
count = 1;
for k = 1: length(label)
    for i = 1: length(kernel_type)
        for j = 1: length(box_size)
            image = imread(images(k));
            filtered_im{j} = denoise(image, kernel_type(i), box_size(j));
        end
        path = "./images/" + label(k) + "_" + kernel_type(i) + ".png";
        visualize_n_save(path, filtered_im)
    end
end

        
    


