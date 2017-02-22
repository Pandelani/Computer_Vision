lena = imread('lena.jpg');
figure, imshow(lena),title('Original image, color');

%gray
lenaMono = rgb2gray(lena);
figure, imshow(lenaMono),title('Original image, mono');

%smoothed
h=fspecial('gaussian', [11 11], 4);
figure,surf(h);
lenaSmooth = imfilter(lenaMono, h);
figure, imshow(lenaSmooth), title('Smoothed_image');

%difference
lenaL = lenaSmooth;
lenaL(:,[1:(end-1)]) = lenaL(:,[2:end]);
lenaR = lenaSmooth;
lenaR(:,[2:end]) = lenaR(:,[1:(end-1)]);
lenaDiff = double(lenaR)-double(lenaL);
figure,imshow(lenaDiff,[]),title('Difference');

%canny
cannyEdge = edge(lenaMono,'canny');
figure,imshow(cannyEdge),title('original edges');

%log edge
logEdge = edge(lenaMono,'log');
figure,imshow(logEdge),title('original edges log');



