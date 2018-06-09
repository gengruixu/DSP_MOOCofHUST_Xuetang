function varargout = untitled1(varargin)
% untitled1 MATLAB code for untitled1.fig
%      untitled1, by itself, creates a new untitled1 or raises the existing
%      singleton*.
%
%      H = untitled1 returns the handle to a new untitled1 or the handle to
%      the existing singleton*.
%
%      untitled1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in untitled1.M with the given input arguments.
%
%      untitled1('Property','Value',...) creates a new untitled1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled1

% Last Modified by GUIDE v2.5 20-Apr-2017 19:36:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled1 is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled1 (see VARARGIN)
global Fs
global T

hold on



% Choose default command line output for untitled1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
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
% global Fs
% global T
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*247*t);
plot(t,x);
axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(1);
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global Fs
% global T
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt
t = linspace(0, T, N);
x = 0.3*sin(2*pi*262*t);
plot(t,x);
axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(1);
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global Fs
% global T
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt
t = linspace(0, T, N);
x = 0.3*sin(2*pi*294*t);
plot(t,x);
axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs)
play(p)
pause(1);
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global Fs
% global T
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt
t = linspace(0, T, N);
x = 0.3*sin(2*pi*330*t);
plot(t,x);
axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs)
play(p)
pause(1);
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global Fs
% global T
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt
t = linspace(0, T, N);
x = 0.3*sin(2*pi*349*t);
plot(t,x);
axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs)
play(p)
pause(1);
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global Fs
% global T
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt
t = linspace(0, T, N);
x = 0.3*sin(2*pi*392*t);
plot(t,x);
axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs)
play(p)
pause(1);
% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global Fs
% global T
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt
t = linspace(0, T, N);
x = 0.3*sin(2*pi*440*t);
plot(t,x);
axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs)
play(p)
pause(1);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
