
clc
clearvars

base_image = imread('A.jpg'); 
 input_image= imread('B.jpg'); 


[basePoints, inputPoints] = cpselect(base_image, input_image, 'Wait',true);

tform = cp2tform(basePoints, inputPoints, 'affine');

output_img = imtransform(input_image, tform);


imshow(output_img); 







