function [ output ] = my_histspec( input, target_pdf )
%MY_HISTSPEC matches the inputs pdf to target_pdf and stores in output

    maxIntensity = 255;
    numPixels = size(input(:),1);
    
    s = hist(input(:),0:maxIntensity);
    s_cdf = cumsum(s) / numPixels;      % Calculate input cdf
    target_cdf = cumsum(target_pdf);    % Calculate target cdf
    
    % For storing a mapping from input to target
    lookup = zeros(size(target_cdf,2),1);
    
    % For each intensity in the input, find the corresponding location of
    % that intensity in the target
    for i = 0:maxIntensity
        for j = 0:maxIntensity
            if s_cdf(i+1) > target_cdf(j+1)
                lookup(i+1) = j;
            end
        end
    end

    % Use the mapping to convert the input image
    output = uint8(lookup(input));
end

