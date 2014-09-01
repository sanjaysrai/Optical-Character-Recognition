function [ count ] = minesweeper(image_before, location_x, location_y )
%minesweeper This function returns how many squares 
% in a given location have pixels in them (FOR NEG IMAGE)
% e.g. 9 means that the location is all white space
% while 0 means that the location is all black

% Initializing variables
count = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exception handling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% If passed invalid arguments, returns 9999 as count

size_image = size(image_before);

if(location_x-1 <= 1)
    count = 9999; return;
end

if (location_x+1 >= size_image(1))
    count = 9999; return;
end

if(location_y-1 <= 1)
    count = 9999; return;
end

if (location_y+1 >= size_image(2))
    count = 9999; return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if image_before(location_x-1, location_y-1) == 1
    count = count+1;
end

if image_before(location_x-1, location_y) == 1
    count = count+1;
end

if image_before(location_x-1, location_y+1) == 1
    count = count+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if image_before(location_x, location_y-1) == 1
    count = count+1;
end
if image_before(location_x, location_y) == 1
    count = count+1;
end
if image_before(location_x, location_y+1) == 1
    count = count+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if image_before(location_x+1, location_y-1) == 1
    count = count+1;
end
if image_before(location_x+1, location_y) == 1
    count = count+1;
end
if image_before(location_x+1, location_y+1) == 1
    count = count+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
