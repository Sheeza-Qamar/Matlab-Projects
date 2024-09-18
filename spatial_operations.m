clearvars
A = double(rgb2gray(imread('currupt.jpg')));

[R, C]=size(A);

B=zeros(R,C);

for i=1:1:R;
    for j=1:1:C;
         B(i,j) = log(1 + A(i,j)); % for s=c log(1+r)
        % A(i,j)=2*A(i,j)+10;   for s=2r+10
        % A(i,j)=A(i,j)-30;    for s=r-30      
        % A(i,j)=A(i,j)*2;    for   s=r*2
        % A(i,j)=A(i,j)/2;   for s=r/2
    end
end
imshow(uint8(B));





    

