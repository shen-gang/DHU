function varargout = Single(varargin)
addpath(genpath('c:/matlab/myfiles'))

% SINGLE MATLAB code for Single.fig
%      SINGLE, by itself, creates a new SINGLE or raises the existing
%      singleton*.
%
%      H = SINGLE returns the handle to a new SINGLE or the handle to
%      the existing singleton*.
%
%      SINGLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SINGLE.M with the given input arguments.
%
%      SINGLE('Property','Value',...) creates a new SINGLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Single_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Single_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Single

% Last Modified by GUIDE v2.5 21-Jul-2020 02:20:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Single_OpeningFcn, ...
                   'gui_OutputFcn',  @Single_OutputFcn, ...
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


% --- Executes just before Single is made visible.
function Single_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Single (see VARARGIN)

% Choose default command line output for Single
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Single wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Single_OutputFcn(hObject, eventdata, handles) 
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
% val=get(handles.popupmenu1,'value');
img= imread('old.png');
    val= get(handles.popupmenu1,'value');
    if (val==1)
               h = warndlg('������ǿͼƬ�����Ժ�','��ʾ');
               pic = Ancuti2018_Multi(img);
               axes(handles.axes4);
               imshow(pic);
               imwrite(pic, 'new.png');
     elseif (val==2)
                h = warndlg('������ǿͼƬ�����Ժ�','��ʾ');
                pic = CLAHE_Multi(img); 
                axes(handles.axes4);
                imshow(pic);
                imwrite(pic, 'new.png');
    elseif (val==3)
                 h = warndlg('������ǿͼƬ�����Ժ�','��ʾ');
                 pic = DBDLS_Multi(img); 
                 axes(handles.axes4);
                imshow(pic);
                imwrite(pic, 'new.png');
    elseif (val==4)
                h = warndlg('������ǿͼƬ�����Ժ�','��ʾ');
                pic = NLVB_Multi(img);
                axes(handles.axes4);
                imshow(pic);
                imwrite(pic, 'new.png');
     elseif (val==5)
                h = warndlg('������ǿͼƬ�����Ժ�','��ʾ');
                pic = UCM_Multi(img);
                axes(handles.axes4);
                imshow(pic);
                imwrite(pic, 'new.png');
