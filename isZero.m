function [ value ] = isZero(x_center, y_center, I_image)
%#codegen
%isZero Determines whether the segmented image is zero
%   The input image is 42x24, black and white, and
%   a negative 

count = minesweeper(I_image,x_center,y_center);
value = 9999;

% Image is zero if center pixel and surrounding 8 cells are black (equal 0)
if(count <= 2)
    value = '+';
end
