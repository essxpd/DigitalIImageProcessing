function [ output ] = my_imfilter( input, filter )
%MY_IMFILTER Summary of this function goes here
%   Detailed explanation goes here

    % Zero pad the input
%     input_p = padarray(input, uint8(size(filter) / 2));
    
    padding_size = floor(size(filter)/2);
    input_p = zeros(size(input) + 2*padding_size);
    
    x_range = (1+padding_size):(size(input_p,1) - padding_size);
    y_range = (1+padding_size):(size(input_p,2) - padding_size);

    input_p(x_range, y_range) = input;
    
    for i = x_range
        for j = y_range
            x_range_filter = (i-padding_size(1)) : (i+padding_size(1));
            y_range_filter = (j-padding_size(2)) : (j+padding_size(2));
            weighted = input_p(x_range_filter, y_range_filter) .* filter;
            output(i - padding_size(1), j - padding_size(2)) = sum(sum(weighted));
        end
    end
    
    output = uint8(output);
%     
%     output = uint8(input_p);
end

