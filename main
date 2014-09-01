function [Value] = final(image_after)
%#codegen

% Define feature vectors for library
% Current Library images are negatives 
% LIB [ Orientation, Eulers Number];
% Fill can take a value 1, 0, or -1
% Orientation is either 1 or -1 

%Set 1
global LIB8; LIB8 = [1, -1];

%Set 2
global LIB0; LIB0 = [-1, 0];
global LIB6; LIB6 = [-1, 0];
global LIB9; LIB9 = [-1, 0];

%Set 3
global LIB4; LIB4 = [1, 0];

%Set 4
global LIB1; LIB1 = [-1, 1];
global LIB3; LIB3 = [-1, 1];
global LIB5; LIB5 = [-1, 1];

%Set 5
global LIB2; LIB2 = [1, 1];
global LIB7; LIB7 = [1, 1];
global LIB_DIV; LIB_DIV = [1,1];
global LIB_PLUS; LIB_PLUS = [1,1];

%Set 6
% There are two nines because image gets distorted
% when formatted and then its euler number chnages?
% 8 is included??

%%%% EDIT for code Generation %%%%
%%% Comment out the line below (38)
%global LIB_EQUAL; LIB_NINE = [-1, -1];


%Obtain the feature vector of the image and convert it to cell

FeatureVector = cell2mat(struct2cell(regionprops(image_after,'EulerNumber', 'Orientation')));

% Convert angle to positive or negative

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if FeatureVector(1) >= 0
    FeatureVector(1) = 1;
else
    FeatureVector(1) = -1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Check to see if in Set 1
if FeatureVector(1) == 1 && FeatureVector(2) == -1
    Value = '8';
else
% Check to see if in Set 6
    if FeatureVector(1) == -1 && FeatureVector(2) == -1
        Value = eight_nine(image_after);
    else    
% Check to see if in Set 3
        if  FeatureVector(1) == 1 && FeatureVector(2) == 0
            Value = '4';
        else
% Check to see if in Set 2
            if FeatureVector(1) == -1 && FeatureVector(2) == 0
                Value = zero_six_nine(image_after);
            else
% Check to see if in Set 4
                if FeatureVector(1) == -1 && FeatureVector(2) == 1 
                    Value = one_three_five(image_after);
                else
% Check to see if in Set 5
                    if FeatureVector(1) == 1 && FeatureVector(2) == 1
                        Value = two_seven(image_after); 
                    end
                end
            end
        end
    end
end
