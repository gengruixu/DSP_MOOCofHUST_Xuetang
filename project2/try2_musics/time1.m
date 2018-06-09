function varargout = time1(varargin)
% TIME1 MATLAB code for time1.fig
%      TIME1, by itself, creates a new TIME1 or raises the existing
%      singleton*.
%
%      H = TIME1 returns the handle to a new TIME1 or the handle to
%      the existing singleton*.
%
%      TIME1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TIME1.M with the given input arguments.
%
%      TIME1('Property','Value',...) creates a new TIME1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before time1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to time1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help time1

% Last Modified by GUIDE v2.5 22-Apr-2017 10:48:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @time1_OpeningFcn, ...
                   'gui_OutputFcn',  @time1_OutputFcn, ...
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


% --- Executes just before time1 is made visible.
function time1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to time1 (see VARARGIN)
global mytimer;   global Z1;    global Z2;
%   Timer properties.
%     AveragePeriod    - Average number of seconds between TimerFcn executions.
%     BusyMode         - Action taken when TimerFcn executions are in progress.
%     ErrorFcn         - Callback function executed when an error occurs.
%     ExecutionMode    - Mode used to schedule timer events.
%     InstantPeriod    - Elapsed time between the last two TimerFcn executions. 
%     Name             - Descriptive name of the timer object.
%     Period           - Seconds between TimerFcn executions.
%     Running          - Timer object running status.
%     StartDelay       - Delay between START and the first scheduled TimerFcn execution.
%     StartFcn         - Callback function executed when timer object starts.
%     StopFcn          - Callback function executed after timer object stops.
%     Tag              - Label for object.
%     TasksExecuted    - Number of TimerFcn executions that have occurred.
%     TasksToExecute   - Number of times to execute the TimerFcn callback.
%     TimerFcn         - Callback function executed when a timer event occurs.
%     Type             - Object type.
%     UserData         - User data for timer object.
mytimer = timer('StartDelay',1,'Period',2,'TasksToExecute',150,'ExecutionMode','FixedRate', 'TimerFcn',{@my_callback_fcn,handles});      %创建定时器对象
% mytimer = timer('StartDelay',1,'Period',2,'TasksToExecute',150);
% mytimer.TimerFcn = {@my_callback_fcn}; %定时中断函数
Z1 = 0.1;       %初始化显示量程
Z2 = 0.1;       %初始化显示量程





% Choose default command line output for time1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes time1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = time1_OutputFcn(hObject, eventdata, handles) 
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
global mytimer
%  start Start timer(s) running.
%  
%      start(OBJ) starts the timer running, represented by the timer 
%      object, OBJ. If OBJ is an array of timer objects, start starts 
%      all the timers. Use the TIMER function to create a timer object.
start(mytimer);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mytimer
%   stop Stop timer(s).
%  
%      stop(OBJ) stops the timer, represented by the timer object, 
%      OBJ. If OBJ is an array of timer objects, stop stops all of
%      the timers. Use the TIMER function to create a timer object. 
stop(mytimer);

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v = get(handles.slider1,'Value');
global Z1
Z1 = 0.1*2*v;



% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v1 = get(handles.slider2,'Value');
global Z2
Z2 = 0.1*2*v1;
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function my_callback_fcn(hObject, eventdata, handles)
global Z1; global Z2;
Fs = 11025;
N = 8192;
filename = '1.mp3'
[y,Fs] = audioread(filename)
audiowrite('2.wav',y,Fs);
y = y';
y = y.*30
y = y(1,:)
audiowrite('3.wav',y,Fs);
% y = wavrecord(N, Fs);
y = y(N/2+1:N);
y = y';
N = 4096;
x = linspace(0,N,N);
plot(handles.axes1,x,y,'b','LineWidth',1.5);
% ylim(handles.axes1,[-Z1,Z1]);
grid(handles.axes1);
P = fft(y,N);
Pyy = 2 *sqrt(P.*conj(P))/N;
f = linspace(0,Fs/2,N/2);
plot(handles.axes2,f,Pyy(1:N/2),'b','LineWidth',1.5);
% ylim(handles.axes2,[0,0.1*Z2]);
grid(handles.axes2);
