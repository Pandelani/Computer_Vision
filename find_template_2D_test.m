



% Test code:
bike = imread('bicycle.png');
imshow(bike);
bike_corp = bike(75:165, 150:185);
imshow(bike_corp);

[y x] = find_template_2D(bike_corp, bike);
disp([y x]); % should be the top-left corner of template in tablet
