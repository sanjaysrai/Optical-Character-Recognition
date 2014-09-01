function [value] = one_three_five(I_image)
%#codegen
% one_three_five Determines whether the input image (b&w/negative/42x24 type) 
% is one, three, or five

% Declare variables
fudge_factor = 5;
a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; j = 0;
sum = 0;

% edge is a vector with [c_left x_right y_top y_bottom]

% Extracting values from edge
c_left = 1;
c_right = 24;

r_top = 1;
r_bottom = 42;

% Calculate midpoint

% Code generation edit %
% Comment out the line below, (not used)
% c_center = 12;

r_center = 21;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Throw exception for + operator
if(isPlus(I_image) == 1234)
    value = '+'; return;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Check if one:
for i=r_top:r_bottom
    sum = sum + I_image(i, c_right-fudge_factor);
end

mean = sum/i;
if  mean > .90 % check this
    value = '1';
    return;
end

% If not one then it must be 3 or 5
% Scan the 9 cell vacancy around gap in 3
r_temp = r_center;
c_left = c_left + 3;

if (r_temp-1 < 42 && c_left+1 > 0 && I_image(r_temp-1,c_left+1) ~= 0)
    a = 1;
end
if (r_temp < 42 && c_left+1 > 0 && I_image(r_temp,c_left+1) ~= 0)
    b = 1;
end
if (r_temp+1 < 42 && c_left+1 > 0 && I_image(r_temp+1,c_left+1) ~= 0)
    c = 1;
end
if (r_temp-1 < 42 && c_left > 0 && I_image(r_temp-1,c_left) ~= 0)
    d = 1;
end;
if (r_temp < 42 && c_left > 0 && I_image(r_temp,c_left) ~= 0)
    e = 1;
end;
if (r_temp+1 < 42 && c_left > 0 && I_image(r_temp+1,c_left) ~= 0)
    f = 1;
end;
if (r_temp-1 < 42 && c_left-1 > 0 && I_image(r_temp-1,c_left-1) ~= 0)
    g = 1;
end;
if (r_temp < 42 && c_left-1 > 0 && I_image(r_temp,c_left-1) ~= 0)
    h = 1;
end;
if (r_temp+1 < 42 && c_left-1 > 0 && I_image(r_temp+1,c_left-1) ~= 0)
    j = 1;
end;

if( a == 0 && b == 0 && c == 0 && d == 0 && e == 0 && f == 0 && g == 0 && h == 0 && j == 0)
    value = '3'; return;
else
    value = '5'; return;
end

end
