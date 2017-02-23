%Read image
img = imread('autobahn3.jpg');
grays = rgb2gray(img);
edges = edge(grays, 'canny');

figure, imshow(img),title('original');
figure, imshow(grays),title('grays');
figure, imshow(edges),title('edges');

%Hough Transform
[accum theta rho] = hough(edges);
figure, imagesc(accum, 'XData',theta,'YData',rho),title('Hough Accumulator');
%peaks = houghpeaks(accum , 100); There is no threshold in this function
%call, the hough transform will detect too many lines. Only the member
%which got more votes than threshold will show up

peaks = houghpeaks(accum, 100, 'Threshold',ceil(0.95*max(accum(:))),'NHoodSize',[5 5]); 

hold on; plot(theta(peaks(:,2)),rho(peaks(:,1)),'rs');hold off;
size(peaks)
%line_segs = houghlines(edges,theta,rho,peaks);
line_segs = houghlines(edges,theta,rho,peaks,'FillGap',50,'MinLength',100);



%plot line segments
figure, imshow(img),title('Line Segments');
hold on;
for k=1:length(line_segs)
    endpoints = [line_segs(k).point1; line_segs(k).point2];
    plot(endpoints(:,1),endpoints(:,2),'LineWidth',2,'color','green');
end
