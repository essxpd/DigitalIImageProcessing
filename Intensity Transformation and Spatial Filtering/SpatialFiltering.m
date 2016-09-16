clear all
close all
addpath('Images');


%% Compute Gradient Image of A_pattern.jpg
I = imread('A_pattern.jpg');
J = int8(gradient(double(I)));

figure('Name', 'Gradient Image');
subplot(1,2,1); imshow(I);
subplot(1,2,2); imshow(J);

%% Average filtering on A_pattern.jpg
filter = [ 1/9, 1/9, 1/9 ; ...
           1/9, 1/9, 1/9 ; ...
           1/9, 1/9, 1/9 ];

J = my_imfilter(I, filter);