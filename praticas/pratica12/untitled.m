function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 22-May-2020 14:29:31

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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function k_Callback(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k as text
%        str2double(get(hObject,'String')) returns contents of k as a double


% --- Executes during object creation, after setting all properties.
function k_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m_Callback(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m as text
%        str2double(get(hObject,'String')) returns contents of m as a double


% --- Executes during object creation, after setting all properties.
function m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Mc_Callback(hObject, eventdata, handles)
% hObject    handle to Mc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mc as text
%        str2double(get(hObject,'String')) returns contents of Mc as a double


% --- Executes during object creation, after setting all properties.
function Mc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ro_Callback(hObject, eventdata, handles)
% hObject    handle to ro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ro as text
%        str2double(get(hObject,'String')) returns contents of ro as a double


% --- Executes during object creation, after setting all properties.
function ro_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
dt=0.1;
m=str2num(get(handles.m,'String')); %massas dos corpos 1 e 2
L=1;%tamanho
k=str2num(get(handles.k,'String'));%mola
ro=str2num(get(handles.ro,'String'));
Mc=str2num(get(handles.Mc,'String'));  %massa da caixa
Nsteps=100;
v1=zeros(1,Nsteps+1);x1=zeros(1,Nsteps+1);v2=zeros(1,Nsteps+1);x2=zeros(1,Nsteps+1);xc=zeros(1,Nsteps+1);vc=zeros(1,Nsteps+1);t=zeros(1,Nsteps+1);EM=zeros(1,Nsteps+1);
v1(1)=0;
x1(1)=L+0.2;  % eq x1(eq)= 1 
v2(1)=0;
x2(1)=2;  % eq x2(eq)= 2
vc(1)=0;
xc(1)=0;
EM(1)=0.5.*Mc.*vc(1)^2 + 0.5.*k.*(-k.*(x1(1)-xc(1)-L) + k*(x2(1)-x1(1)-L)).^2 + 0.5*m*v1(1)^2 + 0.5*k*(+k*(x1(1)-xc(1)-L)-k*(xc(1)+2.*L-x2(1))- ro*(vc(1)))^2 + 0.5*m*v2(1)^2;
y=1.5;
metodo = get(handles.listbox1,'Value');
if metodo == 1%euler
    for i=1:Nsteps
        [x1,v1,x2,v2,xc,vc,EM,t] = euler(x1,v1,x2,v2,xc,vc,k,L,m,Mc,ro,t,dt,i,EM);
        desenhar_mov(x1,x2,xc,y,L,i,handles)
        desenhar_EM(EM,t,i,handles)
    end
elseif metodo == 2%euler_cromer
    for i=1:Nsteps
        [x1,v1,x2,v2,xc,vc,EM,t] = euler_cromer(x1,v1,x2,v2,xc,vc,k,L,m,Mc,ro,t,dt,i,EM);
        desenhar_mov(x1,x2,xc,y,L,i,handles)
        desenhar_EM(EM,t,i,handles)
    end
else%verlet
    x1(2)=v1(1)*dt+x1(1);
    x2(2)=v2(1)*dt+x2(1);
    xc(2)=vc(1)*dt+xc(1);
    for i=2:Nsteps
        [x1,v1,x2,v2,xc,vc,EM,t] = verlet(x1,v1,x2,v2,xc,vc,k,L,m,Mc,ro,t,dt,i,EM);
        desenhar_mov(x1,x2,xc,y,L,i,handles)
        desenhar_EM(EM,t,i,handles)
    end
end
%hold(handles.energia,'off')

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


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
value = get(handles.radiobutton1,'Value');
if value==1
    hold(handles.energia,'on');
else
    hold(handles.energia,'off');
end
guidata(hObject, handles)

function [x1,v1,x2,v2,xc,vc,EM,t]= euler(x1,v1,x2,v2,xc,vc,k,L,m,Mc,ro,t,dt,i,EM)
    %Massa 1 
    v1(i+1) = v1(i) + (dt/m) * (-k*(x1(i)-xc(i)-L) + k*(x2(i)-x1(i)-L));     %xe=x1
    x1(i+1) = x1(i) + dt * v1(i);
    
    %Massa 2
    v2(i+1) = v2(i) + (dt/m) * (-k*(x2(i)-x1(i)-L) + k*(xc(i)+2.*L-x2(i)));     %xd=x2
    x2(i+1) = x2(i) + dt * v2(i);
    
    %Caixa
    vc(i+1) = vc(i) + (dt/Mc) * (+k*(x1(i)-xc(i)-L)-k*(xc(i)+2.*L-x2(i))- ro*(vc(i))); %dxc/dt=vc(i)
    %vc(i+1) = vc(i) + (dt/Mc) * (+k*(x1(i)-xc(i)-L)-k*(xc(i)+2.*L-x2(i)))
    xc(i+1) = xc(i) + dt * vc(i);

    EM(i+1) = 0.5.*Mc.*vc(i+1)^2 + 0.5.*k.*(-k.*(x1(i)-xc(i)-L) + k*(x2(i)-x1(i)-L)).^2 + 0.5*m*v1(i+1)^2 + 0.5*k*(+k*(x1(i)-xc(i)-L)-k*(xc(i)+2.*L-x2(i))- ro*(vc(i)))^2 + 0.5*m*v2(i+1)^2;
    %nao tenho a certeza sobre o k se é assim que se calcula
    
    t(i+1) = t(i)+ dt;

function [x1,v1,x2,v2,xc,vc,EM,t]= euler_cromer(x1,v1,x2,v2,xc,vc,k,L,m,Mc,ro,t,dt,i,EM)
    %Massa 1 
    v1(i+1) = v1(i) + (dt/m) * (-k*(x1(i)-xc(i)-L) + k*(x2(i)-x1(i)-L));     %xe=x1
    x1(i+1) = x1(i) + dt * v1(i+1);
    
    %Massa 2
    v2(i+1) = v2(i) + (dt/m) * (-k*(x2(i)-x1(i)-L) + k*(xc(i)+2.*L-x2(i)));     %xd=x2
    x2(i+1) = x2(i) + dt * v2(i+1);
    
    %Caixa
    vc(i+1) = vc(i) + (dt/Mc) * (+k*(x1(i)-xc(i)-L)-k*(xc(i)+2.*L-x2(i))- ro*(vc(i))); %dxc/dt=vc(i)
    %vc(i+1) = vc(i) + (dt/Mc) * (+k*(x1(i)-xc(i)-L)-k*(xc(i)+2.*L-x2(i)))
    xc(i+1) = xc(i) + dt * vc(i+1);

    EM(i+1) = 0.5.*Mc.*vc(i+1)^2 + 0.5.*k.*(-k.*(x1(i)-xc(i)-L) + k*(x2(i)-x1(i)-L)).^2 + 0.5*m*v1(i+1)^2 + 0.5*k*(+k*(x1(i)-xc(i)-L)-k*(xc(i)+2.*L-x2(i))- ro*(vc(i)))^2 + 0.5*m*v2(i+1)^2;
    %nao tenho a certeza sobre o k se é assim que se calcula
    
    t(i+1) = t(i)+ dt;

function [x1,v1,x2,v2,xc,vc,EM,t]= verlet(x1,v1,x2,v2,xc,vc,k,L,m,Mc,ro,t,dt,i,EM)
    x1(i+1) = 2*x1(i)-x1(i-1) + (dt.^2/m) * (-k*(x1(i)-xc(i)-L) + k*(x2(i)-x1(i)-L));            
    v1(i) = (x1(i+1)-x1(i-1) / 2*dt);
    %Massa 2
    x2(i+1) = 2*x2(i)-x2(i-1) + (dt.^2/m) * (-k*(x2(i)-x1(i)-L) + k*(xc(i)+2.*L-x2(i)));           
    v2(i) = (x2(i+1)-x2(i-1) / (2*dt)) ;
    %Caixa
    xc(i+1) = 2*xc(i)-xc(i-1) + (dt.^2/Mc) * (k*(x1(i)-xc(i)-L) - k*(xc(i)+2.*L-x2(i))- ro*vc(i));   
    vc(i) = (xc(i+1)-xc(i-1) / (2*dt));    
    EM(i+1) = 0.5.*Mc.*vc(i+1)^2 + 0.5.*k.*(-k.*(x1(i)-xc(i)-L) + k*(x2(i)-x1(i)-L)).^2 + 0.5*m*v1(i+1)^2 + 0.5*k*(+k*(x1(i)-xc(i)-L)-k*(xc(i)+2.*L-x2(i))- ro*(vc(i)))^2 + 0.5*m*v2(i+1)^2;
    t(i+1) = t(i)+ dt;

function desenhar_mov(x1,x2,xc,y,L,i,handles)
    plot(handles.desenho,x2(i), y ,'.r', x1(i), y ,'.b','Markersize',30);
    hold(handles.desenho,'on')
    
    %Criar elasticos
    e1=line(handles.desenho,[xc(i) x1(i)], [y y],'Linewidth',1);
    e2=line(handles.desenho,[x2(i) x1(i)], [y y],'Linewidth',1);
    e3=line(handles.desenho,[x2(i) xc(i)+3.*L], [y y],'Linewidth',1);
    
    %Criar caixa
    l1=line(handles.desenho,[xc(i) xc(i)], [0 3], 'Linewidth',1);  %lado direito
    l2=line(handles.desenho,[xc(i)+3.*L xc(i)+3.*L], [0 3], 'Linewidth',1); %linha que une os dois lados
    l3=line(handles.desenho,[xc(i) xc(i)+3.*L], [0 0], 'Linewidth',1);  %lado esquerdo
    
    line(handles.desenho,[-10 10], [0 0],'Linewidth',1)
    axis(handles.desenho,[-2 4 -1 4])
    hold(handles.desenho,'off')
  
    pause(0.05)
    drawnow
 function desenhar_EM(Em,t,i,handles)
    plot(handles.energia,t(i),Em(i),'r.')
    axis(handles.energia,[0 10 0 0.3])
    hold(handles.energia,'on')
    drawnow