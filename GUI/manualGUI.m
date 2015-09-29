function varargout = manualGUI(varargin)
% MANUALGUI MATLAB code for manualGUI.fig
%      MANUALGUI, by itself, creates a new MANUALGUI or raises the existing
%      singleton*.
%
%      H = MANUALGUI returns the handle to a new MANUALGUI or the handle to
%      the existing singleton*.
%
%      MANUALGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MANUALGUI.M with the given input arguments.
%
%      MANUALGUI('Property','Value',...) creates a new MANUALGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before manualGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to manualGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help manualGUI

% Last Modified by GUIDE v2.5 17-Aug-2015 14:30:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @manualGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @manualGUI_OutputFcn, ...
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


% --- Executes just before manualGUI is made visible.
function manualGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to manualGUI (see VARARGIN)

% Choose default command line output for manualGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global jSpeed;
jSpeed = zeros([7, 1]);
global jAngle;
jAngle = zeros([7, 1]);

% UIWAIT makes manualGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = manualGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function j1speed_Callback(hObject, eventdata, handles)
% hObject    handle to j1speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j1speed as text
%        str2double(get(hObject,'String')) returns contents of j1speed as a double
global jSpeed
jSpeed(1) = str2double(get(hObject,'String'));
if(jSpeed(1) > 114)
    disp('Value must be smaller or equal than 114 RPM');
    jSpeed(1) = 114;
elseif(jSpeed(1) < 0)
    disp('Value must be greater or equal than 0 RPM');
    jSpeed(1) = 0;
end

% --- Executes during object creation, after setting all properties.
function j1speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j1speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j2speed_Callback(hObject, eventdata, handles)
% hObject    handle to j2speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j2speed as text
%        str2double(get(hObject,'String')) returns contents of j2speed as a double
global jSpeed
jSpeed(2) = str2double(get(hObject,'String'));
if(jSpeed(2) > 114)
    disp('Value must be smaller or equal than 114 RPM');
    jSpeed(2) = 114;
elseif(jSpeed(2) < 0)
    disp('Value must be greater or equal than 0 RPM');
    jSpeed(2) = 0;
end

% --- Executes during object creation, after setting all properties.
function j2speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j2speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j3speed_Callback(hObject, eventdata, handles)
% hObject    handle to j3speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j3speed as text
%        str2double(get(hObject,'String')) returns contents of j3speed as a double
global jSpeed
jSpeed(3) = str2double(get(hObject,'String'));
if(jSpeed(3) > 114)
    disp('Value must be smaller or equal than 114 RPM');
    jSpeed(3) = 114;
elseif(jSpeed(3) < 0)
    disp('Value must be greater or equal than 0 RPM');
    jSpeed(3) = 0;
end

% --- Executes during object creation, after setting all properties.
function j3speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j3speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j4speed_Callback(hObject, eventdata, handles)
% hObject    handle to j4speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j4speed as text
%        str2double(get(hObject,'String')) returns contents of j4speed as a double
global jSpeed
jSpeed(4) = str2double(get(hObject,'String'));
if(jSpeed(4) > 114)
    disp('Value must be smaller or equal than 114 RPM');
    jSpeed(4) = 114;
elseif(jSpeed(4) < 0)
    disp('Value must be greater or equal than 0 RPM');
    jSpeed(4) = 0;
end

% --- Executes during object creation, after setting all properties.
function j4speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j4speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j5speed_Callback(hObject, eventdata, handles)
% hObject    handle to j5speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j5speed as text
%        str2double(get(hObject,'String')) returns contents of j5speed as a double
global jSpeed
jSpeed(5) = str2double(get(hObject,'String'));
if(jSpeed(5) > 114)
    disp('Value must be smaller or equal than 114 RPM');
    jSpeed(5) = 114;
elseif(jSpeed(5) < 0)
    disp('Value must be greater or equal than 0 RPM');
    jSpeed(5) = 0;
end

% --- Executes during object creation, after setting all properties.
function j5speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j5speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j6speed_Callback(hObject, eventdata, handles)
% hObject    handle to j6speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j6speed as text
%        str2double(get(hObject,'String')) returns contents of j6speed as a double
global jSpeed
jSpeed(6) = str2double(get(hObject,'String'));
if(jSpeed(6) > 114)
    disp('Value must be smaller or equal than 114 RPM');
    jSpeed(6) = 114;
elseif(jSpeed(6) < 0)
    disp('Value must be greater or equal than 0 RPM');
    jSpeed(6) = 0;
end

% --- Executes during object creation, after setting all properties.
function j6speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j6speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j7speed_Callback(hObject, eventdata, handles)
% hObject    handle to j7speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j7speed as text
%        str2double(get(hObject,'String')) returns contents of j7speed as a double
global jSpeed
jSpeed(7) = str2double(get(hObject,'String'));
if(jSpeed(7) > 114)
    disp('Value must be smaller or equal than 114 RPM');
    jSpeed(7) = 114;
