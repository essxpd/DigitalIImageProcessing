function [ output ] = my_histeq( input )
%my_histeq equalizes the histogram of the input image and maps it to an
%output image

    % Create a histogram from 0 to 255 to count the number of occurances of
    % each pixel intensity
    maxIntensity = 255;
    s = hist(input(:),0:maxIntensity);
    
    % Cumulative probability 
    cdf = cumsum(s / size(input(:),1));
    
    % Map input to output 
    output = cdf(input + 1) * maxIntensity;
    output = uint8(output);
end

