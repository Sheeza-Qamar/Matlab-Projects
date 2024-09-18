%{
%                   SHARPENING FILTERS
clearvars
clc;
 A=double(rgb2gray(imread('flower.jpeg')));
 [R, C]=size(A);
 
 B=zeros(R,C);
 img2=zeros(R,C);
 img3=zeros(R,C);
 
 w1=[-1 -1 -1 0 0 0 1 1 1];
%  w1=[-1 0 1 -1 0 1 -1 0 1];  %prewitt filter
 w2=[0 1 0 1 -4 1 0 1 0];       %isotopic
 w3=[-1 -1 -1 -1 8 -1 -1 -1 -1];   %laplacian filter
 
 for i=2:1:R-1
     for j=2:1:C-1
         temp=A(i-1:i+1 ,j-1:j+1);
         temp2=reshape(temp,1,[]);        %convert the selected box of image into 1D array
         product1=dot(temp2,w1);            %dot product of both 1D arrays
         product2=dot(temp2,w2); 
         product3=dot(temp2,w3); 
         B(i,j)=product1;
         img2(i,j)=product2;
         img3(i,j)=product3;
     end
 end
 
 imshow(uint8(B));
 figure, imshow(uint8(img2));
  figure, imshow(uint8(img3));













                    %bit plane slicing graphs
                    
                    
                    
 % Define input intensity values
x = 0:255;

% Calculate corresponding output intensity values
y = mod(floor(x/2), 2);

% Plot the transformation function
figure;

plot(x, y, 'LineWidth', 2);
title('Transformation Function for 8th Bit Plane');
xlabel('Input Intensity');
ylabel('Output Intensity');
grid on;

%}

 A=double(rgb2gray(imread('flower.jpeg')));
 
 imshow(uint8(A));
 impixelinfo();

