function varargout = video_processing(varargin)
% VIDEO_PROCESSING MATLAB code for video_processing.fig
%      VIDEO_PROCESSING, by itself, creates a new VIDEO_PROCESSING or raises the existing
%      singleton*.
%
%      H = VIDEO_PROCESSING returns the handle to a new VIDEO_PROCESSING or the handle to
%      the existing singleton*.
%
%      VIDEO_PROCESSING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIDEO_PROCESSING.M with the given input arguments.
%
%      VIDEO_PROCESSING('Property','Value',...) creates a new VIDEO_PROCESSING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before video_processing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to video_processing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help video_processing

% Last Modified by GUIDE v2.5 09-May-2017 12:43:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @video_processing_OpeningFcn, ...
                   'gui_OutputFcn',  @video_processing_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before video_processing is made visible.
function video_processing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to video_processing (see VARARGIN)

% Choose default command line output for video_processing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes video_processing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = video_processing_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid
vid = videoinput('winvideo',1,'YUY2_640x480');
set(vid,'ReturnedColorSpace','rgb');
vidRes = get(vid,'VideoResolution');
nBands = get(vid,'NumberOfBands');
hImage = image(zeros(vidRes(2),vidRes(1),nBands),'parent',handles.axes1);
preview(vid,hImage);
start(vid)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid
stop(vid);
closepreview(vid);
delete(vid);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid
global mypic
mypic = getsnapshot(vid);       %截取的彩色图像
axes(handles.axes1);
imshow(mypic);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mypic
global I1
I1 = rgb2gray(mypic);           %灰色图像
axes(handles.axes2);
imshow(I1);
axes(handles.axes3);
imhist(I1)

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
I2 = histeq(I1);
axes(handles.axes5);
imshow(I2);
axes(handles.axes4);
imhist(I2)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mypic
[FileName,PathName] = uigetfile('*.jpg','Select figure File');
path = strcat(PathName,FileName);
mypic = imread(path);
axes(handles.axes1);
imshow(mypic);


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function get_function(hObject, eventdata, handles)
global select_function
select_function = get(handles.popumenu1, 'value')


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 对灰度图像的操作
global select_function
global I1
global I2
select_function = get(handles.popupmenu1, 'value')
disp(select_function)

%% 均衡
if select_function == 2
        I2 = histeq(I1);
    axes(handles.axes5);
    imshow(I2);
    axes(handles.axes4);
    imhist(I2)
end

%% 边缘检测
if select_function == 3
    I2=edge(I1,'prewitt',0.05);  
    %以自动阈值选择法地图像进行Roberts算子检测
%     [I2,thresh1]=edge(I1,'roberts'); 
 %返回当前Roberts算子边缘检测的阈值
    axes(handles.axes5);
    imshow(I2);
    axes(handles.axes4);
    imhist(I2)
end

%% 动态边缘检测
if select_function == 4
    i = 0.45
    while(i>0)
        I2=edge(I1,'prewitt',i);  
        %以自动阈值选择法地图像进行Roberts算子检测
        %     [I2,thresh1]=edge(I1,'roberts'); 
        %返回当前Roberts算子边缘检测的阈值
        axes(handles.axes5);
        imshow(I2);
        title(['K:',num2str(i)]);
        axes(handles.axes4);
        imhist(I2)
        i = i - 0.003
        pause(0.01)
    end
end

%% 动态模糊处理
if select_function == 5
    H = fspecial('motion',20,45);
    I2 = imfilter(I1,H,'replicate');
    axes(handles.axes5); 
    imshow(I2);
    xlabel('动态模糊图像');
    axes(handles.axes4);
    imhist(I2)
end

%% 模糊处理
if select_function == 6
    H = fspecial('disk',10);
    I2 = imfilter(I1,H,'replicate');
    axes(handles.axes5); 
    imshow(I2);
    xlabel('模糊图像');
    axes(handles.axes4);
    imhist(I2)
end

%% 黑白二值化
if select_function == 7
    level=graythresh(I1);                     % 设置黑白转换阈值
    I2=im2bw(I1,level);                       % 将图像转换为黑白图像
    % 根据上面直方图选择阈值150,划分图像的前景和背景
    axes(handles.axes5);
    imshow(I2); 
    xlabel('黑白二值化图像');  
    axes(handles.axes4);
    imhist(I2)
end

%% 膨胀图像
if select_function == 8
    se = strel('ball',5,5); %创建椭圆Strel对象
    I2=imdilate(I1,se);                       %膨胀图像
    axes(handles.axes5);
    imshow(I2); 
    xlabel('膨胀图像');  
    axes(handles.axes4);
    imhist(I2)
end

%% 腐蚀图像
if select_function == 9
    se = strel('ball',5,5); %创建椭圆Strel对象
    I2=imerode(I1,se);                       %膨胀图像
    axes(handles.axes5);
    imshow(I2); 
    xlabel('腐蚀图像');  
    axes(handles.axes4);
    imhist(I2)
end

%% 腐蚀图像
if select_function == 10
    I2 = bwmorph(I1,'skel',Inf);
    axes(handles.axes5);
    imshow(I2); 
    xlabel('分裂，骨架化');  
    axes(handles.axes4);
    imhist(I2)
end

%% 改变亮度
if select_function == 11
    im = 0.1
    while(im < 10)
        I2 = immultiply(I1, im);
        axes(handles.axes5);
        imshow(I2); 
        xlabel('改变亮度'); 
        title(['缩放系数',num2str(im)]);
        axes(handles.axes4);
        imhist(I2);
        pause(0.01)
        im = im+0.02;
    end
end

%% 动态调整图片亮度
if select_function == 12

end
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
global I2
I1 = I2;
axes(handles.axes2);
imshow(I1); 
axes(handles.axes3);
imhist(I1)

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
[f,p]=uiputfile({'*.jpg'},'保存文件');
str=strcat(p,f);
pix=getframe(handles.axes2);
imwrite(pix.cdata,str,'jpg')
