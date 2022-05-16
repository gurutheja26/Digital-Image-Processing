clear all 
clc
A=imread("cameraman.tif")
subplot(4,1,1)
imshow(A)
title("Original Image")
% Gaussian Noise when mean=0.5 and variance constant
m= 0.5
sd=0.01
v=sd^2
J = imnoise(A,'gaussian',m,v)
subplot(4,1,2)
imshow(J)
title("Mean is 0.5 and Standrad Deviation is 0.01")

% Restore using arithmatic mean Filter
[row col]=size(J);
for i=1:1:row-2;
    for j=1:1:col-2;
        for u=1:1:2;
            for v=1:1:2;
                c(i,j)=J(i,j)+J(i+u,j+v);
                c(i,j)=J(i,j)/row*col;
            end
        end
    end
end

h=fspecial('average',3);
Af=imfilter(J,h);
subplot(4,1,3)
imshow(Af)
title("Restored using Arithmatic")

% Restore Using Geometric Mean
g=im2double(J);
f=exp(imfilter(log(g),ones(3,3),'replicate')).^(1/9);
subplot(4,1,4)
imshow(f)
title("Restored using Geometric")