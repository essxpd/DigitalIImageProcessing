clear all
close all
addpath('Images');

%% Histogram equalization on lena_biased

% Plot the image and its histogram
I = imread('lena_biased.jpg');
figure('Name', 'Histogram Equalizization on Lena_biased.jpg');
subplot(2,2,1); imshow(I);      title('Lena\_biased.jpg');
subplot(2,2,3); histogram(I);   title('Lena\_biased.jpg Histogram');

% Histogram equilzation
J = my_histeq(I);
subplot(2,2,2), imshow(J);      title('Equalized Lena\_biased.jpg');
subplot(2,2,4), histogram(J);   title('Equalizeed Lena\_biased.jpg Histogram');

%% Histogram specification on mandrill_washedout.jpg

% Plot the image and its histogram
figure('Name', 'Histogram Specification on mandrill_washedout.jpg');
I = imread('mandrill_washedout.jpg');
subplot(3,2,1), imshow(I);      title('mandrill\_washedout.jpg');
subplot(3,2,3), histogram(I);   title('mandrill\_washedout.jpg Histogram');

% Calculate the new image with the specified pdf
pdf_z = load('pdf_z.txt');
J = my_histspec(I, pdf_z);

subplot(3,2,5.5), bar(pdf_z);   title('target pdf');
subplot(3,2,2), imshow(J);      title('Enhanced mandrill\_washedout.jpg');
subplot(3,2,4), histogram(J);   title('Enhanced mandrill\_washedout.jpg Histogram');

