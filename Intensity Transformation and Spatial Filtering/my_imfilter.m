function [ output ] = my_imfilter( input, filter )
%MY_IMFILTER takes an input image and runs a filter over it

    % Add zero padding to the image
    padding_size = floor(size(filter)/2);
    input_p = zeros(size(input) + 2*padding_size);
    
    x_range = (1+padding_size):(size(input_p,1) - padding_size);
    y_range = (1+padding_size):(size(input_p,2) - padding_size);

    % Copy the input into the inside of the padded matrix
    input_p(x_range, y_range) = input;
    
    % Calculate the value of each output pixel
    for i = x_range
        for j = y_range
            x_range_filter = (i-padding_size(1)) : (i+padding_size(1));
            y_range_filter = (j-padding_size(2)) : (j+padding_size(2));
            
            % Multiply the filter by the values of the pixels
            weighted = input_p(x_range_filter, y_range_filter) .* filter;
            
            % Take sumation of weighted matrix for output
            output(i - padding_size(1), j - padding_size(2)) = sum(sum(weighted));
        end
    end
    
    output = uint8(output);
end

