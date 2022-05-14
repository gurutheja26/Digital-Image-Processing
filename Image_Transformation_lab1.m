clear all
clc

%Original Image
g = imread("cameraman.tif");
subplot(5,2,1),
imshow(g)
title("Original cameraman Image");

a = imread("lena_std.tif");
subplot(5,2,2),
imshow(a)
title("Original Lena Image");

%NegativeTransformation
L=2^8;
neg = (L-1)- g;
subplot(5,2,3),
imshow(neg);
title("Negative Image");

L=2^8;
neg = (L-1)- a;
subplot(5,2,4),
imshow(neg);
title("Negative Image");

%LogarithmicTransformation
t=im2double(g)
c=1
s=(c*log(1+t));
subplot(5,2,5)
imshow(s);
title("logarithmic Image")

t=im2double(a)
c=1
s=(c*log(1+t));
subplot(5,2,6)
imshow(s);
title("logarithmic Image")

%Gamma Tranformation(r=0.5)
h=im2double(g)
c=1
r=0.5
n=(c*(h.^r));
subplot(5,2,7)
imshow(n);
title(" Gamma Image(r=0.5)")

h=im2double(a)
c=1
r=0.5
n=(c*(h.^r));
subplot(5,2,8)
imshow(n);
title(" Gamma Image(r=0.5)")

%Gamma Transformation(r=2)
h=im2double(g)
c=1
r=2
n=(c*(h.^r));
subplot(5,2,9)
imshow(n);
title(" Gamma Image(r=2)")

h=im2double(a)
c=1
r=2
n=(c*(h.^r));
subplot(5,2,10)
imshow(n);
title(" Gamma Image(r=2)")