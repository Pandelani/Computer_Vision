% Find template 1D
% NOTE: Function definition must be the very first piece of code here!
function index = find_template_1D(t,s)
    c = normxcorr2(t,s);
    disp([1:size(c,2);c]);
    [maxValue raw_Index] = max(c);
    index = raw_Index - size(t,2) + 1;
end
