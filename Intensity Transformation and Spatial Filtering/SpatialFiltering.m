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
% filter = [ 1/9, 1/9, 1/9 ; ...
%            1/9, 1/9, 1/9 ; ...
%            1/9, 1/9, 1/9 ];

size = 25;
filter = ones(size, size) * 1/(size*size);

% filter1 = [ -1, 0, 1 ; ...
%             -2, 0, 2 ; ...
%             -1, 0, 1 ];
% (
% filter2 = [ -1, -2, -1 ; ...
%              0,  0,  0 ; ...
%              1,  2,  1 ];

J = my_imfilter(I, filter);

figure;
imshow(J);