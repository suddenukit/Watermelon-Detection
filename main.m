clear;close all;
% detect watermelon in each image and draw the detected circle mask
for i = 1:31
    draw_circle_mask("melon" + i + ".jpeg"); 
end