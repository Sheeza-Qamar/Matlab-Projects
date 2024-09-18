clearvars
img = double(rgb2gray(imread('girl.jpg')));
[R, C]=size(img);
B=zeros(R,C);
edgeimg=zeros(R,C);
sharpe=zeros(R,C);


size = double(input('Enter any length for odd filter: '));

t=size/2;                   %let 3/2=1.5
s1=ceil(t);                 %s1=2
s2=floor(t);                %s2=1
div=size^2;                  %3*3=9

for i=s1:1:R-s2             % to ignore boundaries start from row 2 end end on totalRows - 1
    for j=s1:1:C-s2
        
        temp=img(i-s2:i+s2,j-s2:j+s2);    %  to male a filter block of 9 , start from rwo-1 to row +1, col-1 to col+1
        stemp=reshape(temp,1,[]);         % convert into 1D 
        
        mysum=sum(stemp);                 %sum all the values the selected box values
        value=mysum/div;                  % divide by the nu,ber of values like in this case by 9
        
        B(i,j)=value;                    % place the new value in image
        
    end
end

 edges = img - B;
sharpened = edges + img;
imshow(uint8(sharpened));
 
 
 