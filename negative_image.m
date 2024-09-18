
A=uint8(imread('i.jpeg'));
B=255-A;
imshow(A);
figure, imshow(B);








%{ 
 %imcomplemrnt()77
A=imread('car.jpeg');
Ad=double(A);
%Ad=rgb2gray(Ad);
[R, C]=size(Ad);
B=zeros(R,C);
for i=1:1:R;
    for j=1:1:C;
        B(i,j)=255-Ad(i,j);
    end
end
imshow(Ad);







img = imread('ten.jpg');
B = imadjust(img);

[R, C] = size(B);
D = zeros(R, C);

for i = 1:R
    for j = 1:C
        if (B(i, j) >= 22 && B(i, j) <= 35)
            D(i, j) = 0;
        else
            D(i, j) = B(i, j);
        end
    end
end

E = imcomplement(D);
imshow(E);












img = rgb2gray(imread('ten.jpg'));
B = imadjust(img);                               % it show watermark

E = imcomplement(B);
imshow(E);

 
%}







