function [value] = two_seven(I_image)
%#codegen
% two_seven determines whether the input image (b&w/negative/42x24 type) 
% is two or seven or / or +, 2,7,/,+,*,=,-

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate midpoint based on predefined
x_center = 12;
y_center = 21;

top_left_filled = 0; top_right_filled = 0; bottom_left_filled = 0; bottom_right_filled = 0; center_filled = 0;

%Scan the 9 cell vacancy around bottom left corner (if 7 it should be all
%white, else it should be black)

count_top_left = minesweeper(I_image,6,6);
count_top_right = minesweeper(I_image,10,18);
count_bottom_left = minesweeper(I_image,38,6);
count_bottom_right = minesweeper(I_image,38,18);
count_center = minesweeper(I_image, y_center, x_center);

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

if count_center > 4
    center_filled = 1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%  Check if = or -

count = 1;

I_imageT = mean(I_image');
for i=1:41
    if abs(I_imageT(i)-I_imageT(i+1)) > .07
        count = count + 1;
    end
end
    
if count == 3 
    value = '-'; return %sub
end

if count == 5 && center_filled == 0
    value = '='; return
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if top_left_filled == 1 && top_right_filled == 1 && bottom_left_filled == 1 && bottom_right_filled == 1
    value = '2'; return;
end 

%% That must mean that either the tl, tr, bl or br has no filling

if top_left_filled == 1 && top_right_filled == 1 && bottom_left_filled == 1 && bottom_right_filled == 0
    value = '7'; return;
end

if top_left_filled == 0 && top_right_filled == 1 && bottom_left_filled == 1 && bottom_right_filled == 0
    value = '/'; return; %div
end

if top_left_filled == 0 && top_right_filled == 0 && bottom_left_filled == 0 && bottom_right_filled == 0 && center_filled == 1
    value = '+'; return; %plus
else    
    value = '*'; % mult
end
