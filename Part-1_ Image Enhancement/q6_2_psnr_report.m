
im_noisy = ["./images/image1_gaussian.jpg", "./images/image1_saltpepper.jpg"];
im_good = './images/image1.jpg';

good_I = imread(im_good);
l = length(im_noisy);

for i = 1:l

    noisy_I = imread(im_noisy(i));
    im_noisy(i)
    psnr_implemented = myPSNR(good_I, noisy_I) %our function
    psnr_compare = psnr(noisy_I, good_I) %matlab builtin oracle
    
end