
% Test code:
bike = imread('bicycle.png');
imshow(bike);
bike_corp = bike(75:165, 150:185);
figure(1)
imshow(bike_corp);

[y x] = find_template_2D(bike_corp, bike);
disp([y x]); % should be the top-left corner of template in tablet
figure(2)
imshow(img);
hold on;
plot(x,y,'r+','markersize',16);
hold off;
