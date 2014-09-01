function [B] = image_seg(PATH) 
%#codegen
% The purpose of this function is to segment the image
% which is segmented into its different characters so it 
% can be processed by the 'final' program

%%%%%%%%%%%%%%%%% For code Generation %%%%%%%%%%%%%%%%%%%%%%
%%% Included this line to define the size of B %%%
%%% Variables in C must be defined in size before used %%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    When segmenting image, get a bug with all black %%%%
%%%%    pixels. Need to make final - mean(mean) to iggy %%%%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = imread(PATH);
% Convert the image to black and white
A = im2bw(A);
% Get the negative of the image
A = imcomplement(A);

i = 1;
x_end = 1;
V = mean(A);
A_T = A';
V_T = mean(A_T);

while x_end < length(V)

%Find the starting x point of segment 1
x_start = x_end;

while( V(x_start) == 0 && x_start < length(V))
    x_start = x_start + 1;
end

% Find the ending x point of segment 2

x_end = x_start;

while(V(x_end) > 0 && x_end < length(V))
    x_end = x_end + 1;
end

%Find the starting y point of segment 1
y_start = 1;

while( V_T(y_start) == 0 && y_start <= length(V_T))
    y_start = y_start + 1;
end

% Find the ending y point of segment 2

y_end = y_start;

while(V_T(y_end) > 0 && y_end <= length(V_T))
    y_end = y_end + 1;
end

diff = abs(x_start - x_end);

if diff > 3
    image_after = A(y_start:y_end,x_start:x_end);
    image_after = imresize(image_after, [42 24]);
    figure(i*24);
    imshow(image_after);
    B(i) = final(image_after);
    i=i+1;
end

dlmwrite('C:\Users\Sanjay\Documents\Visual Studio 2010\ayaz\ayaz\test2.txt',B);

end
