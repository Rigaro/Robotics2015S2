function varargout = iKineGUI(varargin)
% IKINEGUI MATLAB code for iKineGUI.fig
%      IKINEGUI, by itself, creates a new IKINEGUI or raises the existing
%      singleton*.
%
%      H = IKINEGUI returns the handle to a new IKINEGUI or the handle to
%      the existing singleton*.
%
%      IKINEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IKINEGUI.M with the given input arguments.
%
%      IKINEGUI('Property','Value',...) creates a new IKINEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before iKineGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to iKineGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help iKineGUI

% Last Modified by GUIDE v2.5 01-Sep-2015 19:13:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @iKineGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @iKineGUI_OutputFcn, ...
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


% --- Executes just before iKineGUI is made visible.
function iKineGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to iKineGUI (see VARARGIN)

% Choose default command line output for iKineGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global desLoc;
desLoc = [0; 0; 0.321; 0 ; 0; 1];
global desSpeed;
desSpeed = [3;3;3;3;3;3;3];

% UIWAIT makes iKineGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = iKineGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function xPos_Callback(hObject, eventdata, handles)
% hObject    handle to xPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xPos as text
%        str2double(get(hObject,'String')) returns contents of xPos as a double
global desLoc
desLoc(1) = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function xPos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yPos_Callback(hObject, eventdata, handles)
% hObject    handle to yPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yPos as text
%        str2double(get(hObject,'String')) returns contents of yPos as a double
global desLoc
desLoc(2) = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function yPos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zPos_Callback(hObject, eventdata, handles)
% hObject    handle to zPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zPos as text
%        str2double(get(hObject,'String')) returns contents of zPos as a double
global desLoc
desLoc(3) = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function zPos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function aOri_Callback(hObject, eventdata, handles)
% hObject    handle to aOri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aOri as text
%        str2double(get(hObject,'String')) returns contents of aOri as a double
global desLoc
desLoc(4) = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function aOri_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aOri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bOri_Callback(hObject, eventdata, handles)
% hObject    handle to bOri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bOri as text
%        str2double(get(hObject,'String')) returns contents of bOri as a double
global desLoc
desLoc(5) = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function bOri_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bOri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cOri_Callback(hObject, eventdata, handles)
% hObject    handle to cOri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cOri as text
%        str2double(get(hObject,'String')) returns contents of cOri as a double
global desLoc
desLoc(6) = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function cOri_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cOri (see GCBO)
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
global desSpeed
global desLoc
%moveJ
moveJ(desLoc,desSpeed);


% --- Executes on slider movement.
function desSpeed_Callback(hObject, eventdata, handles)
% hObject    handle to desSpeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global desSpeed;
temp = get(hObject,'Value');
desSpeed = [temp;temp;temp;temp;temp;temp;temp];

% --- Executes during object creation, after setting all properties.
function desSpeed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to desSpeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
menuGUI();
delete(iKineGUI);

% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(iKineGUI);
