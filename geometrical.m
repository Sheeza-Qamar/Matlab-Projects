

clc;
clearvars;
A = double(rgb2gray(imread('girl.jpg')));
[R, C] = size(A);

B = zeros(R, C);
                           % For Translation
%a0 = 1; a1 = 0; a2 = 5;
%b0 = 0; b1 = 1; b2 = 3;

                           % For Scaling

%a0 = 5; a1 = 0; a2 = 0;
%b0 = 0; b1 = 5; b2 = 0;

                         % For shear
                         
a0 = 1; a1 = 3; a2 = 0;
b0 = 4; b1 = 1; b2 = 0; 
                         
                         
 

for i = 1:R
    for j = 1:C
        % Transformation matrix
        T = [a0, a1, a2; b0, b1, b2; 0, 0, 1];

        % Original pixel coordinates
        original_pixel = [i; j; 1];

        
        transformed_pixel = round(T * original_pixel);

        % Extract transformed coordinates
        x = transformed_pixel(1);
        y = transformed_pixel(2);
        
       
        B(x, y) = A(i, j);
        % Check if transformed coordinates are within bounds
        if (x > 0 && x <= R && y > 0 && y <= C)
            % Update pixel value in B
            
             % B(x, y) = A(i, j);
            
        end
    end
end

imshow(uint8(B));



%{


%                           FOR ROTATION


clc;
clearvars;
A = rgb2gray(imread('girl.jpg'));
[R, C] = size(A);

B = zeros(R, C);

% For Rotation
x = 90; % Rotation angle in degrees
rad = deg2rad(x); % Convert angle to radians

% Rotation matrix
a0 = cos(rad); a1 = sin(rad);
b0 = -sin(rad); b1 = cos(rad);

% Center of rotation (assuming center of image)
center_x = floor(R / 2);
center_y = floor(C / 2);

for i = 1:R
    for j = 1:C
        % Translate the coordinates to the center of rotation
        x_t = i - center_x;
        y_t = j - center_y;

        % Apply rotation
        x_rotated = round(a0 * x_t + a1 * y_t + center_x);
        y_rotated = round(b0 * x_t + b1 * y_t + center_y);

        % Check if transformed coordinates are within bounds
        if (x_rotated > 0 && x_rotated <= R && y_rotated > 0 && y_rotated <= C)
            % Update pixel value in B
            B(x_rotated, y_rotated) = A(i, j);
        end
    end
end

imshow(uint8(B));

  

%                       REVERSE MAPPING


        
      
clc;
clearvars;

A = rgb2gray(imread('girl.jpg'));


B = zeros(500, 500);
[R, C] = size(B);

% For Translation
a0 = 1; a1 = 0; a2 = 5;
b0 = 0; b1 = 1; b2 = 3;


invT = [a0, b0, 0; a1, b1, 0; a2, b2, 1];

for i = 1:R
    for j = 1:C
       
        pixel= [i; j; 1];
        
     
        inverse_transf = round(invT * pixel);
        
        % Extract original coordinates
        x = inverse_transf(1);
        y = inverse_transf(2);
        
        
        if (x > 0 && x <= 275 && y > 0 && y <= 183) % we assign the value of R and C of original A image
           
            B(i,j) = A(x,y);
        end
    end
end

imshow(uint8(B));

 %}
