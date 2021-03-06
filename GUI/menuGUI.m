function varargout = menuGUI(varargin)
% MENUGUI MATLAB code for menuGUI.fig
%      MENUGUI, by itself, creates a new MENUGUI or raises the existing
%      singleton*.
%
%      H = MENUGUI returns the handle to a new MENUGUI or the handle to
%      the existing singleton*.
%
%      MENUGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENUGUI.M with the given input arguments.
%
%      MENUGUI('Property','Value',...) creates a new MENUGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before menuGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to menuGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help menuGUI

% Last Modified by GUIDE v2.5 14-Sep-2015 18:27:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @menuGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @menuGUI_OutputFcn, ...
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


% --- Executes just before menuGUI is made visible.
function menuGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to menuGUI (see VARARGIN)

% Choose default command line output for menuGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes menuGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = menuGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in sliderDemo.
function sliderDemo_Callback(hObject, eventdata, handles)
% hObject    handle to sliderDemo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sliderGUI();
delete(menuGUI);


% --- Executes on button press in manualDemo.
function manualDemo_Callback(hObject, eventdata, handles)
% hObject    handle to manualDemo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
manualGUI();
delete(menuGUI);


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Close Device if library is loaded.
if(libisloaded('dynamixel'))
    calllib('dynamixel','dxl_terminate');  
    unloadlibrary('dynamixel');
end
delete(menuGUI);


% --- Executes on button press in pathDemo.
function pathDemo_Callback(hObject, eventdata, handles)
% hObject    handle to pathDemo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Launches demo only if robot window is available, otherwise 
% relaunches robotGUI
figValid = isvalid(robotFig);
if (figValid ~= 0)
    inverse_kinematics_demo();
else
    robotGUI
end


% --- Executes on button press in iKineDemo.
function iKineDemo_Callback(hObject, eventdata, handles)
% hObject    handle to iKineDemo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
iKineGUI();
delete(menuGUI);


% --- Executes on button press in plan.
function plan_Callback(hObject, eventdata, handles)
% hObject    handle to plan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pathGUI();
delete(menuGUI);