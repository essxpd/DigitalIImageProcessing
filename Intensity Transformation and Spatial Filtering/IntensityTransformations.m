clear all
close all
addpath('Images');

%% Hist eq on lena_biased

% Load image
I = imread('lena_biased.jpg');
figure('Name', 'Histogram Equalizization on Lena_biased.jpg');
subplot(2,2,1), imshow(I);
title('Lena\_biased.jpg');

subplot(2,2,3), histogram(I);
title('Lena\_biased.jpg Histogram');

% Histogram equilzation
J = my_histeq(I);
subplot(2,2,2), imshow(J);
title('Equalized Lena\_biased.jpg');

subplot(2,2,4), histogram(J);
title('Equalizeed Lena\_biased.jpg Histogram');
