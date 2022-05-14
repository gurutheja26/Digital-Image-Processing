clear all
clc
g=imread('cameraman.jpeg');
subplot(2,2,1)
imshow(g)
title('Original Image')
f=ones(3,3)/9;
t = imnoise(g,'gaussian',0,0.01);
subplot(2,2,2)
imshow(t)
title('Noisy image')
r=imfilter(t,f,'circular');
subplot(2,2,3)
imshow(r)
title('Filtered image')
l=imfilter(g,f,'circular');
subplot(2,2,4)
imshow(l)
title('Averaged Image')