function varargout = Multi(varargin)
% MULTI MATLAB code for Multi.fig
%      MULTI, by itself, creates a new MULTI or raises the existing
%      singleton*.
%
%      H = MULTI returns the handle to a new MULTI or the handle to
%      the existing singleton*.
%
%      MULTI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MULTI.M with the given input arguments.
%
%      MULTI('Property','Value',...) creates a new MULTI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Multi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Multi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Multi

% Last Modified by GUIDE v2.5 21-Jul-2020 02:12:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Multi_OpeningFcn, ...
                   'gui_OutputFcn',  @Multi_OutputFcn, ...
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


% --- Executes just before Multi is made visible.
function Multi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Multi (see VARARGIN)

% Choose default command line output for Multi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Multi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Multi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
img= imread('logo.jpg');
imshow(img);
% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
img= imread('DonghuaLeft.jpg');
imshow(img);
% Hint: place code in OpeningFcn to populate axes2


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%打开文件夹

select_path = uigetdir('','选择测试图片路径：');
     if isequal(select_path,0)
      errordlg('没有选中文件','出错');
   return;
   else 
   file_path = strcat(select_path,'\');
   set(handles.pushbutton3,'String',file_path);
   end
   pic = imread('Selected.jpg');
   axes(handles.axes16);
   
  imshow(pic);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = warndlg('正在增强图片，请稍后','提示');
 
    file_path = get(handles.pushbutton3,'String');
    val= get(handles.popupmenu1,'value');
    if (val==1) 
                algorithnm_name = '3C算法';    
     elseif (val==2)
              
                algorithnm_name = 'CLAHE算法'; 
    elseif (val==3)
                 
                 algorithnm_name = '对比度拉伸算法'; 
    elseif (val==4)
               
                algorithnm_name = '逆滤波算法'; 
     elseif (val==5)
                
                algorithnm_name = '无监督模型算法';
%      elseif (val==6)
%                 
%                 algorithnm_name = '导师算法';
    end
    %创建图像增强后存储文件夹
    store_path =  strcat( file_path,algorithnm_name,'增强后\');
                if  exist(store_path)==0  %该文件夹不存在，则直接创建
                    mkdir(store_path);
                else                                                 %该文件夹存在，则先删除再创建
                    rmdir(store_path, 's');                %该文件夹中有没有文件均可
                    mkdir(store_path);
                end
                
    img_path_list = dir(strcat(file_path,'*.png'));%获取该文件夹中所有jpg格式的图像
    img_number = length(img_path_list);%获取图像总数量
    for i =1:img_number    %逐次取出文件
%     img_name=allnames{1,number} ;
    image_name = img_path_list(i).name;% 图像名
    image= imread(strcat(file_path,image_name));
            %使用算法增强图像集
            if (val==1)
                    result =  Ancuti2018_Multi(image);                   %使用Ancuti2018增强算法
            elseif (val==2)
                    result =  CLAHE_Multi(image);                       %使用Ancuti2018增强算法                     
            elseif (val==3)
                    result =  DBDLS_Multi(image);                       %使用对比度拉伸算法
            elseif (val==4)
                    result =  NLVB_Multi(image);                        %使用逆滤波算法
            elseif (val==5)
                    result =  UCM_Multi(image);                         %使用UCM算法
            elseif(val==6)
                    result =  UCM_Multi(image);                         %导师的算法
            end
    imwrite(result, strcat(store_path,image_name))
    end
%增强算法结束
%创拼接路径
    image_path = file_path;                             %增强前 图像文件夹路径
    img_path_list = dir(strcat(image_path,'*.png'));    %获取该文件夹中所有jpg格式的图像
    img_num = length(img_path_list);                    %获取图像总数量
    enhanced_image_path = store_path;
    mkdir(enhanced_image_path);
    enhanced_image_path_list = dir(strcat(enhanced_image_path,'*.png'));%获取该文件夹中所有jpg格式的图像

% % % % % % % % 对原始图像集进行质量评价% % % % % % %
    UCIQE_result = zeros(1,img_number);
    enhanced_UCIQE_result = zeros(1,img_number);

    figure1 = figure('name',strcat(algorithnm_name,'增强效果'));
    for i = 1:img_num %逐一读取图像
    %增强前图像评分
    image_name = img_path_list(i).name;% 图像名  
    image= imread(strcat(image_path,image_name));
    uciqe_old = UCIQE(image);

    UCIQE_result(i) = uciqe_old;
    %增强后图像评分
    enhanced_image_name = enhanced_image_path_list(i).name;% 图像名            
    enhanced_image= imread(strcat(enhanced_image_path,enhanced_image_name));
    uciqe_new = UCIQE(enhanced_image);
    enhanced_UCIQE_result(i) = uciqe_new;
    q = uciqe_new -  uciqe_old;     %增强前后得分差
    if q <0
        subplot(img_number/5,5,i);
        imshow(enhanced_image)
        xlabel('质量降低了！','color','r');
        else
        subplot(img_number/5,5,i);
        imshow(enhanced_image);
        end    
    end
        QSD = enhanced_UCIQE_result - UCIQE_result;
        average_QSD = mean(QSD);
        std_QSD = std(QSD,1);
        Lambda = 2;
        Epsilon = Lambda*std_QSD;
        left_point = average_QSD-Epsilon;
        right_point = average_QSD+Epsilon;
        valid_Data = QSD(QSD>=left_point&QSD<=right_point);

        if valid_Data>0
    
            %fprintf('在该质量评价方法下，此增强方法为一致增强方法')
            min_QSD = min(valid_Data);
            ave_QSD = mean(valid_Data);
            CEQA_eff = 1/2*ave_QSD + 1/2*min_QSD;
            
            da = [strcat(algorithnm_name,'在所选图像集上为一致性增强算法，整体增强性能为:') num2str(CEQA_eff)];
            set(handles.text4,'string',da);
            disp(da);
        else
            da = [strcat(algorithnm_name,'在所选图像集上为非一致性增强算法')];
            set(handles.text4,'string',da);
            disp(da);
            
        end 
    saveas(figure1,'ZQxiaoguo.png');
    ZQXG = imread('ZQxiaoguo.png');
    axes(handles.axes16);
    imshow(ZQXG);
    


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 h = warndlg('正在进行分数评测，请稍后','提示');
 val= get(handles.popupmenu1,'value');
   
    file_path = get(handles.pushbutton3,'String');
     if (val==1) 
                algorithnm_name = '3C算法';    
     elseif (val==2)
                option=2;
                algorithnm_name = 'CLAHE算法'; 
    elseif (val==3)
                 option=3;
                 algorithnm_name = '对比度拉伸算法'; 
    elseif (val==4)
                option=4;
                algorithnm_name = '逆滤波算法'; 
     elseif (val==5)
                option=5;
                algorithnm_name = '无监督模型算法';
%      elseif get(handles.radiobutton6,'value')
%                 option=6;
%                 algorithnm_name = '导师算法';
    end
    %创建图像增强后存储文件夹
    store_path =  strcat( file_path,algorithnm_name,'增强后\');
                if      exist(store_path)==0  %该文件夹不存在，则直接创建
                    mkdir(store_path);
                else                                                 %该文件夹存在，则先删除再创建
                    rmdir(store_path, 's');                %该文件夹中有没有文件均可
                    mkdir(store_path);
                end
                
    img_path_list = dir(strcat(file_path,'*.png'));%获取该文件夹中所有jpg格式的图像
    img_number = length(img_path_list);%获取图像总数量
    for i =1:img_number    %逐次取出文件
%     img_name=allnames{1,number} ;
    image_name = img_path_list(i).name;% 图像名
    image= imread(strcat(file_path,image_name));
            %使用算法增强图像集
            if (val==1)
                    result = Ancuti2018_Multi(image);                    %使用Ancuti2018增强算法
            elseif (val==2)
                    result =  CLAHE_Multi(image);                       %使用Ancuti2018增强算法                     
            elseif (val==3)
                    result =  DBDLS_Multi(image);                       %使用对比度拉伸算法
            elseif (val==4)
                    result =  NLVB_Multi(image);                        %使用逆滤波算法
            elseif (val==5)
                    result =  UCM_Multi(image);                         %使用UCM算法
%             elseif get(handles.radiobutton6,'value')
%                     result =  UCM_Multi(image);                         %导师的算法
            end
    imwrite(result, strcat(store_path,image_name))
    end
%增强算法结束
%创拼接路径
    image_path = file_path;                             %增强前 图像文件夹路径
    img_path_list = dir(strcat(image_path,'*.png'));    %获取该文件夹中所有jpg格式的图像
    img_num = length(img_path_list);                    %获取图像总数量
    enhanced_image_path = store_path;
    mkdir(enhanced_image_path);
    enhanced_image_path_list = dir(strcat(enhanced_image_path,'*.png'));%获取该文件夹中所有jpg格式的图像

% % % % % % % % 对原始图像集进行质量评价% % % % % % %
    UCIQE_result = zeros(1,img_number);
    enhanced_UCIQE_result = zeros(1,img_number);

    for i = 1:img_num %逐一读取图像
    %增强前图像评分
    image_name = img_path_list(i).name;% 图像名  
    image= imread(strcat(image_path,image_name));
    uciqe_old = UCIQE(image);
    UCIQE_result(i) = uciqe_old;
    %增强后图像评分
     enhanced_image_name = enhanced_image_path_list(i).name;% 图像名            
    enhanced_image= imread(strcat(enhanced_image_path,enhanced_image_name));
    uciqe_new = UCIQE(enhanced_image);
    enhanced_UCIQE_result(i) = uciqe_new;
    end
%增强算法结束
    
%绘制折线图
    %确定y轴上限，下限，步长
    QSD = enhanced_UCIQE_result - UCIQE_result;
    uemerge = [UCIQE_result enhanced_UCIQE_result];
    umax = max(uemerge);
    umin = min(uemerge);
    ulength = (umax-umin)/10;
    %确定x轴的范围
    x=1:1:img_num;%x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
    figure('name',strcat(algorithnm_name,'性能评测'))
    subplot(2,1,1)
    %用spcrv()函数画出平滑的曲线图
    values1=spcrv([[x(1) x x(end)];[UCIQE_result(1) UCIQE_result UCIQE_result(end)]],3);
    values2=spcrv([[x(1) x x(end)];[enhanced_UCIQE_result(1) enhanced_UCIQE_result enhanced_UCIQE_result(end)]],3);
    plot(values1(1,:),values1(2,:))
    hold on
    plot(values2(1,:),values2(2,:))
    hold on
    title('各幅图像增强前后的质量分数对比')
    axis([0,img_num,umin,umax])%确定x轴与y轴框图大小
    set(gca,'XTick',[0:1:img_num]) %x轴范围1~img_num，间隔1
    set(gca,'xticklabels',[0:1:img_num])%x轴范围
    set(gca,'YTick',[umin:ulength:umax]) %y轴范围
    legend('原图','增强后');   %右上角标注
    xlabel('图像序号')  %x轴坐标描述
    ylabel('图像质量分数') %y轴坐标描述
    %绘制柱状图
    %确定柱状图y轴的上下限
  %  figure('name','QSD')
    subplot(2,1,2)
    qmin = min(QSD);%qsd保存的是图像增强前后的质量分数差值
    qmax = max(QSD);
    qlength = (qmax-qmin)/10;
    bar(x,QSD)
    title('各幅图像增强前后的质量分数差值(QSD)')
    set(gca,'XTick',[0:1:img_num])%x轴范围
    set(gca,'YTick',[qmin:qlength:qmax]) %y轴范围
    xlabel('图像序号')  %x轴坐标描述
    ylabel('图像质量分数差值QSD') %y轴坐标描述
    
    close(h);

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
function pushbutton3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(Multi);
Main

%子集自适应选取
% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
h = warndlg('正在进行子集选取，请稍后','提示');
 val= get(handles.popupmenu1,'value');
   
    file_path = get(handles.pushbutton3,'String');
     if (val==1) 
                algorithnm_name = '3C算法';    
     elseif (val==2)
                option=2;
                algorithnm_name = 'CLAHE算法'; 
    elseif (val==3)
                 option=3;
                 algorithnm_name = '对比度拉伸算法'; 
    elseif (val==4)
                option=4;
                algorithnm_name = '逆滤波算法'; 
     elseif (val==5)
                option=5;
                algorithnm_name = '无监督模型算法';
%      elseif get(handles.radiobutton6,'value')
%                 option=6;
%                 algorithnm_name = '导师算法';
    end
    %创建图像增强后存储文件夹
%     store_path =  strcat( file_path,algorithnm_name,'增强后\');
%                 if      exist(store_path)==0  %该文件夹不存在，则直接创建
%                     mkdir(store_path);
%                 else                                                 %该文件夹存在，则先删除再创建
%                     rmdir(store_path, 's');                %该文件夹中有没有文件均可
%                     mkdir(store_path);
%                 end
       
      
          
                
             NUM = 20;
             alpha = 0.05;
             derta_a = [];
             QSD = []; 
             average_QSD_all = [];
             std_QSD_all = [];
             count = 0;
             CEQA_eff_all=[];
             UCIQE_result = [];%存储原始图像得分
             enhanced_UCIQE_result = [];%存储增强图像得分
            img_path_list = dir(strcat(file_path,'*.png'));%  获取初始png格式的图像
            img_number = length(img_path_list);%获取图像总数量
             p=randperm(img_number); 
             t=p(1:NUM);  
             

            for i =1:NUM    %逐次取出文件
                M = t(i);
                count = count + 1;
        %     img_name=allnames{1,number} ;
            image_name = img_path_list(M).name;% 图像名
            image= imread(strcat(file_path,image_name));
            uciqe_old = UCIQE(image);
            UCIQE_result = [UCIQE_result uciqe_old];
            %使用算法增强图像集
            if (val==1)
                    result = Ancuti2018_Multi(image);                    %使用Ancuti2018增强算法
            elseif (val==2)
                    result =  CLAHE_Multi(image);                       %使用Ancuti2018增强算法                     
            elseif (val==3)
                    result =  DBDLS_Multi(image);                       %使用对比度拉伸算法
            elseif (val==4)
                    result =  NLVB_Multi(image);                        %使用逆滤波算法
            elseif (val==5)
                    result =  UCM_Multi(image);                         %使用UCM算法             
            end  
                         %子集自适应选取开始
                        imwrite(result,'ZDXQ.png');
                        enhanced_image = imread('ZDXQ.png');
                        uciqe_new = UCIQE(enhanced_image);                      %对增强后图像打分
                        enhanced_UCIQE_result = [enhanced_UCIQE_result uciqe_new];
                        QSD_single = uciqe_new - uciqe_old;                     %得到增强前后的分数差
                        QSD = [QSD QSD_single];
                        average_QSD = mean(QSD);
                        std_QSD = std(QSD,1);
                        std_QSD_all = [std_QSD_all std_QSD];
                        Lambda = 2;
                        Epsilon = Lambda*std_QSD;
                        left_point = average_QSD-Epsilon;
                        right_point = average_QSD+Epsilon;
                        valid_Data = QSD(QSD>=left_point&QSD<=right_point);
                   if valid_Data>0
                            min_QSD = min(valid_Data);
                            ave_QSD = mean(valid_Data);
                            CEQA_eff = 1/2*ave_QSD + 1/2*min_QSD;
                            CEQA_eff_all = [CEQA_eff_all CEQA_eff];
                            %计算学生分布
                            std_CEQA_eff = std(CEQA_eff_all,1);
                            student = tinv(1-alpha/2,count);
                            derta = student*std_CEQA_eff/sqrt(count);
                            derta_a = [derta_a derta];
                            BL = (double(count)/img_number) * 100;
                                     if count>=10
                                        if( derta>0&&derta<0.005)
                                            
                                           da = [strcat(algorithnm_name,'在所选图像集上为一致性增强算法，整体增强性能为:') num2str(CEQA_eff) ',选取子集比例为:' num2str(BL) '%'];
                                            set(handles.text4,'string',da);
                                            disp(da);
                                        break;
                                        end 
                                     end       
                   else
                            
                            da = [strcat(algorithnm_name,'在所选图像集为非一致性增强算法') ',选取子集比例为:' num2str(BL) '%'];
                            set(handles.text4,'string',da);
                            disp(da)
                            break;
                   end 
                    
            end
              %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                           
                                            %评分
                                            QSD = enhanced_UCIQE_result - UCIQE_result;
                                            uemerge = [UCIQE_result enhanced_UCIQE_result];
                                            umax = max(uemerge);
                                            umin = min(uemerge);
                                            ulength = (umax-umin)/10;
                                            %确定x轴的范围
                                            img_num = count;
                                            x=1:1:img_num;%x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
                                            figure_zjxq = figure('name',strcat(algorithnm_name,'性能评测'))
                                            subplot(2,1,1)
                                            %用spcrv()函数画出平滑的曲线图
                                            values1=spcrv([[x(1) x x(end)];[UCIQE_result(1) UCIQE_result UCIQE_result(end)]],3);
                                            values2=spcrv([[x(1) x x(end)];[enhanced_UCIQE_result(1) enhanced_UCIQE_result enhanced_UCIQE_result(end)]],3);
                                            plot(values1(1,:),values1(2,:))
                                            hold on
                                            plot(values2(1,:),values2(2,:))
                                            hold on
                                            title('各幅图像增强前后的质量分数对比')
                                            axis([0,img_num,umin,umax])%确定x轴与y轴框图大小
                                            set(gca,'XTick',[0:1:img_num]) %x轴范围1~img_num，间隔1
                                            set(gca,'xticklabels',[0:1:img_num])%x轴范围
                                            set(gca,'YTick',[umin:ulength:umax]) %y轴范围
                                            legend('原图','增强后');   %右上角标注
                                            xlabel('图像序号')  %x轴坐标描述
                                            ylabel('图像质量分数') %y轴坐标描述
                                            %绘制柱状图
                                            %确定柱状图y轴的上下限
                                          %  figure('name','QSD')
                                            subplot(2,1,2)
                                            qmin = min(QSD);%qsd保存的是图像增强前后的质量分数差值
                                            qmax = max(QSD);
                                            qlength = (qmax-qmin)/10;
                                            bar(x,QSD)
                                            title('各幅图像增强前后的质量分数差值(QSD)')
                                            set(gca,'XTick',[0:1:img_num])%x轴范围
                                            set(gca,'YTick',[qmin:qlength:qmax]) %y轴范围
                                            xlabel('图像序号')  %x轴坐标描述
                                            ylabel('图像质量分数差值QSD') %y轴坐标描述
                                            %评分结束
                                            saveas(figure_zjxq,'zjxq.png');
                                            ZJXQ = imread('zjxq.png');
                                            axes(handles.axes16);
                                            imshow(ZJXQ);
            
    

% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


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