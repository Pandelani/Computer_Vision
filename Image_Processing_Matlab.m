%%
%Image Read
im=imread('yosemite-2048.jpg');
imgreen=im(:,:,2);
figure(1)
imshow(imgreen);

%%
%Show value of image function
line([1 515],[256 256],'color','r')
figure(2)
plot(imgreen(256,:))
disp(size(imgreen))
disp(class(imgreen))

%%
%Blend two image with weighting(function at the end of file)
dolphin = imread('dolphin.png');
bicycle = imread('bicycle.png');
figure(3)
result = blend(dolphin, bicycle, 0.75);
imshow(result);

%%
%Image subtraction
figure(4)
imshow(imabsdiff(dolphin, bicycle));

%%
%Noise Gaussian Modeling
noise_sigma=25;
noise=randn(size(bicycle)).*noise_sigma;
noise=uint8(noise);
bicycle_noise = bicycle+noise;
figure(5)
imshow(bicycle_noise);

%%
%Gaussian filtering for linear noise(gaussian noise)
hsize=11;
sigma=2;
h=fspecial('gaussian',hsize,sigma);
figure(6)
surf(h);
figure(7)
imagesc(h);
outim=imfilter(bicycle_noise,h);
imshow(outim);

%%
%salt&pepper noise
dolphin_noise=imnoise(dolphin,'salt & pepper', 0.02);

figure(8)
imshow(dolphin_noise);

%%
%median filter(for non-linear noise salt&pepper noise)
median_filtered=medfilt2(dolphin_noise);
figure(9)
imshow(median_filtered);


%% 
%Unsharp Mask--Use for "sharp" the image
h1=[-0.1,-0.1,-0.1;-0.1,1.9,-0.1;-0.1,-0.1,-0.1];
median_sharp=imfilter(median_filtered,h1);
figure(10)
imshow(median_sharp);

%%
%function for blend
function output = blend(a, b, alpha)
    output=alpha.*a+(1-alpha).*b;
end










