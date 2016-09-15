function [ output ] = my_histspec( input, pdf_z )
%MY_HISTSPEC Summary of this function goes here
%   Detailed explanation goes here

    maxIntensity = 255;
%     s = hist(input(:),0:maxIntensity);
    
    % Cumulative probability 
    
    figure;
    bar(pdf_z);
    
    cdf = uint8(cumsum(pdf_z) * maxIntensity);
    
    figure;
    bar(cdf);
    
    output = cdf(input + 1);
end

