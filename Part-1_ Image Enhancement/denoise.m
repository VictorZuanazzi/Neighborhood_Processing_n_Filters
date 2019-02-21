function [ imOut ] = denoise( image, kernel_type, varargin)
% function used to denoise image using a box, median or gaussian filter.
% imputs:
%   image (matrix) 
%   kernel_type (string): 'box', 'median' or 'gaussian'
%   varargin: int if 'box', [m, n] if 'median' 


switch kernel_type
    case 'box'
        if isempty(varargin)
            box_size = 3;
        else
            box_size = make_it_odd(varargin{1});
        end
        imOut = imboxfilt(image, box_size);
        
    case 'median'
        if isempty(varargin)
            matrix = [3, 3];
        elseif length(varargin{1}) == 2
           matrix = make_it_odd(varargin{1});   
        elseif length(varargin{1}) == 1
           odd_number = make_it_odd(varargin{1});
           matrix = [odd_number, odd_number];
        else
            matrix = [3, 3];      
        end
        
        imOut = medfilt2(image, matrix);

    case 'gaussian'
        if isempty(varargin)
            sigma = 1;
            kernel_size = 3;
        else
            sigma = varargin{1};
            kernel_size = make_it_odd(varargin{2});
        
        imOut = imfilter(image, gauss2D(sigma, kernel_size), 'conv');
        
    case 'meme'
        [w, h, ~] = size(image);
        I = imread('./images/gauss_meme.jpg');
        imOut = I(1:w, 1:h);
    
    otherwise
        %box filter of size 3 is used if the kernel_type is not recognized.
        imOut = denoise(image, 'box', 3);
        
end
end
