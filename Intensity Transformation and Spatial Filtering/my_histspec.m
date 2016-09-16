function [ output ] = my_histspec( input, pdf_z )
%MY_HISTSPEC Summary of this function goes here
%   Detailed explanation goes here

    maxIntensity = 255;
    numPixels = size(input(:),1);
    
    s = hist(input(:),0:maxIntensity);
    s_cdf = cumsum(s) / numPixels;
    z_cdf = cumsum(pdf_z);
    
    lookup = zeros(size(z_cdf,2),1);
    
%     for i = 0:maxIntensity
        for j = 0:maxIntensity
            for k = 0:maxIntensity
                if s_cdf(j+1) > z_cdf(k+1)
                    lookup(j+1) = k;
                end
            end
        end
%     end
    
    output = uint8(lookup(input));
    
end

