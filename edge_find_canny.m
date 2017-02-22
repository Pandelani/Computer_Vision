frizzy = imread('frizzy.png');
froomer = imread('froomer.png');
figure(1)
imshow(frizzy);
figure(2)
imshow(froomer);

% TODO: Find edges in frizzy and froomer images
frizzy_edge = edge(rgb2gray(frizzy),'canny');
froomer_edge = edge(rgb2gray(froomer),'canny');
figure(3)
imshow(frizzy_edge);
figure(4)
imshow(froomer_edge);
% TODO: Display common edge pixels
figure(3)
imshow(frizzy_edge);
figure(4)
imshow(froomer_edge);
figure(5)
imshow(frizzy_edge & froomer_edge);