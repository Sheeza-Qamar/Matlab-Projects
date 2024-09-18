
clc
clearvars
%{
A = uint8(imread('lcc.jpg')); 
arr = zeros(1, 256); 
[R, C] = size(A);

for i = 1:R
    for j = 1:C
        value = A(i, j) + 1;  % arr starts from 1 , pixel start from zero , certain pixel value will be +1
        arr(value) = arr(value) + 1; 
    end
end

figure;
plot(arr); 
title('Pixel Intensity Histogram');
xlabel('Pixel Intensity');
ylabel('Frequency');




%                   3 bit img


A = imread('3bit.jpg'); 
arr = zeros(1, 8);         % 0-7 pixels
[R, C] = size(A);

for i = 1:R
    for j = 1:C
        value = A(i, j) + 1;  % arr starts from 1 , pixel start from zero , certain pixel value will be +1
        arr(value) = arr(value) + 1; 
    end
end

figure;
plot(arr); 
title('Pixel Intensity Histogram');
xlabel('Pixel Intensity');
ylabel('Frequency');






%                                   normalized histogram


A = uint8(imread('girl.jpg')); 
arr = zeros(1, 256); 
[R, C] = size(A);

for i = 1:R
    for j = 1:C
        value = A(i, j) + 1;  % arr starts from 1 , pixel start from zero , certain pixel value will be +1
        arr(value) = arr(value) + 1; 
    end
end

figure;

Nhisto=arr/(R*C);

plot(Nhisto); 
title('Normalized Histogram');
xlabel('Pixel value');
ylabel('Probability');



A = imread('girl.jpg'); % Read the image
A = uint8(A); % Convert image to uint8 data type

figure;
imhist(A); % Plot histogram
title('Pixel Intensity Histogram');
xlabel('Pixel Intensity');
ylabel('Frequency');






% histogram equalization   (streching pixels according to their frequency



A=rgb2gray(imread('girl.jpg'));

[R,C]=size(A);

histo=zeros(1,256);

for i=1:1:R
    for j=1:1:C
        
        histo(A(i)+1)= histo(A(i)+1) + 1;
        
    end
end

% normalized histo (pdf)

nhisto=histo/(R*C);

% CDF

cdf=zeros(1,256);
sum=0;

for i=1:1:256
    cdf(i) = sum + nhisto(i);
    sum=cdf(i);
end


% LUT

lut= round(cdf * 255);  % for 8 bit multiply with 7

% new image

B=zeros(R,C);

for i=1:1:R
    for j=1:1:C
        
        B(i,j)=lut(A(i,j)+1);
        
    end
end

imshow (uint8(B));
        




%                  contrast shrinking



A=rgb2gray(imread('girl.jpg'));

B=imadjust(A, [], [10/255 , 100/255]);

figure, imshow(B);



% 2 METHOD SHRINKING FORMULA


C=double(rgb2gray(imread('girl.jpg')));


fmin = min(C(:));          %matrix dimension fmin = min(min(f))
smin= 150;
fmax = max(C(:));
smax=255;

g = ((smax - smin) / (fmax - fmin)) * (C - fmin) + smin;
figure, imshow(uint8(g));






%                  Histogram sliding


    


% Read the image
I = imread('moon.jpg');

% Display the original image
figure, imshow(I);
title('Original Image');

% Display the original image pixel intensity values
figure, imhist(I), ylim('auto');
title('Original Image Histogram');

% Add 50 to the intensity values, ensuring they stay within the valid range
I2 = imadd(I, 50);

% Display the modified image
figure, imshow(I2);
title('Image After Adding 50 to Intensity Values');

% Display the histogram of the modified image
figure, imhist(I2), ylim('auto');
title('Histogram of Image After Adding 50 to Intensity Values');




        
   %}
     
        
%                        Adaptive histogram (local histogram equalization

I = imread('lcmoon.jpg');

figure, imshow(I);

figure, subplot(1,2,1), imshow(I), ...

subplot(1,2,2), imhist(I), ylim('auto')

J = histeq(I);

figure, subplot(1,2,1), imshow(J), ...

subplot(1,2,2), imhist(J), ylim('auto')

K = adapthisteq(I);

figure, subplot(1,2,1), imshow(K), ...

subplot(1,2,2), imhist(K), ylim('auto')














                                % local image enhanement thoroufg statistical
                              
%{
                              
A = double(imread('lcc.jpg'));

mg = mean(A(:));  % mean of whole img
vg = var(A(:));  % variance of whole img

[R, C] = size(A);
B = zeros(R, C);

for i = 2:R-1
    for j = 2:C-1
        
        temp = A(i-1:i+1, j-1:j+1);
        
        ms = mean(temp(:));   % mean sxy
        vs = var(temp(:));   % variance of sxy
        
        if ms < mg && vg * 0.5 < vs && vs < 1.5 * vg
            
           
            temp_hist = imhist(temp);
            nhist = temp_hist / 9;
            
            cdf = cumsum(nhist);
            lut = round(cdf * 255);
            
           
            B(i-1:i+1, j-1:j+1) = lut(A(i-1:i+1, j-1:j+1) + 1);
        else
            B(i, j) = A(i, j); 
        end
    end
end

imshow(uint8(B));

%}


