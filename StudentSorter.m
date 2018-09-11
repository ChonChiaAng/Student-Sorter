function varargout = StudentSorter(varargin)
% STUDENTSORTER MATLAB code for StudentSorter.fig
%      STUDENTSORTER, by itself, creates a new STUDENTSORTER or raises the existing
%      singleton*.
%
%      H = STUDENTSORTER returns the handle to a new STUDENTSORTER or the handle to
%      the existing singleton*.
%
%      STUDENTSORTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STUDENTSORTER.M with the given input arguments.
%
%      STUDENTSORTER('Property','Value',...) creates a new STUDENTSORTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before StudentSorter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to StudentSorter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help StudentSorter

% Last Modified by GUIDE v2.5 07-Sep-2018 12:18:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @StudentSorter_OpeningFcn, ...
                   'gui_OutputFcn',  @StudentSorter_OutputFcn, ...
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


% --- Executes just before StudentSorter is made visible.
function StudentSorter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to StudentSorter (see VARARGIN)

% Choose default command line output for StudentSorter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes StudentSorter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = StudentSorter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles) %Reset Button
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.text3, 'String', '')
set(handles.text23, 'String','')
set(handles.text24, 'String', '')
set(handles.text25, 'String', '')
set(handles.text26, 'String', '')
set(handles.text27, 'String', '')
set(handles.text28, 'String','')
set(handles.text29, 'String', '')
set(handles.text30, 'String','')
set(handles.text31, 'String', '')


set(handles.edit1, 'Strings', 'Insert Filename') 
set(handles.edit2, 'Strings', 'Insert Filename') 
set(handles.edit3, 'Strings', 'Insert Sheetname') 

set(handles.text20, 'Strings', 'All Systems have been cleared') 

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename=get(handles.edit1, 'String')
sheet=get(handles.edit3, 'String')
[num,A,raw]=xlsread(filename,sheet) 

[R,C]=size(A) %Specifying Matrix Size

A=(A(3:R,1)) %Converts file matrix to a row of numbers

[R,C]=size(A) %Specifying New Matrix Size

%begin setting students into groups of 3 
%Starting at Row 3 and Column 1

if rem(R,3)~=0
    GRow=R
else
    GRow=R+1
end

Slip=1

ChosenNumber=randperm(R)

for i=1:R   
C=i    % specifying selected column for 1st group

if i>3 && rem(i,3)==1 %Spliting Selected People into 3 Columns
    C=1
elseif i>3 && rem(i,3)==2
    C=2
elseif i>3 && rem(i,3)==0
    C=3
end
    
ChosenPerson=A(ChosenNumber(i),1)
Group(Slip,C)=ChosenPerson

if rem(i,3)==0
    Slip=Slip+1
end

end

A=(Group)
set(handles.text3, 'String', A(1:3))
set(handles.text23, 'String', A(4:6))
set(handles.text24, 'String', A(7:9))
set(handles.text25, 'String', A(10:12))
set(handles.text26, 'String', A(13:15))
set(handles.text27, 'String', A(16:18))
set(handles.text28, 'String', A(19:21))
set(handles.text29, 'String', A(22:24))
set(handles.text30, 'String', A(25:27))
set(handles.text31, 'String', A(28:30))



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
