clc
clear all
%salt noise
A=imread('cameraman.tif');
subplot(5,1,1);
imshow(A);
title('Original Image');
b=4;
img_with_noise= im2double(A);
[m,n]=size(A);
x = randi([0,255],m,n);
img_with_noise(x <= b) = 255;
subplot(5,1,2);
imshow(img_with_noise);
title('salt noise');

% Restore using contraharmonic
data=im2double(A);
masksize=3;
Q=2;
sumn=[];
sumd=[];
pixln=0;
pixld=0;
[row col]=size(data);
for i=1:row;
    for j=1:col;
        for m=-masksize:masksize;
            for n=-masksize:masksize;
                if (i+m>0 && i+m<row && j+n>0 && j+n<col && ...      
                        masksize+m>0 && masksize+m<row && ...
                        masksize+n>0 && masksize+n<col) 
                    pixl1=(data(i+m,j+n)).^(Q+1);       
                    pixl2= (data(i+m,j+n)).^Q;
                    pixln=pixln+pixl1;                              
                    pixld=pixld+pixl2;
                
                end
            end
        end
       res(i,j)=(pixln/pixld);
       pixln=0;
       pixld=0;
    end
end
subplot(5,1,3);
imshow(res);
title('Restored Image When Q=2');
% when Q=-1
Q=-1;
sumn=[];
sumd=[];
pixln=0;
pixld=0;
[row col]=size(data);
for i=1:row;
    for j=1:col;
        for m=-masksize:masksize;
            for n=-masksize:masksize;
                if (i+m>0 && i+m<row && j+n>0 && j+n<col && ...      
                        masksize+m>0 && masksize+m<row && ...
                        masksize+n>0 && masksize+n<col) 
                    pixl1=(data(i+m,j+n)).^(Q+1);       
                    pixl2= (data(i+m,j+n)).^Q;
                    pixln=pixln+pixl1;                              
                    pixld=pixld+pixl2;
                
                end
            end
        end
       res(i,j)=(pixln/pixld);
       pixln=0;
       pixld=0;
    end
end
subplot(5,1,4);
imshow(res);
title('Restored Image When Q=-1');

% when Q=1
Q=1;
sumn=[];
sumd=[];
pixln=0;
pixld=0;
[row col]=size(data);
for i=1:row;
    for j=1:col;
        for m=-masksize:masksize;
            for n=-masksize:masksize;
                if (i+m>0 && i+m<row && j+n>0 && j+n<col && ...      
                        masksize+m>0 && masksize+m<row && ...
                        masksize+n>0 && masksize+n<col) 
                    pixl1=(data(i+m,j+n)).^(Q+1);       
                    pixl2= (data(i+m,j+n)).^Q;
                    pixln=pixln+pixl1;                              
                    pixld=pixld+pixl2;
                
                end
            end
        end
       res(i,j)=(pixln/pixld);
       pixln=0;
       pixld=0;
    end
end
subplot(5,1,5);
imshow(res);
title('Restored Image When Q=1');

