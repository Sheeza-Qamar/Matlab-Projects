            %To show processed image
            
              clearvars;
 A=rgb2gray(imread('glaxy.jpg'));
 noisyA=imnoise(A,'salt');
 [R, C]=size(noisyA);
 
 B=zeros(R,C);
 C=zeros(R,C);
% D=zeros(R,C);
 
 for i=2:1:R-1
     for j=2:1:C-1
         temp=noisyA(i-1:i+1 ,j-1:j+1);
         temp2=reshape(temp,1,[]);        %convert the selected box of image into 1D array
         stemp=sort(temp2);
         
         B(i,j)=min(stemp);
         C(i,j)=max(stemp);
        % D(i,j)=median(stemp);
         
         
     end
 end
 
 figure, imshow(A);
 figure, imshow(B);
 figure, imshow(uint8(C));
 %figure, imshow(uint8(D));
 
 