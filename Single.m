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
               h = warndlg('正在增强图片，请稍后','提示');
               pic = Ancuti2018_Multi(img);
               axes(handles.axes4);
               imshow(pic);
               imwrite(pic, 'new.png');
     elseif (val==2)
                h = warndlg('正在增强图片，请稍后','提示');
                pic = CLAHE_Multi(img); 
                axes(handles.axes4);
                imshow(pic);
                imwrite(pic, 'new.png');
    elseif (val==3)
                 h = warndlg('正在增强图片，请稍后','提示');
                 pic = DBDLS_Multi(img); 
                 axes(handles.axes4);
                imshow(pic);
                imwrite(pic, 'new.png');
    elseif (val==4)
                h = warndlg('正在增强图片，请稍后','提示');
                pic = NLVB_Multi(img);
                axes(handles.axes4);
                imshow(pic);
                imwrite(pic, 'new.png');
     elseif (val==5)
                h = warndlg('正在增强图片，请稍后','提示');
                pic = UCM_Multi(img);
                axes(handles.axes4);
                imshow(pic);
                imwrite(pic, 'new.png');
%      elseif get(handles.radiobutton6,'value')
%                 algorithnm_name = '导师算法';   
    elseif (val==6)%全部算法
            h = warndlg('正在增强图片，请稍后','提示');
            im= imread('old.png');
            %im = imread('D:\2018TIP Color Balance Fusion\image\6.jpg');
            figure('name','增强算法结果对比'), subplot(2,3,1);
            imshow(im);
            xlabel('原始图像');

                %3C算法增强效果
            im1 = Ancuti2018_Multi(im);
            subplot(2,3,2);
            imshow(im1);
            xlabel('3C算法增强效果');

            %CLAHE算法增强效果
            im2 = CLAHE_Multi(im);
            subplot(2,3,3);
            imshow(im2);
            xlabel('CLAHE算法增强效果');

             %对比度拉伸算法
            im3 = DBDLS_Multi(im);
            subplot(2,3,4);
            imshow(im3);
            xlabel('对比度拉伸算法增强效果');

            %逆滤波增强算法增强效果
            im4 = NLVB_Multi(im);
            subplot(2,3,5);
            imshow(im4);
            xlabel('逆滤波算法增强效果');

            %无监督模型增强算法
            im5 = UCM_Multi(im);
            subplot(2,3,6);
            imshow(im5);
            xlabel('无监督模型增强算法增强效果');
    else
        errordlg('请选择算法','出错');
        return;
    end
    close(h); 
    



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h6 = warndlg('正在打分，请稍后','提示');
    im= imread('old.png');
    o = UCIQE(im);
    %o = UIQM(im);
    %CLAHE算法增强效果
    result1 = CLAHE_Multi(im);
    imwrite(result1,'singleimage1.png');
    im1 = imread('singleimage1.png');
    a = UCIQE(im1);
    %a = UIQM(im1);
    %逆滤波增强算法增强效果
    result2 = DBDLS_Multi(im);
    imwrite(result2,'singleimage2.png');
    im2 = imread('singleimage2.png');
    b = UCIQE(im2);
    %b = UIQM(im2);
    %3C算法增强效果
    result3 = Ancuti2018_Multi(im);
    imwrite(result3,'singleimage3.png');
    im3= imread('singleimage3.png');
    c = UCIQE(im3);
    %c =UIQM(im3);
    %对比度拉伸算法
    result4 = NLVB_Multi(im);
    imwrite(result4,'singleimage4.png');
    im4= imread('singleimage4.png');
    d = UCIQE(im4);
    %d = UIQM(im4);   
    %无监督模型增强算法
    result5 = UCM_Multi(im);
    imwrite(result5,'singleimage5.png');
    im5= imread('singleimage5.png');
    e = UCIQE(im5);
    %e = UIQM(im5);
    %绘图
    x=1:1:5;%x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
    a1=[o,o,o,o,o]; %a数据y值
    b1=[a,b,c,d,e]; %b数据y值
    umax = max(b1);
    umin = min(b1);
    ulength = (umax-umin)/10;
    figure('name','对增强算法效果进行打分');
    plot(x,a1,'-*b',x,b1,'--or'); %线性，颜色，标记
    axis([0,6,umin-0.03,umax+0.03])  %确定x轴与y轴框图大小
    set(gca,'XTick',[0:1:6]) %x轴范围1-7，间隔1
    set(gca,'xticklabels',{'','CLAHE算法','对比度拉伸算法','3C算法','逆滤波伸算法','UCM算法'})
    set(gca,'YTick',[(umin - 0.03):ulength:(umax+0.03)]) %y轴范围
    legend('原图','增强后');   %右上角标注
    xlabel('')  %x轴坐标描述
    ylabel('质量分数') %y轴坐标描述
close(h6);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.png';'*.jpg';'*.bmp';'*.tif';'*.*'},'选择图片');
   if isequal(filename,0)|isequal(pathname,0)
      errordlg('没有选中文件','出错');
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
%下拉菜单模块
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%每个case下添加点击该菜单项你需要调用的函数或者m代码。
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
    set(handles.pushbutton2,'visible','on');%让坐标框5不可见
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
w = warning('query','last')  %在你报warning的那行代码后面加上这句代码
id = w.identifier;           %拿到这个warning的唯一标识符
warning('off',id)
set(javaFrame,'Maximized',1);
