clc;
clearvars;
%{

img = double(rgb2gray(imread('girl.jpg')));

minx = min(img(:));
maxx = max(img(:));


[R, C] = size(img);


B = zeros(R, C);


for i = 1:R
    for j = 1:C

        normalized_value = (img(i, j) - minx) / (maxx - minx);
        B(i, j) = normalized_value * 255;
        
    end
end


figure, imshow(uint8(B));




%                               gemma correction

[X,map] = imread('currupt.tif');
I = ind2gray(X,map);

J = imadjust(I,[],[],0.5);
imshowpair(I,J,'montage');






img = double(imread('girl.jpg'));
B=imcomplement(img);
imshow(B);






                         % contrast enhancement


I = imread('girl.jpg');

imshow(I);
f = double(I);

fmin = min(f(:));          %matrix dimension fmin = min(min(f))

fmax = max(f(:));

g = uint8(255*(f-fmin)/(fmax-fmin));

figure, imshow(g)







%          gamma correction = power law = s=r^n

img = double(rgb2gray(imread('bone.jpg')));

result = img .^ 1.6;

imshow(uint8(result));


%}











%{





% intensity level slicing formula 



LUT = uint8(zeros([1 256]));
LUT(1:65) = 2*(0:64);
LUT(66:129) = 128;
LUT(130:256) = (130:256)-1;



I = imread('lut.jpg');
LUT = double(zeros([1 256]));
LUT(1:256)=5* sqrt(0:255);
LUT_int8 = uint8(LUT);
tic
O = intlut(I, LUT_int8);
toc
figure, subplot(1,2,1), imshow(I), subplot(1,2,2), imshow(O)













I = imread('lut.jpg');
I2 = double(I);
tic
J = 5*sqrt(I2);
toc
O = uint8(J);
subplot(1,2,1), imshow(I), subplot(1,2,2), imshow(O)






I = imread('lut.jpg');
O = intlut(I,LUT);
figure, subplot(1,2,1), imshow(I), subplot(1,2,2), imshow(O)


%}


%                           contrast streching formula 



A = double(imread('p.jpg'));
[R, C] = size(A);
B = zeros(R, C);

r1 = 70;
r2 = 140;

a1 = 2;
a2 = 1;
a3 = 1.5;

for i = 1:R
    for j = 1:C
        if A(i,j) >= 0 && A(i,j) <= r1
            B(i,j) = a1 * A(i,j);
        elseif A(i,j) > r1 && A(i,j) <= r2
            B(i,j) = (a2 * A(i,j) - r1) + (a1 * r1);
        elseif A(i,j) > r2 && A(i,j) <= 255
            B(i,j) = (a3 * A(i,j) - r2) + (a2 * (r2 - r1) + (a1 * r1));
        end
    end
end

imshow(uint8(B)); 

            



