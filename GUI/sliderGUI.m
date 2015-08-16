function varargout = sliderGUI(varargin)
% sliderGUI MATLAB code for sliderGUI.fig
%      sliderGUI, by itself, creates a new sliderGUI or raises the existing
%      singleton*.
%
%      H = sliderGUI returns the handle to a new sliderGUI or the handle to
%      the existing singleton*.
%
%      sliderGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in sliderGUI.M with the given input arguments.
%
%      sliderGUI('Property','Value',...) creates a new sliderGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the sliderGUI before sliderGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sliderGUI_OpeningFcn via varargin.
%
%      *See sliderGUI Options on GUIDE's Tools menu.  Choose "sliderGUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sliderGUI

% Last Modified by GUIDE v2.5 15-Aug-2015 19:08:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sliderGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @sliderGUI_OutputFcn, ...
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


% --- Executes just before sliderGUI is made visible.
function sliderGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sliderGUI (see VARARGIN)

% Choose default command line output for sliderGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sliderGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sliderGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Joint 1 slider callback
% --- Executes on slider movement.
function j1angle_Callback(hObject, eventdata, handles)
% hObject    handle to j1angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
j1angle = get(hObject,'Value');
setJointAngle(j1angle, 1);


% --- Executes during object creation, after setting all properties.
function j1angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j1angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% Joint 2 slider callback
% --- Executes on slider movement.
function j2angle_Callback(hObject, eventdata, handles)
% hObject    handle to j2angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
j2angle = get(hObject,'Value');
%setJointAngle(j2angle, 2);

% --- Executes during object creation, after setting all properties.
function j2angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j2angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% Joint 3 slider callback
% --- Executes on slider movement.
function j3angle_Callback(hObject, eventdata, handles)
% hObject    handle to j3angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
j3angle = get(hObject,'Value');
%setJointAngle(j3angle, 3);

% --- Executes during object creation, after setting all properties.
function j3angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j3angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% Joint 4 slider callback
% --- Executes on slider movement.
function j4angle_Callback(hObject, eventdata, handles)
% hObject    handle to j4angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
j4angle = get(hObject,'Value');
%setJointAngle(j4angle, 4);

% --- Executes during object creation, after setting all properties.
function j4angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j4angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% Joint 5 slider callback
% --- Executes on slider movement.
function j5angle_Callback(hObject, eventdata, handles)
% hObject    handle to j5angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
j5angle = get(hObject,'Value');
%setJointAngle(j5angle, 5);

% --- Executes during object creation, after setting all properties.
function j5angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j5angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% Joint 6 slider callback
% --- Executes on slider movement.
function j6angle_Callback(hObject, eventdata, handles)
% hObject    handle to j6angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
j6angle = get(hObject,'Value');
%setJointAngle(j6angle, 6);

% --- Executes during object creation, after setting all properties.
function j6angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j6angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% Joint 7 slider callback
% --- Executes on slider movement.
function j7angle_Callback(hObject, eventdata, handles)
% hObject    handle to j7angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
j7angle = get(hObject,'Value');
%setJointAngle(j7angle, 7);

% --- Executes during object creation, after setting all properties.
function j7angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j7angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function j1speed_Callback(hObject, eventdata, handles)
% hObject    handle to j1speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
j1speed = get(hObject,'Value');
setJointSpeed(j1speed, 1);

% --- Executes during object creation, after setting all properties.
function j1speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j1speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function j2speed_Callback(hObject, eventdata, handles)
% hObject    handle to j2speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
j2speed = get(hObject,'Value');
%setJointSpeed(j2speed, 2);

% --- Executes during object creation, after setting all properties.
function j2speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j2speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function j3speed_Callback(hObject, eventdata, handles)
% hObject    handle to j3speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
j3speed = get(hObject,'Value');
%setJointSpeed(j3speed, 3);

% --- Executes during object creation, after setting all properties.
function j3speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j3speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function j4speed_Callback(hObject, eventdata, handles)
% hObject    handle to j4speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
j4speed = get(hObject,'Value');
%setJointSpeed(j4speed, 4);

% --- Executes during object creation, after setting all properties.
function j4speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j4speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function j5speed_Callback(hObject, eventdata, handles)
% hObject    handle to j5speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
j5speed = get(hObject,'Value');
setJointSpeed(j5speed, 5);

% --- Executes during object creation, after setting all properties.
function j5speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j5speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function j6speed_Callback(hObject, eventdata, handles)
% hObject    handle to j6speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
j6speed = get(hObject,'Value');
%setJointSpeed(j6speed, 6);

% --- Executes during object creation, after setting all properties.
function j6speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j6speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function j7speed_Callback(hObject, eventdata, handles)
% hObject    handle to j7speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
j7speed = get(hObject,'Value');
%setJointSpeed(j7speed, 7);

% --- Executes during object creation, after setting all properties.
function j7speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j7speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(sliderGUI);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)