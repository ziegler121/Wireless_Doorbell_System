function varargout = wireless_bell_app(varargin)
% WIRELESS_BELL_APP MATLAB code for wireless_bell_app.fig
%      WIRELESS_BELL_APP, by itself, creates a new WIRELESS_BELL_APP or raises the existing
%      singleton*.
%
%      H = WIRELESS_BELL_APP returns the handle to a new WIRELESS_BELL_APP or the handle to
%      the existing singleton*.
%
%      WIRELESS_BELL_APP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WIRELESS_BELL_APP.M with the given input arguments.
%
%      WIRELESS_BELL_APP('Property','Value',...) creates a new WIRELESS_BELL_APP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before wireless_bell_app_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to wireless_bell_app_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help wireless_bell_app

% Last Modified by GUIDE v2.5 30-Aug-2022 21:29:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wireless_bell_app_OpeningFcn, ...
                   'gui_OutputFcn',  @wireless_bell_app_OutputFcn, ...
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


% --- Executes just before wireless_bell_app is made visible.
function wireless_bell_app_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to wireless_bell_app (see VARARGIN)

% Choose default command line output for wireless_bell_app
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes wireless_bell_app wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = wireless_bell_app_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
clear all;
global bt;
instrhwinfo('Bluetooth', 'HC-05');
bt = Bluetooth('HC-05', 1);
fopen(bt);


% --- Executes on button press in playmusic1.
function playmusic1_Callback(hObject, eventdata, handles)
% hObject    handle to playmusic1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global bt;
fwrite(bt, 0)

% --- Executes on button press in playmusic2.
function playmusic2_Callback(hObject, eventdata, handles)
% hObject    handle to playmusic2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global bt;
fwrite(bt, 1)

% --- Executes on button press in playmusic3.
function playmusic3_Callback(hObject, eventdata, handles)
% hObject    handle to playmusic3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global bt;
fwrite(bt, 2)

% --- Executes on button press in playmusic4.
function playmusic4_Callback(hObject, eventdata, handles)
% hObject    handle to playmusic4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global bt;
fwrite(bt, 3)


% --- Executes on button press in doorOpen.
function doorOpen_Callback(hObject, eventdata, handles)
% hObject    handle to doorOpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global bt;
fwrite(bt, 4)

% --- Executes on button press in doorClose.
function doorClose_Callback(hObject, eventdata, handles)
% hObject    handle to doorClose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global bt;
fwrite(bt, 5)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
imshow('C:\Users\Jeff\Desktop\Year_3\digital_communication\matlab_stuff\project_folder\arduino_stuff\bg_img3.jpg');
