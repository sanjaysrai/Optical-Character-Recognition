function [value] = eight_nine(I_image)
%#codegen

% zero_six_nine Determines whether the input segment 
% is zero, six, or nine

%%% Try to find a more robust (pixel independent) way of 


% User defined constants
x_center = 21;
y_center = 12; 
x_bottom = 42;
x_three_fourth_down = floor((x_bottom+x_center)/2);

% minesweeper returns how many squares 
% in a given location have pixels in them 
% e.g. 9 means that the location is all white space
% while 0 means that the location is all black

%Fills any holes in the image
I_image = cell2mat(struct2cell(regionprops(I_image, 'FilledImage')));

if(minesweeper(I_image,x_three_fourth_down,y_center) >= 7)
    value = '8'; return;
end

value = '9'; return;
