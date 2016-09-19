clear all
close all
addpath('Images');


%% Compute Gradient Image of A_pattern.jpg
I = imread('A_pattern.jpg');

% Sobel filters for finding g_x and g_t
sobelX = [ -1,  0,  1 ; ...
           -2,  0,  2 ; ...
           -1,  0,  1 ];
sobelY = [ -1, -2, -1 ; ...
            0,  0,  0 ; ...
            1,  2,  1 ];

% Computer x and y gradients of image
g_x = my_imfilter(I, sobelX);
g_y = my_imfilter(I, sobelY);

% Combine the gradients 
% M = abs(g_x) + abs(g_y);
M = uint8(sqrt(double(g_x).^2 + double(g_y).^2));

figure('Name', 'Gradient Image');
subplot(1,2,1); imshow(I);
subplot(1,2,2); imshow(M);

%% Average filtering on A_pattern.jpg

% Formula for generic averaging filter
size = 3;
averaging_filter = ones(size, size) * 1/(size*size);

% Runs the averaging filter over the image
M = my_imfilter(I, averaging_filter);

figure('Name', 'Avgerage filtering');
subplot(1,2,1); imshow(I);
subplot(1,2,2); imshow(M);

%% Gausian kernels 5x5, 9x9, 15x15

std = 1.5;

% Create the three different gaussian kernels
gaussian_5x5 = create_gaussian_kernel(5, std);
gaussian_9x9 = create_gaussian_kernel(9, std);
gaussian_15x15 = create_gaussian_kernel(15, std);

% Run each filter over the image
h_5x5 = my_imfilter(I, gaussian_5x5);
h_9x9 = my_imfilter(I, gaussian_9x9);
h_15x15 = my_imfilter(I, gaussian_15x15);

figure('Name', 'Gaussian Blurs');
subplot(2,2,1); imshow(I);          title('Original'); 
subplot(2,2,2); imshow(h_5x5);      title('5x5 kernel');
subplot(2,2,3); imshow(h_9x9);      title('9x9 kernel');
subplot(2,2,4); imshow(h_15x15);    title('15x15 kernel');
