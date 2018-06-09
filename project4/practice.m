[FileName, PathName, filterindex] = uigetfile({'*.mp3'},'File Selector');
% set(handles.edit1,'String',FileName);
abc = fullfile(PathName, FileName);
INFO = audioinfo(abc )
INFO.TotalSamples