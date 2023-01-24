function mask = hue_mask(img, lo, hi)
% Get the hue mask of the image
%
% INPUT:
%   img: input image
%   lo: lowest bound of the hue value
%   hi: lowest bound of the hue value
%
% OUTPUT:
%   mask: the hue mask

    img_hue = rgb2hsv(img);
    mask = (img_hue(:, :, 1) >= lo) .* (img_hue(:, :, 1) <= hi);
end