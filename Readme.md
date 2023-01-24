# Watermelon Detection

This project introduces a new method for detecting watermelon in farmland. This method is based on traditional image processing method and proposed a new approach to the problem. The algorithm is having a high accuracy and a low complexity, which greatly benefits the autonomous harvesting process in the farmland.

This project is written in matlab.

Main functions:  
main.m : main function to detect watermelon  
get_hue_mask.mlx : get watermalen mask based on hue  
img_label.mlx : manually label image, save as TIFF, used as ground truth  
  
Utility functions:  
draw_circle_mask.m : Detect watermelon location and draw a corresponding mask  
edgeDetect.m: Get the weighted center and radius of the watermelon  
get_input.m: Get user input while labelling the watermelon  
getCircle.m: Get center and radius of the watermelon  
getWeight.m: Calculate the weights for the center and radius in each iteration  
hue_mask.m: Get the hue mask of the image  
lasso_select.m: Generate mask for the labelling process  
mask2poly.m: Finds a polygon enclosing the user defind mask of logicals  
