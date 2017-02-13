% Find template 2D
% NOTE: Function definition must be the very first piece of code here!
function [yIndex xIndex] = find_template_2D(template, img)
    % TODO: Find template in img and return [y x] location
    % NOTE: Turn off all output from inside the function before submitting!
    c=normxcorr2(template, img);
    [M,I] = max(c(:));
    [raw_yIndex raw_xIndex] = ind2sub(size(c),I);
    [template_y template_x]=size(template);
    yIndex=raw_yIndex-template_y+1;
    xIndex=raw_xIndex-template_x+1;
    
    
end