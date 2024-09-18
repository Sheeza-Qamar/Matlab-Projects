% Load the original image
original_image = imread('girl.jpg');

% Convert to grayscale if necessary
if size(original_image, 3) == 3
    original_image = rgb2gray(original_image);
end

% Perform 7-bit slicing
sliced_7_bit = bitand(original_image, 254); % Keeping the most significant 7 bits

% Perform 8-bit slicing
sliced_8_bit = bitand(original_image, 255); % Keeping the most significant 8 bits

% Display the sliced images
subplot(1, 3, 1), imshow(original_image), title('Original Image');
subplot(1, 3, 2), imshow(sliced_7_bit), title('7-Bit Sliced Image');
subplot(1, 3, 3), imshow(sliced_8_bit), title('8-Bit Sliced Image');

% Save the sliced images
imwrite(sliced_7_bit, 'sliced_7_bit.jpg');
imwrite(sliced_8_bit, 'sliced_8_bit.jpg');
