function varargout = exer2(varargin)
% EXER2 MATLAB code for exer2.fig
%      EXER2, by itself, creates a new EXER2 or raises the existing
%      singleton*.
%
%      H = EXER2 returns the handle to a new EXER2 or the handle to
%      the existing singleton*.
%
%      EXER2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXER2.M with the given input arguments.
%
%      EXER2('Property','Value',...) creates a new EXER2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before exer2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to exer2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help exer2

% Last Modified by GUIDE v2.5 07-May-2020 17:29:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @exer2_OpeningFcn, ...
                   'gui_OutputFcn',  @exer2_OutputFcn, ...
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


% --- Executes just before exer2 is made visible.
function exer2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to exer2 (see VARARGIN)

% Choose default command line output for exer2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes exer2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = exer2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function choques_Callback(hObject, eventdata, handles)
% hObject    handle to choques (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of choques as text
%        str2double(get(hObject,'String')) returns contents of choques as a double


% --- Executes during object creation, after setting all properties.
function choques_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choques (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x0_Callback(hObject, eventdata, handles)
% hObject    handle to x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0 as text
%        str2double(get(hObject,'String')) returns contents of x0 as a double


% --- Executes during object creation, after setting all properties.
function x0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y0_Callback(hObject, eventdata, handles)
% hObject    handle to y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y0 as text
%        str2double(get(hObject,'String')) returns contents of y0 as a double


% --- Executes during object creation, after setting all properties.
function y0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function alpha_Callback(hObject, eventdata, handles)
% hObject    handle to alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function alpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x0 = str2num(get(handles.x0,'string'));
y0 = str2num(get(handles.y0,'string'));
v0x=0; v0y=0; g=9.8;
alfa = get(handles.alpha,'value');
ti=0; t0=0.05; prec=1e-10; lambda=0.01;
nc = str2num(get(handles.choques,'string'));

metodo=handles.listbox1.Value;%1 newton -- 2 ponto fixo

tf=pfixo(lambda,t0, prec,x0,y0,v0x,v0y,alfa,g);

for i=1:nc
    % fazer animacao
    dt=tf/20;
    for t=ti:dt:tf
        x=v0x*t+x0; y=y0+v0y*t-0.5*g*t^2;
        vx=v0x; vy=v0y-g*t;
        superf(alfa,x,y,handles,hObject);
    end
    % fazer a colisãoo
    % direcao da normal
    grad=[2*alfa*x-4*x^3, 1];%o gradiente (x,y)
    grad=grad/norm(grad);
    hold on
    quiver(handles.axes1,x,y,grad(1),grad(2),0,'b');%vetor gradiente, perpendicular ao plano
    v=[vx;vy];%vetor velocidade no embate
    nv=norm(v);
    quiver(handles.axes1,x,y,vx/nv,vy/nv,0,'r')%desenha-se

    vn=grad * v;% componente segundo a normal
    vp=[grad(2),-grad(1)]*v; % componente segundo a tangente
    vn=-vn; % refletir segundo a normal
    v=vn*grad'+vp*[grad(2);-grad(1)]; %reconstruçao da velocidade

    vx=v(1); vy=v(2);
    nv=norm(v);
    quiver(handles.axes1,x,y,vx/nv,vy/nv,0,'k')
    hold(handles.axes1,'off') 
    title(handles.axes1,['colisão ' num2str(i)])
    pause(2) % a cada colisao
    % calcula o proximo instante de colisão
    x0=x; y0=y; v0x=v(1); v0y=v(2);
    
    if metodo == 1
        %tf=newton(t0, prec,x0,y0,v0x,v0y,alfa,g);
        tf=newton(tf, prec,x0,y0,v0x,v0y,alfa,g);
    else
        tf=pesquisa_grosseira(0, 0.01,x0,y0,v0x,v0y,alfa,g);
        tf=pfixo(lambda,tf, prec,x0,y0,v0x,v0y,alfa,g);
    end
end
% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function [dy,der]=dist(x0,y0,v0x,v0y,alfa,t,g)
    x=v0x*t+x0;%posicoes do x
    dy=y0+v0y*t-0.5*g*t^2+alfa*x^2 -x^4-6;%a distancia, a do y menos a da curva
    der=v0y-g*t+2*alfa*x*v0x-4*x^3*v0x;
function superf(alfa,x,y,handles,hObject)
    xs= -2:0.01:2;
    ys= -alfa*xs.^2+xs.^4+6;
    plot(handles.axes1,xs,ys,'b-',x,y,'ro')
    axis(handles.axes1,[min(xs), max(xs), min(ys)-0.2*max(ys), max(ys)])
    %axis(handles.axes1,'off')
    %axis(handles.axes1,'square') %para ficar mais bonito
    %axis(handles.axes1,'equal')
    drawnow
    hold(handles.axes1,'on')
    guidata(hObject, handles);  
function tn=pfixo(lambda,t0, prec,x0,y0,v0x,v0y,alfa,g)
    [dy1,der]=dist(x0,y0,v0x,v0y,alfa,t0,g);
    tn=t0-lambda*dy1;
    [dy2,der]=dist(x0,y0,v0x,v0y,alfa,tn,g);
    dy=dy2; 
    if (abs(dy1)< abs(dy2))
        lambda=-lambda;
        dy=dy1; tn=t0;
    end
    ni=0;
    while(abs(lambda*dy)>prec && ni<100000)
        ni=ni+1;
        [dy,der]=dist(x0,y0,v0x,v0y,alfa,tn,g);
        tn=tn-lambda*dy;
    end
function tn=newton(tn, prec,x0,y0,v0x,v0y,alfa,g)
    dy=10000; der=1;
    ni=0;
    while(abs(dy)>prec && ni<10000)
        ni=ni+1;
        [dy,der]=dist(x0,y0,v0x,v0y,alfa,tn,g);
        tn=tn-dy/der;
    end
function t=pesquisa_grosseira(t0, prec,x0,y0,v0x,v0y,alfa,g)
    t=t0+prec;
    d=dist(x0,y0,v0x,v0y,alfa,t,g);
     while d>0
         t=t+prec;
         d=dist(x0,y0,v0x,v0y,alfa,t,g);
     end
