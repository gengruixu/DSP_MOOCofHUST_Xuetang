function varargout = facedetect(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @facedetect_OpeningFcn, ...
    'gui_OutputFcn',  @facedetect_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% --- Executes just before facedetect is made visible.
function facedetect_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
% Update handles structure
global vid;
vid=-1;
guidata(hObject, handles);
% --- Outputs from this function are returned to the command line.
function varargout = facedetect_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;
% --- Executes during object creation, after setting all properties.
function axespreview_CreateFcn(hObject, eventdata, handles)
set(hObject,'xTick',[]);
set(hObject,'ytick',[]);
set(hObject,'box','on');
% --- Executes during object creation, after setting all properties.
function axesshow_CreateFcn(hObject, eventdata, handles)
set(hObject,'xTick',[]);
set(hObject,'ytick',[]);
set(hObject,'box','on');
% --- Executes on button press in pushbutton_preview.
function pushbutton_preview_Callback(hObject, eventdata, handles)
global vid;
vid=videoinput('winvideo',1,'YUY2_640x480');
set(vid,'TriggerRepeat',Inf);
set(vid,'FramesPerTrigger',1);
set(vid,'FrameGrabInterval',1);
set(vid,'ReturnedColorSpace','rgb'); %'rgb'即返回为彩色的图像
vidRes=get(vid,'VideoResolution');
nBands=get(vid,'NumberOfBands');
axes(handles.axespreview);
hImage=image(zeros(vidRes(2),vidRes(1),nBands));
preview(vid,hImage);
% --- Executes on button press in pushbutton_facedetect.
function pushbutton_facedetect_Callback(hObject, eventdata, handles)
global vid jieshu;
jieshu=1;
faceDetector = vision.CascadeObjectDetector();
hvp=vision.VideoPlayer('WindowCaption','face detect system','WindowPosition',[100,100,640,480]);
hcsc=vision.ColorSpaceConverter;
hcsc.Conversion='RGB to YCbCr';
hsi  = vision.ShapeInserter('BorderColor','Custom','CustomBorderColor',[255 255 0]);
% hsi=vision.ShapeInserter('Shape','Rectangles', 'BorderColor','Custom','CustomBorderColor',[255,0 0]);
while jieshu
    frame=getsnapshot(vid);
    frame1=im2double(frame);
%     Pts=[round(xmin) round(ymin) round(height-100) round(width)];
    Pts= step(faceDetector, frame1);
    frame=step(hsi,frame1,Pts);
    step(hvp,frame);
end
close(hvp);

% --- Executes on button press in pushbutton_exit.
function pushbutton_exit_Callback(hObject, eventdata, handles)
global vid
if vid ~= -1
    delete(vid);
end;
clear;close all
% --- Executes on button press in pushbutton_stopdetect.
function pushbutton_stopdetect_Callback(hObject, eventdata, handles)
global jieshu;
jieshu=0;
% --- Executes during object creation, after setting all properties.
function axes_copyright_CreateFcn(hObject, eventdata, handles)
I=imread('uestc.jpg');
imshow(I);
