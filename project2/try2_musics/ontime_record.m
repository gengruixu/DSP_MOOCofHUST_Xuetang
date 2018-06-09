function varargout = ontime_record(varargin)
% ONTIME_RECORD MATLAB code for ontime_record.fig
%      ONTIME_RECORD, by itself, creates a new ONTIME_RECORD or raises the existing
%      singleton*.
%
%      H = ONTIME_RECORD returns the handle to a new ONTIME_RECORD or the handle to
%      the existing singleton*.
%
%      ONTIME_RECORD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ONTIME_RECORD.M with the given input arguments.
%
%      ONTIME_RECORD('Property','Value',...) creates a new ONTIME_RECORD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ontime_record_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ontime_record_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ontime_record

% Last Modified by GUIDE v2.5 03-May-2017 14:43:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ontime_record_OpeningFcn, ...
                   'gui_OutputFcn',  @ontime_record_OutputFcn, ...
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


% --- Executes just before ontime_record is made visible.
function ontime_record_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ontime_record (see VARARGIN)
setappdata(gcf,'isrecording',0)
% Choose default command line output for ontime_record
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ontime_record wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ontime_record_OutputFcn(hObject, eventdata, handles) 
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
isrecording=getappdata(gcf,'isrecording');
if ~isrecording
setappdata(gcf,'isrecording',1);
recorder(gcf,handles);
else
setappdata(gcf,'isrecording',0);
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ad fs yp y ;
y=getappdata(gcf,'sounds');
fs=10000;
ad=analogoutput('winsound');%建立以声卡作为输入输出对象
addchannel(ad,1);
set(ad,'samplerate',fs);
putdata(ad,y);
handles.ad=ad;
guidata(hObject, handles);%更新图形句柄
start(ad);
T=clock;
pause(0.1);
while isrunning(ad)
T1=clock;
time=T1-T;%计算时间差
s=3600*time(4)+60*time(5)+time(6);
if(round(s*fs+5000)<length(y))
yp=y(round(s*fs):round(s*fs+5000));%round函数取距离最近的整数
plot(handles.axes1,yp);
set(handles.axes1,'ylim',[-1 1],'xlim',[0 5000]);
y1=fft(yp,2048);
f=fs*(0:1023)/2048;
bar(handles.axes2,f,abs(y1(1:1024)),0.8,'g') %做原始语音信号的FFT频谱图
set(handles.axes2,'ylim',[0 10],'xlim',[100 250]);%设置handles.axes2的横纵坐标范围
drawnow;
end
end

function aa= recorder(cf,handles)
%RECORDER Summary of this function goes here
% Detailed explanation goes here
% h=figure(soundrec);

h=cf;
thehandles=handles;
setappdata(h,'isrecording',1);

Ai = audiorecorder ( 11025, 16, 2 ,1); % 创建一个模拟信号输入对象
% 添加通道
addchannel(Ai,1);
Ai.SampleRate=10000; % 采样频率
Ai.SamplesPerTrigger=Inf; % 采样数

 

start(Ai); % 开启采样
warning off % 当采样数据不够时，取消警告
while isrunning(Ai) % 检查对象是否仍在运行
if getappdata(h,'isrecording')
data=peekdata(Ai,Ai.SampleRate/2);% 获取对象中的最后Ai.SampleRate个采样数据
plot(thehandles.axes1,data) % 绘制最后Ai.SampleRate个采样数据的图形，因此表现出来就是实时的了
set(handles.axes1,'ylim',[-1 1],'xlim',[0 5000]);
y1=fft(data,2048); %对信号做2048点FFT变换
f=Ai.SampleRate*(0:1023)/2048;
bar(handles.axes2,f,abs(y1(1:1024)),0.8,'g') %做原始语音信号的FFT频谱图
set(handles.axes2,'ylim',[0 10],'xlim',[100 250]);%设置handles.axes2的横纵坐标范围
drawnow; % 刷新图像
else
stop(Ai);
num=get(Ai,'SamplesAvailable');
aa=getdata(Ai,num);
axes(thehandles.axes1);
plot(thehandles.axes1,aa) % 绘制所有采样数据的图形

y1=fft(data,2048); %对信号做2048点FFT变换
f=Ai.SampleRate*(0:1023)/2048;
bar(handles.axes2,f,abs(y1(1:1024)),0.8,'g') %做原始语音信号的FFT频谱图
drawnow; % 刷新图像
setappdata(h,'sounds',aa);
end
end