%      elseif get(handles.radiobutton6,'value')
%                 algorithnm_name = '��ʦ�㷨';   
    elseif (val==6)%ȫ���㷨
            h = warndlg('������ǿͼƬ�����Ժ�','��ʾ');
            im= imread('old.png');
            %im = imread('D:\2018TIP Color Balance Fusion\image\6.jpg');
            figure('name','��ǿ�㷨����Ա�'), subplot(2,3,1);
            imshow(im);
            xlabel('ԭʼͼ��');

                %3C�㷨��ǿЧ��
            im1 = Ancuti2018_Multi(im);
            subplot(2,3,2);
            imshow(im1);
            xlabel('3C�㷨��ǿЧ��');

            %CLAHE�㷨��ǿЧ��
            im2 = CLAHE_Multi(im);
            subplot(2,3,3);
            imshow(im2);
            xlabel('CLAHE�㷨��ǿЧ��');

             %�Աȶ������㷨
            im3 = DBDLS_Multi(im);
            subplot(2,3,4);
            imshow(im3);
            xlabel('�Աȶ������㷨��ǿЧ��');

            %���˲���ǿ�㷨��ǿЧ��
            im4 = NLVB_Multi(im);
            subplot(2,3,5);
            imshow(im4);
            xlabel('���˲��㷨��ǿЧ��');

            %�޼ලģ����ǿ�㷨
            im5 = UCM_Multi(im);
            subplot(2,3,6);
            imshow(im5);
            xlabel('�޼ලģ����ǿ�㷨��ǿЧ��');
    else
        errordlg('��ѡ���㷨','����');
        return;
    end
    close(h); 
    



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h6 = warndlg('���ڴ�֣����Ժ�','��ʾ');
    im= imread('old.png');
    o = UCIQE(im);
    %o = UIQM(im);
    %CLAHE�㷨��ǿЧ��
    result1 = CLAHE_Multi(im);
    imwrite(result1,'singleimage1.png');
    im1 = imread('singleimage1.png');
    a = UCIQE(im1);
    %a = UIQM(im1);
    %���˲���ǿ�㷨��ǿЧ��
    result2 = DBDLS_Multi(im);
    imwrite(result2,'singleimage2.png');
    im2 = imread('singleimage2.png');
    b = UCIQE(im2);
    %b = UIQM(im2);
    %3C�㷨��ǿЧ��
    result3 = Ancuti2018_Multi(im);
    imwrite(result3,'singleimage3.png');
    im3= imread('singleimage3.png');
    c = UCIQE(im3);
    %c =UIQM(im3);
    %�Աȶ������㷨
    result4 = NLVB_Multi(im);
    imwrite(result4,'singleimage4.png');
    im4= imread('singleimage4.png');
    d = UCIQE(im4);
    %d = UIQM(im4);   
    %�޼ලģ����ǿ�㷨
    result5 = UCM_Multi(im);
    imwrite(result5,'singleimage5.png');
    im5= imread('singleimage5.png');
    e = UCIQE(im5);
    %e = UIQM(im5);
    %��ͼ
    x=1:1:5;%x���ϵ����ݣ���һ��ֵ�������ݿ�ʼ���ڶ���ֵ��������������ֵ������ֹ
    a1=[o,o,o,o,o]; %a����yֵ
    b1=[a,b,c,d,e]; %b����yֵ
    umax = max(b1);
    umin = min(b1);
    ulength = (umax-umin)/10;
    figure('name','����ǿ�㷨Ч�����д��');
    plot(x,a1,'-*b',x,b1,'--or'); %���ԣ���ɫ�����
    axis([0,6,umin-0.03,umax+0.03])  %ȷ��x����y���ͼ��С
    set(gca,'XTick',[0:1:6]) %x�᷶Χ1-7�����1
    set(gca,'xticklabels',{'','CLAHE�㷨','�Աȶ������㷨','3C�㷨','���˲����㷨','UCM�㷨'})
    set(gca,'YTick',[(umin - 0.03):ulength:(umax+0.03)]) %y�᷶Χ
    legend('ԭͼ','��ǿ��');   %���ϽǱ�ע
    xlabel('')  %x����������
    ylabel('��������') %y����������
close(h6);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.png';'*.jpg';'*.bmp';'*.tif';'*.*'},'ѡ��ͼƬ');
   if isequal(filename,0)|isequal(pathname,0)
      errordlg('û��ѡ���ļ�','����');
   return;
   else 
   file=[pathname,filename];
   end
pic = imread(file);
axes(handles.axes3);
imshow(pic);
imwrite(pic, 'old.png');



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
%�����˵�ģ��
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%ÿ��case����ӵ���ò˵�������Ҫ���õĺ�������m���롣
    switch get(hObject,'value')
    %guidata(hObject, handles);  
    case 1
    set(handles.pushbutton2,'visible','off');
    case 2
    set(handles.pushbutton2,'visible','off');
    case 3
    set(handles.pushbutton2,'visible','off');
    case 4
    set(handles.pushbutton2,'visible','off');
    case 5
    set(handles.pushbutton2,'visible','off');
    case 6
    set(handles.pushbutton2,'visible','on');%�������5���ɼ�
end





% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1





% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
img= imread('logo.jpg');
imshow(img);
% Hint: place code in OpeningFcn to populate axes


% --- Executes during object creation, after setting all properties.
function axes6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
img= imread('DonghuaLeft.jpg');
imshow(img);
% Hint: place code in OpeningFcn to populate axes6


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(Single);
Main


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
javaFrame = get(gcf,'javaFrame');
w = warning('query','last')  %���㱨warning�����д���������������
id = w.identifier;           %�õ����warning��Ψһ��ʶ��
warning('off',id)
set(javaFrame,'Maximized',1);
