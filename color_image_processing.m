 












%{
% pseudo color img processing   Grey to RGB

A=imread('flower.jpeg');
[R,C]= size(A);

B=zeros(R,C,3);

for i=1:1:R
    for j=1:1:C
        
        if A(i,j) < 100
            
            B(i,j,3)=1;  % blue color
            
        end
        
        if A(i,j) >= 100 && A(i,j) < 200
            
            B(i,j,2)=1;
            
        end
        
         if A(i,j) >= 200 && A(i,j) < 256
            
           % B(i,j,1)=1;
            
            % if i want yellow color 
            
            B(i,j, 1:2)=1;
            
         end
        
         
    end
end

imshow(B);
 figure , imshow(A);       
        

%                      









I = imread('rgb2.jpg');

size(I);

class(I);

subplot(2,2,1), imshow(I), title('Color image (RGB)');

subplot(2,2,2), imshow(I(:,:,1)), title('Red component');

subplot(2,2,3), imshow(I(:,:,2)), title('Green component');

subplot(2,2,4), imshow(I(:,:,3)), title('Blue component');




                              % Contra harmonic filter
                              

A = imread('spnoise.jpg'); 
A = double(A); % Convert to double for accurate calculations
[R, C] = size(A);

B = zeros(R, C); % Initialize the output image

Q = -1; % Example order, you can adjust Q as needed

for i = 2:R-1
    for j = 2:C-1
        % Extract the 3x3 neighborhood
        temp = A(i-1:i+1, j-1:j+1);
        
        % Calculate the numerator and denominator for Contra Harmonic Mean
        numerator = sum(temp(:).^(Q + 1));
        denominator = sum(temp(:).^Q);
        
        % Compute the Contra Harmonic Mean value
        if denominator ~= 0
            value = numerator / denominator;
        else
            value = A(i, j); % Avoid division by zero
        end
        
        B(i, j) = value;
    end
end

% Convert the output to uint8 and display the filtered image
B = uint8(B);
figure, imshow(B);
title('Filtered Image with Contra Harmonic Mean Filter');












                                  % Adaptive arithematic filter
A = double(imread('flower.jpg')); 
[R, C] = size(A);

B = zeros(R, C); 


smooth = A(40:100, 40:100);
noise_var = var(smooth(:));


for i = 2:1:R-1
    for j = 2:1:C-1
        
        temp = A(i-1:i+1, j-1:j+1);
        local_var = var(temp(:));

        if local_var == 2 * noise_var || noise_var == 0
            B(i, j) = A(i, j);
        else
            temp2 = reshape(temp, 1, []);
            value = mean(temp2);
            B(i, j) = value;
        end
    end
end

% Convert to uint8 and display the filtered image
figure, imshow(uint8(B));
title('Filtered Image with Adaptive Smoothing');

             
             
             
             
         
             
        









                            





                            % Adaptive median filter

A =double( imread('girlnoise.jpg')); 
[R, C] = size(A);

B = zeros(R,C); 

for i = 2:1:R-1
    for j = 2:1:C-1
        
        
        temp = A(i-1:i+1, j-1:j+1);
        temp2 = reshape(temp, 1, []); 
        stemp = sort(temp2); 
        
        zmin = min(stemp);
        zmax = max(stemp);
        zmed = median(stemp);
        
        A1 = zmed - zmin;
        A2 = zmax - zmed;
        
        if (A1 == 0) || (A2 == 0)
            break;
            
        else
            B1 = A(i, j) - zmin;
            B2 = zmax - A(i, j);
            
            if (B1 == 0) || (B2 == 0)
                B(i, j) = zmed;
            else
                B(i, j) = A(i, j);
            end
        end
    end
end

figure, imshow(uint8(B)); 

         
      
       
       








A=zeros(200,200,3);

A(:,:,1)=1;
figure, imshow(A);
A(:,:,2)=1;
figure, imshow(A);
A(:,:,3)=1;
figure, imshow(A);












%                    red, green, blue, gray combine

A = zeros(200, 200, 3); % Create a 200x200x3 array initialized to zeros

% Fill the quadrants with specific colors
A(1:100, 101:200, 2) = 1;   % Green: set the second channel (green) to 1 in the top right quadrant
A(1:100, 1:100, 1) = 1;     % Red: set the first channel (red) to 1 in the top left quadrant
A(101:200, 1:100, 3) = 1;   % Blue: set the third channel (blue) to 1 in the bottom left quadrant
A(101:200, 101:200, :) = 0.5; % Gray: set all channels to 0.5 in the bottom right quadrant

figure, imshow(A); % Display the image A

% Sum the RGB values and divide by 9
rgb = sum(A(:,:,1:3), 3) / 9;

figure, imshow(rgb); % Display the resultant image









%            show the red, green, blue component of an image                                          



I = imread('rgb3.jpg');


figure;

% original color image
subplot(2, 2, 1);
imshow(I);
title('Color image (RGB)');

% red component
subplot(2, 2, 2);
imshow(I(:, :, 1));   %select all values from 1 component(red)
title('Red component');

% green component
subplot(2, 2, 3);
imshow(I(:, :, 2));
title('Green component');

% blue component
subplot(2, 2, 4);
imshow(I(:, :, 3));
title('Blue component');







 %                   segmentation of RGB using cube
 
 
 


A=double(imread('flower.jpeg'));
[R, C]= size(A);

B=A;

center=A(0.6,0.3,0.1);
width=0.2;
r=0.1;

for i= 1:1:R
    for j= 1:1:C
        
        if (r-A(i,j)) > r
            
            B(i,j)=0.5;
            
        end
    end
end

imshow(B);
        
        
%}

% Read the image
img = imread('flower.jpeg');

% Convert the image to HSV color space
hsvImg = rgb2hsv(img);

% Define the range of colors to highlight (replace with your desired range)
lower = [0.1 0.3 0.5];
upper = [0.2 0.8 0.8];

% Create a mask to isolate the desired color range
mask = inrange(hsvImg, lower, upper);

% Apply the mask to the original image
highlightedImg = img .* repmat(mask, [1 1 3]);

% Display the original and highlighted images
subplot(121); imshow(img); title('Original Image');
subplot(122); imshow(highlightedImg); title('Highlighted Image');







