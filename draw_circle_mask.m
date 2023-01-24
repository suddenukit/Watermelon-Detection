function draw_circle_mask(img_name)
% Detect watermelon location and draw a corresponding mask
%
% INPUT:
%   img_name: input image name

    image = imread("watermelon-imgs/"+img_name);
    % detect the location of watermelon
    [center, radius] = edgeDetect(img_name);
    % get and save the detected mask
    xc = center(:,1);
    yc = center(:,2);
    bw_I = rgb2gray(image);
    [xDim, yDim] = size(bw_I);
    [xx,yy] = meshgrid(1:yDim,1:xDim);
    mask = false(xDim,yDim);
    for ii = 1:numel(radius)
        mask = mask | hypot(xx - xc(ii), yy - yc(ii)) <= radius(ii);
    end
    imwrite(mask, strcat("tiff_files/", img_name, '_detected_mask.tiff'));
end
