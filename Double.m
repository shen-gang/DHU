function varargout = Double(varargin)
% DOUBLE MATLAB code for Double.fig
%      DOUBLE, by itself, creates a new DOUBLE or raises the existing
%      singleton*.
%
%      H = DOUBLE returns the handle to a new DOUBLE or the handle to
%      the existing singleton*.
%
%      DOUBLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DOUBLE.M with the given input arguments.
%
%      DOUBLE('Property','Value',...) creates a new DOUBLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Double_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Double_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Double

% Last Modified by GUIDE v2.5 21-Jul-2020 02:20:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Double_OpeningFcn, ...
                   'gui_OutputFcn',  @Double_OutputFcn, ...
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


% --- Executes just before Double is made visible.
function Double_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Double (see VARARGIN)

% Choose default command line output for Double
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Double wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Double_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.png';'*.bmp';'*.tif';'*.*'},'选择图片');
   if isequal(filename,0)||isequal(pathname,0)
      errordlg('没有选中文件','出错');
   return;
   else 
   file=[pathname,filename];
   end
pic = imread(file);
axes(handles.axes9);
imshow(pic);
imwrite(pic, 'old_A.png');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.png';'*.bmp';'*.tif';'*.*'},'选择图片');
   if isequal(filename,0)||isequal(pathname,0)
      errordlg('没有选中文件','出错');
   return;
   else 
   file=[pathname,filename];
   end
pic = imread(file);
axes(handles.axes10);
imshow(pic);
imwrite(pic, 'old_B.png');

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
img= imread('logo.jpg');
imshow(img);
% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
img= imread('DonghuaLeft.jpg');
imshow(img);
% Hint: place code in OpeningFcn to populate axes2



% --- Executes during object creation, after setting all properties.
function axes7_CreateFcn(hObject, eventdata, handles)
% hObject  handle to axes8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
img= imread('logo.jpg');
imshow(img);
% Hint: place code in OpeningFcn to populate axes8


% --- Executes during object creation, after setting all properties.
function axes8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
img= imread('DonghuaLeft.jpg');
imshow(img);
% Hint: place code in OpeningFcn to populate axes9


