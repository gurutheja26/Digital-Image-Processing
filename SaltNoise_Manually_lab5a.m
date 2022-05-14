clc
clear all
%salt noise
A=imread('cameraman.tif');
subplot(1,2,1);
imshow(A);
title('Original Image');
b=4;
img_with_noise= im2double(A);
[m,n]=size(A);
x = randi([0,255],m,n);
img_with_noise(x <= b) = 255;
subplot(1,2,2);
imshow(img_with_noise);
title('salt noise');





