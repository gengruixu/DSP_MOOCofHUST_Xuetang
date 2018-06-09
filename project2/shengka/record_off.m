function record_off(obj,event,lineinput)
    d = getaudiodata(lineinput, 'double');
    disp(['number of points recorded:',num2str(length(d))]); % 
end