% --- Executes during object creation, after setting all properties.
function axes9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes9


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    I = imread('old_A.png'); %reference image
    I2 = imread('old_B.png'); %target image
    % I = imread('data1/Ancuti8.png'); %reference image
    % I2 = imread('data1/Ancuti1.png'); %target image
    %I2 = imresize(I2,[size(I,1) size(I,2)]); %only if 2nd image has different dimension
    G = rgb2gray(I); %grayscale ref
    G2 = rgb2gray(I2); %grayscale tar
    ref = single(G); %the reference image need to be normalized (single format)
    target = single(G2); %the target as well

    figure1 = figure()

    imshow([I, I2]);
    %% PART 2 - SURF
    %% Applying SURF on reference image
    ref = G; %surf need only grayscale not single 
    target = G2;

    surf_ref = detectSURFFeatures(ref);
    surf_ref = surf_ref.selectStrongest(250); %only 250 (few hundreds) strongest keypoints on ref
    [surf_ref_desc,vpts1] = extractFeatures(G,surf_ref);
    n_det_ref = surf_ref.Count; %number of detected keypoints on reference image
    surf_ref_desc = surf_ref_desc'; %transposed matrix

    hold on
    surf_ref.plot; %plot surf keypoints on ref

    % %% Applying SURF on target image 
    surf_tar = detectSURFFeatures(target);
    surf_tar = surf_tar.selectStrongest(250); %only 250 (few hundreds) strongest keypoints on target
    [surf_tar_desc,vpts2] = extractFeatures(G2,surf_tar);
    n_det_tar = surf_tar.Count; %number of detected keypoints on target image
    surf_tar_desc = surf_tar_desc'; %transposed matrix

    % %plotting the shifted sift keypoints of the target image (because it's a montage of himage)
    surf_tar_plot = surf_tar;
    surf_tar_plot.Location(:,1) = surf_tar.Location(:,1) + size(target,2); %with the shift
    surf_tar_plot.plot; %plot surf keypoints on target

    % hold on;

    % %% 'nearest neighbour distance ratio' matching algorithm
    % %matching with the nearest neighbour in terms of ratio of euclidean
    % %distance with 2nd nearest under a thresh

    for i = 1 : n_det_ref
           for j = 1 : n_det_tar
              euclid_dist_surf(i,j) = sqrt(sum((surf_ref_desc(:,i) - surf_tar_desc(:,j)).^2));
              %chi_square_dist_surf(i,j) = sum(((surf_ref_desc(:,i) - surf_tar_desc(:,j)).^2 ) ./ (sift_ref_desc(:,i) + sift_tar_desc(:,j) )) ./ 2;     
          end
    end

    ratio_thresh = 0.85; %trial and error optimal 0.85 %in literature the best is 0.8
    %suboptimal is 0.87

    for i = 1 : n_det_ref
         [m,n] = mink(euclid_dist_surf(i,:),2); %smallest 2
         if(m(1) / m(2)) <= ratio_thresh
             match_pairs_indexes(i,1) = i; %index of ref
             match_pairs_indexes(i,2) = n(1); %index of target
         end       
    end

    hold on;

    for k = 1 : size(match_pairs_indexes,1)
             index_ref = match_pairs_indexes(k,1);
             index_tar = match_pairs_indexes(k,2);
             if (index_ref~=0)
                 plot([surf_ref.Location(index_ref,1)  surf_tar_plot.Location(index_tar,1)],[surf_ref.Location(index_ref,2) surf_tar_plot.Location(index_tar,2)],'-b');
             end  
    end
    title('图像增强前匹配分析');
    saveas(figure1,'old_match.png');
    pic = imread('old_match.png');
    axes(handles.axes13);
imshow(pic);

% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
    % hObject    handle to pushbutton28 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    I = imread('new_A.png'); %reference image
    I2 = imread('new_B.png'); %target image
    % I = imread('data1/Ancuti8.png'); %reference image
    % I2 = imread('data1/Ancuti1.png'); %target image
    %I2 = imresize(I2,[size(I,1) size(I,2)]); %only if 2nd image has different dimension
    G = rgb2gray(I); %grayscale ref
    G2 = rgb2gray(I2); %grayscale tar
    ref = single(G); %the reference image need to be normalized (single format)
    target = single(G2); %the target as well

    figure1 = figure()

    imshow([I, I2]);
    %% PART 2 - SURF
    %% Applying SURF on reference image
    ref = G; %surf need only grayscale not single 
    target = G2;

    surf_ref = detectSURFFeatures(ref);
    surf_ref = surf_ref.selectStrongest(250); %only 250 (few hundreds) strongest keypoints on ref
    [surf_ref_desc,vpts1] = extractFeatures(G,surf_ref);
    n_det_ref = surf_ref.Count; %number of detected keypoints on reference image
    surf_ref_desc = surf_ref_desc'; %transposed matrix

    hold on
    surf_ref.plot; %plot surf keypoints on ref

    % %% Applying SURF on target image 
    surf_tar = detectSURFFeatures(target);
    surf_tar = surf_tar.selectStrongest(250); %only 250 (few hundreds) strongest keypoints on target
    [surf_tar_desc,vpts2] = extractFeatures(G2,surf_tar);
    n_det_tar = surf_tar.Count; %number of detected keypoints on target image
    surf_tar_desc = surf_tar_desc'; %transposed matrix

    % %plotting the shifted sift keypoints of the target image (because it's a montage of himage)
    surf_tar_plot = surf_tar;
    surf_tar_plot.Location(:,1) = surf_tar.Location(:,1) + size(target,2); %with the shift
    surf_tar_plot.plot; %plot surf keypoints on target

    % hold on;

    % %% 'nearest neighbour distance ratio' matching algorithm
    % %matching with the nearest neighbour in terms of ratio of euclidean
    % %distance with 2nd nearest under a thresh

    for i = 1 : n_det_ref
           for j = 1 : n_det_tar
              euclid_dist_surf(i,j) = sqrt(sum((surf_ref_desc(:,i) - surf_tar_desc(:,j)).^2));
              %chi_square_dist_surf(i,j) = sum(((surf_ref_desc(:,i) - surf_tar_desc(:,j)).^2 ) ./ (sift_ref_desc(:,i) + sift_tar_desc(:,j) )) ./ 2;     
          end
    end

    ratio_thresh = 0.85; %trial and error optimal 0.85 %in literature the best is 0.8
    %suboptimal is 0.87

    for i = 1 : n_det_ref
         [m,n] = mink(euclid_dist_surf(i,:),2); %smallest 2
         if(m(1) / m(2)) <= ratio_thresh
             match_pairs_indexes(i,1) = i; %index of ref
             match_pairs_indexes(i,2) = n(1); %index of target
         end       
    end

    hold on;

    for k = 1 : size(match_pairs_indexes,1)
             index_ref = match_pairs_indexes(k,1);
             index_tar = match_pairs_indexes(k,2);
             if (index_ref~=0)
                 plot([surf_ref.Location(index_ref,1)  surf_tar_plot.Location(index_tar,1)],[surf_ref.Location(index_ref,2) surf_tar_plot.Location(index_tar,2)],'-b');
             end  
    end
    title('图像增强后匹配分析');
    saveas(figure1,'new_match.png');
    pic = imread('new_match.png');
    axes(handles.axes14);
imshow(pic);

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)%增强B
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img= imread('old_B.png');
    h = warndlg('正在增强图片，请稍后','提示');
    val= get(handles.popupmenu6,'value');
    if (val==1)
               pic = Ancuti2018_Multi(img);
     elseif (val==2)
                pic = CLAHE_Multi(img); 
    elseif (val==3)
                 pic = DBDLS_Multi(img); 
    elseif (val==4)
                pic = NLVB_Multi(img); 
     elseif (val==5)
                pic = UCM_Multi(img);
%      elseif get(handles.radiobutton6,'value')
%                 algorithnm_name = '导师算法';
    else
        errordlg('请选择算法','出错');
        return;
    end
    axes(handles.axes12);
    imshow(pic);
    imwrite(pic, 'new_B.png');
    close(h); 
   

% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)%增强A
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img= imread('old_A.png');
    h = warndlg('正在增强图片，请稍后','提示');
    val= get(handles.popupmenu6,'value');
    if (val==1)
               pic = Ancuti2018_Multi(img);
     elseif (val==2)
                pic = CLAHE_Multi(img); 
    elseif (val==3)
                 pic = DBDLS_Multi(img); 
    elseif (val==4)
                pic = NLVB_Multi(img); 
     elseif (val==5)
                pic = UCM_Multi(img);
%      elseif get(handles.radiobutton6,'value')
%                 algorithnm_name = '导师算法';
    else
        errordlg('请选择算法','出错');
        return;
    end
    axes(handles.axes11);
    imshow(pic);
    imwrite(pic, 'new_A.png');
    close(h); 
   

% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(Double);
Main


% --- Executes during object creation, after setting all properties.
function axes11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes11


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
