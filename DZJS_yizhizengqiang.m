clear ;
clc;  
select_path = uigetdir('','ѡ�����ͼƬ·����')
file_path = strcat(select_path,'\');
%file_path = 'D:\YJSDZJS\OLDphoto\';% ��ǿǰͼ���ļ���·��
store_path =  strcat( 'D:\YJSDZJS\','�޼ලģ����ǿ��\');  %��ǿ��ͼƬ�ļ��д��·��������

    if      exist(store_path)==0  %���ļ��в����ڣ���ֱ�Ӵ���
            mkdir(store_path);
    else                                            %���ļ��д��ڣ�����ɾ���ٴ���
            rmdir(store_path, 's');                %���ļ�������û���ļ�����
            mkdir(store_path);
    end

img_path_list = dir(strcat(file_path,'*.jpg'));%��ȡ���ļ���������jpg��ʽ��ͼ��
img_number = length(img_path_list);%��ȡͼ��������

for i =1:img_number    %���ȡ���ļ�
    
%   img_name=allnames{1,number} ;
    image_name = img_path_list(i).name;% ͼ����
    image= imread(strcat(file_path,image_name));
    result = UCM_Multi(image);                    %ʹ��UCM��ǿ�㷨
    imwrite(result, strcat(store_path,image_name))
end
%��ǿ�㷨����


%SCEA��ֿ�ʼ

image_path = file_path;                             %��ǿǰ ͼ���ļ���·��
img_path_list = dir(strcat(image_path,'*.jpg'));    %��ȡ���ļ���������jpg��ʽ��ͼ��
img_num = length(img_path_list);                    %��ȡͼ��������

enhanced_image_path = store_path;
mkdir(enhanced_image_path);
enhanced_image_path_list = dir(strcat(enhanced_image_path,'*.jpg'));%��ȡ���ļ���������jpg��ʽ��ͼ��

% % % % % % % % ��ԭʼͼ�񼯽�����������% % % % % % %
    UCIQE_result = zeros(1,img_number);
    enhanced_UCIQE_result = zeros(1,img_number);
%   UIQM_result = zeros(1,5);
 %entropy_result = zeros(1,10);
 figure('name','��ǿ�㷨Ч��');
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
        subplot(2,3,i);
        imshow(enhanced_image)
        xlabel('���������ˣ�','color','r');
    else
    subplot(2,3,i);
    imshow(enhanced_image);
    end   
        
end
    %UIQM_result(i) = UIQM(image);
    %entropy_result(i) = entropy(image);

   a = UCIQE_result;
   b = enhanced_UCIQE_result;
   
%  b = enhanced_UIQM_result
%  b = enhanced_entropy_result;
%   MEAN_b = mean(b)


%��ʼ�����ֵ�����

QSD = b-a;
average_QSD = mean(QSD);
std_QSD = std(QSD,1);
Lambda = 2;
Epsilon = Lambda*std_QSD;
left_point = average_QSD-Epsilon;
right_point = average_QSD+Epsilon;
valid_Data = QSD(QSD>=left_point&QSD<=right_point);

if valid_Data>0
    fprintf('�ڸ��������۷����£�����ǿ����Ϊһ����ǿ����')
    
    min_QSD = min(valid_Data);
    ave_QSD = mean(valid_Data);
    CEQA_eff = 1/2*ave_QSD + 1/2*min_QSD;
    disp(CEQA_eff);
else
    fprintf('�ڸ��������۷����£�����ǿ����Ϊ��һ������ǿ')
end 


   
