function [ value ] = isPlus( I_image )
%#codegen
%isPlus To check whether the operator is a plus sign or not
%Takes an input image that is black and white, a negative
% and size 42x24

value = 12345;

top_left_filled = 0; top_right_filled = 0; bottom_left_filled=0; bottom_right_filled=0;

% The points picked for the sweep where chosen based on test values and 
% are subject to change
count_top_left = minesweeper(I_image,6,6);
count_top_right = minesweeper(I_image,10,18);
count_bottom_left = minesweeper(I_image,38,6);
count_bottom_right = minesweeper(I_image,38,18);

if count_top_left > 4 
    top_left_filled = 1;
end

if count_top_right > 4 
    top_right_filled = 1;
end

if count_bottom_left > 4 
    bottom_left_filled = 1;
end

if count_bottom_right > 4 
    bottom_right_filled = 1;
end

if top_left_filled == 0 && top_right_filled == 0 && bottom_left_filled == 0 && bottom_right_filled == 0
    value = 1234; return;
end

end

