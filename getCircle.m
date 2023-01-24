function [melonCenter, melonRadius] = getCircle(s, approxLength)
% Get center and radius of the watermelon
%
% INPUT:
%   s: input image
%   approxLength: minimum length in line extraction
%
% OUTPUT:
%   melonCenter: coordinate of watermelon's center
%   melonRadius: radius of the watermelon

% extract lines with Hough transform
[H,T,R] = hough(s,'RhoResolution',floor(min(size(s))*0.05),'Theta',-90:5:89);
P  = houghpeaks(H,5,'threshold',ceil(0.1*max(H(:))));
lines = houghlines(s,T,R,P,'FillGap',5,'MinLength',approxLength);

max_len = 0; % length of the longest line
xy_long = 0; % the longest line
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];

   % determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

if xy_long == 0 % no line segment found
    melonRadius = "Error";
    melonCenter = "Error";
else
    melonRadius = max_len/2;
    melonCenter = [mean(xy_long(:,1)), mean(xy_long(:,2))];
end
end

