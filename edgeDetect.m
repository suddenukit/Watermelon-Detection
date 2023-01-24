function [center, radius] = edgeDetect(img_name)
% Get the weighted center and radius of the watermelon
%
% INPUT:
%   img_name: input image name
%
% OUTPUT:
%   center: weighted coordinate of watermelon's center
%   radius: weighted radius of the watermelon

    image = imread("watermelon-imgs/"+img_name);
    I = image;
    % get the hue mask to seperate soil, sky and plants
    h_mask_1 = hue_mask(I, 0.15, 0.6);

    % constrast enhancement
    G = rgb2gray(image);
    G0 = imadjust(G);
    G0 = histeq(G0);
    BW = imbinarize(G0,'adaptive','ForegroundPolarity','dark','Sensitivity',0.5);

    % variable initialization
    blurred = BW;
    se = strel('disk',floor(min(size(blurred)) * 0.02));
    param1 = 5;
    weightsArray = getWeight(param1);

    center = zeros(1,2);
    radius = 0;
    radius_adjust = 1;
    
    figure; hold on;
    for i = 1:param1
        % blur image with erosion and dilation
        H = fspecial('disk',ceil(min(size(blurred)) * 0.02));
        blurred = imfilter(blurred,H,'replicate');
        blurred = imopen(blurred,se);
        approxLength = ceil(min(size(blurred)) * 0.2); % minimum edge length
        
        % skeletonize the image
        s = bwskel(~blurred,'MinBranchLength',approxLength);
        s = s.* (h_mask_1) + zeros(size(s)).*(~h_mask_1);
        
        % get center and radius of the watermelon
        [currentMelonCenter, currentMelonRadius] = getCircle(s,approxLength);
        
        % adjust weight factor if no edge is detected
        if isstring(currentMelonCenter)
            idx_end = i;
            radius_adjust = sum(weightsArray(1:idx_end ));
            break;
        end
        % calculate weighted center and radius
        center = center + weightsArray(i) * currentMelonCenter;
        radius = radius + weightsArray(i) * currentMelonRadius;
    end
    radius_factor = 1.3; % hyperparameter to extend the radius for fitting purpose
    radius = radius * radius_factor / radius_adjust;
    center = center / radius_adjust;
    imshow(image);
    title(img_name);
    viscircles(center, radius,'Color','red');
    pause(1)
end

