% handles.output = hObject;  
imaqhwinfo('winvideo');    
vid1 = videoinput('winvideo',1,'YUY2_640x480');%������ͷ���������Ϣ���幫�ñ�����������ı�����  
  
  
% handles.vid1 = vid1;  
  
  
faceDetector = vision.CascadeObjectDetector();%������������������  
faceDetector.MinSize = [50 30];  
faceDetector.MaxSize = [200 200];  
faceDetector.MergeThreshold = 10;  
  
  
% handles.faceDetector = faceDetector;%���ñ�������Ϊ���ñ�����������ı�����  
  
  
% Update handles structure  
% guidata(hObject, handles);  
  
  
% UIWAIT makes CameraRead wait for user response (see UIRESUME)  
% uiwait(handles.figure1);  

% varargout{1} = handles.output;  
  
%����ĳ�Ա���������ֲ�������    
usbVidRes1=get(vid1,'videoResolution');    
nBands1=get(vid1,'NumberOfBands');    
hImage1=imshow(zeros(usbVidRes1(2),usbVidRes1(1),nBands1));    
preview(vid1,hImage1);    


  
  
while (1)    
    frame=getsnapshot(vid1);    
    tempFrame=rgb2gray(frame);  
    videoFrame = imresize(tempFrame,[240,320]);  
    %--------------------------------------------------------------------------  
    % Create a cascade detector object.  
    bbox = step(faceDetector, videoFrame);  
    imshow(videoFrame); hold on   
    for i = 1:size(bbox,1)    
        bbox(i,1) = bbox(i,1) + 10;  
        bbox(i,3) = bbox(i,3) - 20;  
        bbox(i,4) = bbox(i,4) + 10;  
        rectangle('Position',bbox(i,:),'LineWidth',3,'LineStyle','-','EdgeColor','m');    
    end   
end  
  
  
  

