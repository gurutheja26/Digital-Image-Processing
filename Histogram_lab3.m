clear all
clc
g=imread('cameraman.tif');
subplot(2,1,1)
histogram(g)
title("Inbuilt func Histogram")
subplot(2,1,2)
y=zeros(1,256);
[r c]=size(g);
n=0:255;
for i=1:r
    for j=1:c
        for x=0:255
            if g(i,j)==x
                y(1,x)=y(1,x)+1;
            end
        end
    end
end
disp(y)
x1=0:1:255;
bar(x1,y)
title("Own Function")

         