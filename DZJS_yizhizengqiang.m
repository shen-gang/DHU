clear ;
clc;  
select_path = uigetdir('','选择测试图片路径：')
file_path = strcat(select_path,'\');
%file_path = 'D:\YJSDZJS\OLDphoto\';% 增强前图像文件夹路径
store_path =  strcat( 'D:\YJSDZJS\','无监督模型增强后\');  %增强后图片文件夹存放路径及名字

    if      exist(store_path)==0  %该文件夹不存在，则直接创建
            mkdir(store_path);
    else                                            %该文件夹存在，则先删除再创建
            rmdir(store_path, 's');                %该文件夹中有没有文件均可
            mkdir(store_path);
    end

img_path_list = dir(strcat(file_path,'*.jpg'));%获取该文件夹中所有jpg格式的图像
img_number = length(img_path_list);%获取图像总数量

for i =1:img_number    %逐次取出文件
    
%   img_name=allnames{1,number} ;
    image_name = img_path_list(i).name;% 图像名
    image= imread(strcat(file_path,image_name));
    result = UCM_Multi(image);                    %使用UCM增强算法
    imwrite(result, strcat(store_path,image_name))
end
%增强算法结束


%SCEA打分开始

image_path = file_path;                             %增强前 图像文件夹路径
img_path_list = dir(strcat(image_path,'*.jpg'));    %获取该文件夹中所有jpg格式的图像
img_num = length(img_path_list);                    %获取图像总数量

enhanced_image_path = store_path;
mkdir(enhanced_image_path);
enhanced_image_path_list = dir(strcat(enhanced_image_path,'*.jpg'));%获取该文件夹中所有jpg格式的图像

% % % % % % % % 对原始图像集进行质量评价% % % % % % %
    UCIQE_result = zeros(1,img_number);
    enhanced_UCIQE_result = zeros(1,img_number);
%   UIQM_result = zeros(1,5);
 %entropy_result = zeros(1,10);
 figure('name','增强算法效果');
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
        subplot(2,3,i);
        imshow(enhanced_image)
        xlabel('质量降低了！','color','r');
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


%开始处理打分的数据

QSD = b-a;
average_QSD = mean(QSD);
std_QSD = std(QSD,1);
Lambda = 2;
Epsilon = Lambda*std_QSD;
left_point = average_QSD-Epsilon;
right_point = average_QSD+Epsilon;
valid_Data = QSD(QSD>=left_point&QSD<=right_point);

if valid_Data>0
    fprintf('在该质量评价方法下，此增强方法为一致增强方法')
    
    min_QSD = min(valid_Data);
    ave_QSD = mean(valid_Data);
    CEQA_eff = 1/2*ave_QSD + 1/2*min_QSD;
    disp(CEQA_eff);
else
    fprintf('在该质量评价方法下，此增强方法为非一致性增强')
end 


   
