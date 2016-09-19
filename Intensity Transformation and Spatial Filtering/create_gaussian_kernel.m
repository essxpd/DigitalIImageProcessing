function [ kernel ] = create_gaussian_kernel( window_size, std )
    
    s = -floor(window_size / 2) : floor(window_size / 2);
    [x, y] = meshgrid(s, s);

    kernel = exp(-(x.^2 + y.^2) / (2 * std.^2));
    kernel = kernel / sum(sum(kernel));
end

