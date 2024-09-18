% Apply 3*3 averaging filter on the image ignoring boundaries


A = double(rgb2gray(imread('car2.jpeg')));
[R, C] = size(A);
B = zeros(R, C);

for i = 2:1:R-1
    for j = 2:1:C-1
        % Extract the 3x3 neighborhood around the pixel
        temp = A(i-1:i+1, j-1:j+1);
        
        % Reshape the 3x3 array into a 1D array
        stemp = reshape(temp, 1, []);
        
        % Calculate the sum of elements in the neighborhood
        mysum = sum(stemp);
        
        % Calculate the average value (mean) of the neighborhood
        myvalue = mysum / 9;
        
        % Assign the average value to the corresponding pixel in B
        B(i, j) = myvalue;
    end
end

% Display the processed image
imshow(uint8(B));



                   %METHOD NO 2
                   
 % APPLY KERNEL ON THE IMAGE
 
 figure(1);                  %To show real image
 C=double(rgb2gray(imread('star.jpg')));
 imshow(uint8(C));
 
 
 
 figure(2);                   %To show processed image
 A=double(rgb2gray(imread('star.jpg')));
 [R, C]=size(A);
 
 B=zeros(R,C);
 w=[1/9 1/9 1/9 1/9 1/9 1/9 1/9 1/9 1/9];
 
 for i=2:1:R-1
     for j=2:1:C-1
         temp=A(i-1:i+1 ,j-1:j+1);
         temp2=reshape(temp,1,[]);        %convert the selected box of image into 1D array
         product=dot(temp2,w);            %dot product of both 1D arrays
         
         B(i,j)=product;
         
     end
 end
 
 imshow(uint8(B));
 
 %}

%                 Generic code for the AVERAGING filter of any odd lenght
clearvars
img = double(rgb2gray(imread('girl.jpg')));
[R, C]=size(img);
B=zeros(R,C);


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

 imshow(uint8(B));

        
        
       
       
        