elseif(jSpeed(7) < 0)
    disp('Value must be greater or equal than 0 RPM');
    jSpeed(7) = 0;
end

% --- Executes during object creation, after setting all properties.
function j7speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j7speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j1angle_Callback(hObject, eventdata, handles)
% hObject    handle to j1angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j1angle as text
%        str2double(get(hObject,'String')) returns contents of j1angle as a double
global jAngle
jAngle(1) = str2double(get(hObject,'String'));
if(jAngle(1) > 300)
    disp('Value must be smaller or equal than 300 Deg');
    jAngle(1) = 300;
elseif(jAngle(1) < 0)
    disp('Value must be greater or equal than 0 Deg');
    jAngle(1) = 0;
end

% --- Executes during object creation, after setting all properties.
function j1angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j1angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j2angle_Callback(hObject, eventdata, handles)
% hObject    handle to j2angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j2angle as text
%        str2double(get(hObject,'String')) returns contents of j2angle as a double
global jAngle
jAngle(2) = str2double(get(hObject,'String'));
if(jAngle(2) > 300)
    disp('Value must be smaller or equal than 300 Deg');
    jAngle(2) = 300;
elseif(jAngle(2) < 0)
    disp('Value must be greater or equal than 0 Deg');
    jAngle(2) = 0;
end

% --- Executes during object creation, after setting all properties.
function j2angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j2angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j3angle_Callback(hObject, eventdata, handles)
% hObject    handle to j3angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j3angle as text
%        str2double(get(hObject,'String')) returns contents of j3angle as a double
global jAngle
jAngle(3) = str2double(get(hObject,'String'));
if(jAngle(3) > 300)
    disp('Value must be smaller or equal than 300 Deg');
    jAngle(3) = 300;
elseif(jAngle(3) < 0)
    disp('Value must be greater or equal than 0 Deg');
    jAngle(3) = 0;
end

% --- Executes during object creation, after setting all properties.
function j3angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j3angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j4angle_Callback(hObject, eventdata, handles)
% hObject    handle to j4angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j4angle as text
%        str2double(get(hObject,'String')) returns contents of j4angle as a double
global jAngle
jAngle(4) = str2double(get(hObject,'String'));
if(jAngle(4) > 300)
    disp('Value must be smaller or equal than 300 Deg');
    jAngle(4) = 300;
elseif(jAngle(4) < 0)
    disp('Value must be greater or equal than 0 Deg');
    jAngle(4) = 0;
end

% --- Executes during object creation, after setting all properties.
function j4angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j4angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j5angle_Callback(hObject, eventdata, handles)
% hObject    handle to j5angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j5angle as text
%        str2double(get(hObject,'String')) returns contents of j5angle as a double
global jAngle
jAngle(5) = str2double(get(hObject,'String'));
if(jAngle(5) > 300)
    disp('Value must be smaller or equal than 300 Deg');
    jAngle(5) = 300;
elseif(jAngle(5) < 0)
    disp('Value must be greater or equal than 0 Deg');
    jAngle(5) = 0;
end

% --- Executes during object creation, after setting all properties.
function j5angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j5angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j6angle_Callback(hObject, eventdata, handles)
% hObject    handle to j6angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j6angle as text
%        str2double(get(hObject,'String')) returns contents of j6angle as a double
global jAngle
jAngle(6) = str2double(get(hObject,'String'));
if(jAngle(6) > 300)
    disp('Value must be smaller or equal than 300 Deg');
    jAngle(6) = 300;
elseif(jAngle(6) < 0)
    disp('Value must be greater or equal than 0 Deg');
    jAngle(6) = 0;
end

% --- Executes during object creation, after setting all properties.
function j6angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j6angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function j7angle_Callback(hObject, eventdata, handles)
% hObject    handle to j7angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of j7angle as text
%        str2double(get(hObject,'String')) returns contents of j7angle as a double
global jAngle
jAngle(7) = str2double(get(hObject,'String'));
if(jAngle(7) > 300)
    disp('Value must be smaller or equal than 300 Deg');
    jAngle(7) = 300;
elseif(jAngle(7) < 0)
    disp('Value must be greater or equal than 0 Deg');
    jAngle(7) = 0;
end

% --- Executes during object creation, after setting all properties.
function j7angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to j7angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in goToPos.
function goToPos_Callback(hObject, eventdata, handles)
% hObject    handle to goToPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global jSpeed
global jAngle
% Sets motors speed
syncRobotSpeeds(jSpeed);
% Sends desired angles information
syncRobotAngles(jAngle);
global updateRobotStatus
updateRobotStatus();


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Close Device if library is loaded.
if(libisloaded('dynamixel'))
    calllib('dynamixel','dxl_terminate');  
    unloadlibrary('dynamixel');
end
delete(manualGUI);


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
menuGUI();
delete(manualGUI);
