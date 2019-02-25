function img_save(path, varargin)
% concatenates the images horizontally and saves them in the specified path

image = varargin{1};
for i = 2:length(varargin)
    image = [image, varargin{i}];
end

imwrite(image, path)

end