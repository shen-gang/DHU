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
%���ļ���

select_path = uigetdir('','ѡ�����ͼƬ·����');
     if isequal(select_path,0)
      errordlg('û��ѡ���ļ�','����');
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
h = warndlg('������ǿͼƬ�����Ժ�','��ʾ');
 
    file_path = get(handles.pushbutton3,'String');
    val= get(handles.popupmenu1,'value');
    if (val==1) 
                algorithnm_name = '3C�㷨';    
     elseif (val==2)
              
                algorithnm_name = 'CLAHE�㷨'; 
    elseif (val==3)
                 
                 algorithnm_name = '�Աȶ������㷨'; 
    elseif (val==4)
               
                algorithnm_name = '���˲��㷨'; 
     elseif (val==5)
                
                algorithnm_name = '�޼ලģ���㷨';
%      elseif (val==6)
%                 
%                 algorithnm_name = '��ʦ�㷨';
    end
    %����ͼ����ǿ��洢�ļ���
    store_path =  strcat( file_path,algorithnm_name,'��ǿ��\');
                if  exist(store_path)==0  %���ļ��в����ڣ���ֱ�Ӵ���
                    mkdir(store_path);
                else                                                 %���ļ��д��ڣ�����ɾ���ٴ���
                    rmdir(store_path, 's');                %���ļ�������û���ļ�����
                    mkdir(store_path);
                end
                
    img_path_list = dir(strcat(file_path,'*.png'));%��ȡ���ļ���������jpg��ʽ��ͼ��
    img_number = length(img_path_list);%��ȡͼ��������
    for i =1:img_number    %���ȡ���ļ�
%     img_name=allnames{1,number} ;
    image_name = img_path_list(i).name;% ͼ����
    image= imread(strcat(file_path,image_name));
            %ʹ���㷨��ǿͼ��
            if (val==1)
                    result =  Ancuti2018_Multi(image);                   %ʹ��Ancuti2018��ǿ�㷨
            elseif (val==2)
                    result =  CLAHE_Multi(image);                       %ʹ��Ancuti2018��ǿ�㷨                     
            elseif (val==3)
                    result =  DBDLS_Multi(image);                       %ʹ�öԱȶ������㷨
            elseif (val==4)
                    result =  NLVB_Multi(image);                        %ʹ�����˲��㷨
            elseif (val==5)
                    result =  UCM_Multi(image);                         %ʹ��UCM�㷨
            elseif(val==6)
                    result =  UCM_Multi(image);                         %��ʦ���㷨
            end
    imwrite(result, strcat(store_path,image_name))
    end
%��ǿ�㷨����
%��ƴ��·��
    image_path = file_path;                             %��ǿǰ ͼ���ļ���·��
    img_path_list = dir(strcat(image_path,'*.png'));    %��ȡ���ļ���������jpg��ʽ��ͼ��
    img_num = length(img_path_list);                    %��ȡͼ��������
    enhanced_image_path = store_path;
    mkdir(enhanced_image_path);
    enhanced_image_path_list = dir(strcat(enhanced_image_path,'*.png'));%��ȡ���ļ���������jpg��ʽ��ͼ��

% % % % % % % % ��ԭʼͼ�񼯽�����������% % % % % % %
    UCIQE_result = zeros(1,img_number);
    enhanced_UCIQE_result = zeros(1,img_number);

    figure1 = figure('name',strcat(algorithnm_name,'��ǿЧ��'));
    for i = 1:img_num %��һ��ȡͼ��
    %��ǿǰͼ������
    image_name = img_path_list(i).name;% ͼ����  
    image= imread(strcat(image_path,image_name));
    uciqe_old = UCIQE(image);

    UCIQE_result(i) = uciqe_old;
    %��ǿ��ͼ������
    enhanced_image_name = enhanced_image_path_list(i).name;% ͼ����            
    enhanced_image= imread(strcat(enhanced_image_path,enhanced_image_name));
    uciqe_new = UCIQE(enhanced_image);
    enhanced_UCIQE_result(i) = uciqe_new;
    q = uciqe_new -  uciqe_old;     %��ǿǰ��÷ֲ�
    if q <0
        subplot(img_number/5,5,i);
        imshow(enhanced_image)
        xlabel('���������ˣ�','color','r');
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
    
            %fprintf('�ڸ��������۷����£�����ǿ����Ϊһ����ǿ����')
            min_QSD = min(valid_Data);
            ave_QSD = mean(valid_Data);
            CEQA_eff = 1/2*ave_QSD + 1/2*min_QSD;
            
            da = [strcat(algorithnm_name,'����ѡͼ����Ϊһ������ǿ�㷨��������ǿ����Ϊ:') num2str(CEQA_eff)];
            set(handles.text4,'string',da);
            disp(da);
        else
            da = [strcat(algorithnm_name,'����ѡͼ����Ϊ��һ������ǿ�㷨')];
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
 h = warndlg('���ڽ��з������⣬���Ժ�','��ʾ');
 val= get(handles.popupmenu1,'value');
   
    file_path = get(handles.pushbutton3,'String');
     if (val==1) 
                algorithnm_name = '3C�㷨';    
     elseif (val==2)
                option=2;
                algorithnm_name = 'CLAHE�㷨'; 
    elseif (val==3)
                 option=3;
                 algorithnm_name = '�Աȶ������㷨'; 
    elseif (val==4)
                option=4;
                algorithnm_name = '���˲��㷨'; 
     elseif (val==5)
                option=5;
                algorithnm_name = '�޼ලģ���㷨';
%      elseif get(handles.radiobutton6,'value')
%                 option=6;
%                 algorithnm_name = '��ʦ�㷨';
    end
    %����ͼ����ǿ��洢�ļ���
    store_path =  strcat( file_path,algorithnm_name,'��ǿ��\');
                if      exist(store_path)==0  %���ļ��в����ڣ���ֱ�Ӵ���
                    mkdir(store_path);
                else                                                 %���ļ��д��ڣ�����ɾ���ٴ���
                    rmdir(store_path, 's');                %���ļ�������û���ļ�����
                    mkdir(store_path);
                end
                
    img_path_list = dir(strcat(file_path,'*.png'));%��ȡ���ļ���������jpg��ʽ��ͼ��
    img_number = length(img_path_list);%��ȡͼ��������
    for i =1:img_number    %���ȡ���ļ�
%     img_name=allnames{1,number} ;
    image_name = img_path_list(i).name;% ͼ����
    image= imread(strcat(file_path,image_name));
            %ʹ���㷨��ǿͼ��
            if (val==1)
                    result = Ancuti2018_Multi(image);                    %ʹ��Ancuti2018��ǿ�㷨
            elseif (val==2)
                    result =  CLAHE_Multi(image);                       %ʹ��Ancuti2018��ǿ�㷨                     
            elseif (val==3)
                    result =  DBDLS_Multi(image);                       %ʹ�öԱȶ������㷨
            elseif (val==4)
                    result =  NLVB_Multi(image);                        %ʹ�����˲��㷨
            elseif (val==5)
                    result =  UCM_Multi(image);                         %ʹ��UCM�㷨
%             elseif get(handles.radiobutton6,'value')
%                     result =  UCM_Multi(image);                         %��ʦ���㷨
            end
    imwrite(result, strcat(store_path,image_name))
    end
%��ǿ�㷨����
%��ƴ��·��
    image_path = file_path;                             %��ǿǰ ͼ���ļ���·��
    img_path_list = dir(strcat(image_path,'*.png'));    %��ȡ���ļ���������jpg��ʽ��ͼ��
    img_num = length(img_path_list);                    %��ȡͼ��������
    enhanced_image_path = store_path;
    mkdir(enhanced_image_path);
    enhanced_image_path_list = dir(strcat(enhanced_image_path,'*.png'));%��ȡ���ļ���������jpg��ʽ��ͼ��

% % % % % % % % ��ԭʼͼ�񼯽�����������% % % % % % %
    UCIQE_result = zeros(1,img_number);
    enhanced_UCIQE_result = zeros(1,img_number);

    for i = 1:img_num %��һ��ȡͼ��
    %��ǿǰͼ������
    image_name = img_path_list(i).name;% ͼ����  
    image= imread(strcat(image_path,image_name));
    uciqe_old = UCIQE(image);
    UCIQE_result(i) = uciqe_old;
    %��ǿ��ͼ������
     enhanced_image_name = enhanced_image_path_list(i).name;% ͼ����            
    enhanced_image= imread(strcat(enhanced_image_path,enhanced_image_name));
    uciqe_new = UCIQE(enhanced_image);
    enhanced_UCIQE_result(i) = uciqe_new;
    end
%��ǿ�㷨����
    
%��������ͼ
    %ȷ��y�����ޣ����ޣ�����
    QSD = enhanced_UCIQE_result - UCIQE_result;
    uemerge = [UCIQE_result enhanced_UCIQE_result];
    umax = max(uemerge);
    umin = min(uemerge);
    ulength = (umax-umin)/10;
    %ȷ��x��ķ�Χ
    x=1:1:img_num;%x���ϵ����ݣ���һ��ֵ�������ݿ�ʼ���ڶ���ֵ��������������ֵ������ֹ
    figure('name',strcat(algorithnm_name,'��������'))
    subplot(2,1,1)
    %��spcrv()��������ƽ��������ͼ
    values1=spcrv([[x(1) x x(end)];[UCIQE_result(1) UCIQE_result UCIQE_result(end)]],3);
    values2=spcrv([[x(1) x x(end)];[enhanced_UCIQE_result(1) enhanced_UCIQE_result enhanced_UCIQE_result(end)]],3);
    plot(values1(1,:),values1(2,:))
    hold on
    plot(values2(1,:),values2(2,:))
    hold on
    title('����ͼ����ǿǰ������������Ա�')
    axis([0,img_num,umin,umax])%ȷ��x����y���ͼ��С
    set(gca,'XTick',[0:1:img_num]) %x�᷶Χ1~img_num�����1
    set(gca,'xticklabels',[0:1:img_num])%x�᷶Χ
    set(gca,'YTick',[umin:ulength:umax]) %y�᷶Χ
    legend('ԭͼ','��ǿ��');   %���ϽǱ�ע
    xlabel('ͼ�����')  %x����������
    ylabel('ͼ����������') %y����������
    %������״ͼ
    %ȷ����״ͼy���������
  %  figure('name','QSD')
    subplot(2,1,2)
    qmin = min(QSD);%qsd�������ͼ����ǿǰ�������������ֵ
    qmax = max(QSD);
    qlength = (qmax-qmin)/10;
    bar(x,QSD)
    title('����ͼ����ǿǰ�������������ֵ(QSD)')
    set(gca,'XTick',[0:1:img_num])%x�᷶Χ
    set(gca,'YTick',[qmin:qlength:qmax]) %y�᷶Χ
    xlabel('ͼ�����')  %x����������
    ylabel('ͼ������������ֵQSD') %y����������
    
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

%�Ӽ�����Ӧѡȡ
% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
h = warndlg('���ڽ����Ӽ�ѡȡ�����Ժ�','��ʾ');
 val= get(handles.popupmenu1,'value');
   
    file_path = get(handles.pushbutton3,'String');
     if (val==1) 
                algorithnm_name = '3C�㷨';    
     elseif (val==2)
                option=2;
                algorithnm_name = 'CLAHE�㷨'; 
    elseif (val==3)
                 option=3;
                 algorithnm_name = '�Աȶ������㷨'; 
    elseif (val==4)
                option=4;
                algorithnm_name = '���˲��㷨'; 
     elseif (val==5)
                option=5;
                algorithnm_name = '�޼ලģ���㷨';
%      elseif get(handles.radiobutton6,'value')
%                 option=6;
%                 algorithnm_name = '��ʦ�㷨';
    end
    %����ͼ����ǿ��洢�ļ���
%     store_path =  strcat( file_path,algorithnm_name,'��ǿ��\');
%                 if      exist(store_path)==0  %���ļ��в����ڣ���ֱ�Ӵ���
%                     mkdir(store_path);
%                 else                                                 %���ļ��д��ڣ�����ɾ���ٴ���
%                     rmdir(store_path, 's');                %���ļ�������û���ļ�����
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
             UCIQE_result = [];%�洢ԭʼͼ��÷�
             enhanced_UCIQE_result = [];%�洢��ǿͼ��÷�
            img_path_list = dir(strcat(file_path,'*.png'));%  ��ȡ��ʼpng��ʽ��ͼ��
            img_number = length(img_path_list);%��ȡͼ��������
             p=randperm(img_number); 
             t=p(1:NUM);  
             

            for i =1:NUM    %���ȡ���ļ�
                M = t(i);
                count = count + 1;
        %     img_name=allnames{1,number} ;
            image_name = img_path_list(M).name;% ͼ����
            image= imread(strcat(file_path,image_name));
            uciqe_old = UCIQE(image);
            UCIQE_result = [UCIQE_result uciqe_old];
            %ʹ���㷨��ǿͼ��
            if (val==1)
                    result = Ancuti2018_Multi(image);                    %ʹ��Ancuti2018��ǿ�㷨
            elseif (val==2)
                    result =  CLAHE_Multi(image);                       %ʹ��Ancuti2018��ǿ�㷨                     
            elseif (val==3)
                    result =  DBDLS_Multi(image);                       %ʹ�öԱȶ������㷨
            elseif (val==4)
                    result =  NLVB_Multi(image);                        %ʹ�����˲��㷨
            elseif (val==5)
                    result =  UCM_Multi(image);                         %ʹ��UCM�㷨             
            end  
                         %�Ӽ�����Ӧѡȡ��ʼ
                        imwrite(result,'ZDXQ.png');
                        enhanced_image = imread('ZDXQ.png');
                        uciqe_new = UCIQE(enhanced_image);                      %����ǿ��ͼ����
                        enhanced_UCIQE_result = [enhanced_UCIQE_result uciqe_new];
                        QSD_single = uciqe_new - uciqe_old;                     %�õ���ǿǰ��ķ�����
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
                            %����ѧ���ֲ�
                            std_CEQA_eff = std(CEQA_eff_all,1);
                            student = tinv(1-alpha/2,count);
                            derta = student*std_CEQA_eff/sqrt(count);
                            derta_a = [derta_a derta];
                            BL = (double(count)/img_number) * 100;
                                     if count>=10
                                        if( derta>0&&derta<0.005)
                                            
                                           da = [strcat(algorithnm_name,'����ѡͼ����Ϊһ������ǿ�㷨��������ǿ����Ϊ:') num2str(CEQA_eff) ',ѡȡ�Ӽ�����Ϊ:' num2str(BL) '%'];
                                            set(handles.text4,'string',da);
                                            disp(da);
                                        break;
                                        end 
                                     end       
                   else
                            
                            da = [strcat(algorithnm_name,'����ѡͼ��Ϊ��һ������ǿ�㷨') ',ѡȡ�Ӽ�����Ϊ:' num2str(BL) '%'];
                            set(handles.text4,'string',da);
                            disp(da)
                            break;
                   end 
                    
            end
              %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                           
                                            %����
                                            QSD = enhanced_UCIQE_result - UCIQE_result;
                                            uemerge = [UCIQE_result enhanced_UCIQE_result];
                                            umax = max(uemerge);
                                            umin = min(uemerge);
                                            ulength = (umax-umin)/10;
                                            %ȷ��x��ķ�Χ
                                            img_num = count;
                                            x=1:1:img_num;%x���ϵ����ݣ���һ��ֵ�������ݿ�ʼ���ڶ���ֵ��������������ֵ������ֹ
                                            figure_zjxq = figure('name',strcat(algorithnm_name,'��������'))
                                            subplot(2,1,1)
                                            %��spcrv()��������ƽ��������ͼ
                                            values1=spcrv([[x(1) x x(end)];[UCIQE_result(1) UCIQE_result UCIQE_result(end)]],3);
                                            values2=spcrv([[x(1) x x(end)];[enhanced_UCIQE_result(1) enhanced_UCIQE_result enhanced_UCIQE_result(end)]],3);
                                            plot(values1(1,:),values1(2,:))
                                            hold on
                                            plot(values2(1,:),values2(2,:))
                                            hold on
                                            title('����ͼ����ǿǰ������������Ա�')
                                            axis([0,img_num,umin,umax])%ȷ��x����y���ͼ��С
                                            set(gca,'XTick',[0:1:img_num]) %x�᷶Χ1~img_num�����1
                                            set(gca,'xticklabels',[0:1:img_num])%x�᷶Χ
                                            set(gca,'YTick',[umin:ulength:umax]) %y�᷶Χ
                                            legend('ԭͼ','��ǿ��');   %���ϽǱ�ע
                                            xlabel('ͼ�����')  %x����������
                                            ylabel('ͼ����������') %y����������
                                            %������״ͼ
                                            %ȷ����״ͼy���������
                                          %  figure('name','QSD')
                                            subplot(2,1,2)
                                            qmin = min(QSD);%qsd�������ͼ����ǿǰ�������������ֵ
                                            qmax = max(QSD);
                                            qlength = (qmax-qmin)/10;
                                            bar(x,QSD)
                                            title('����ͼ����ǿǰ�������������ֵ(QSD)')
                                            set(gca,'XTick',[0:1:img_num])%x�᷶Χ
                                            set(gca,'YTick',[qmin:qlength:qmax]) %y�᷶Χ
                                            xlabel('ͼ�����')  %x����������
                                            ylabel('ͼ������������ֵQSD') %y����������
                                            %���ֽ���
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
w = warning('query','last')  %���㱨warning�����д���������������
id = w.identifier;           %�õ����warning��Ψһ��ʶ��
warning('off',id)
set(javaFrame,'Maximized',1);