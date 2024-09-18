clearvars
A=rgb2gray(imread('girl.jpg'));

[R,C]=size(A);
B=zeros(R,C);

for i=1:1:R
    for j=1:1:C
        if A(i,j)>128 %set a threshold value
            B(i,j)=255;
        end
    end
end
imshow(uint8(A));
figure, imshow(B);