
% % -----------------------------------------------------
function nlvb = NLVB(img)
%file_path = 'D:\2019IEEEACCESS_CEQA\图像集R890\';% 图像文件夹路径
%img_path_list = dir(strcat(file_path,'*.png'));%获取该文件夹中所有jpg格式的图像
%img_number = length(img_path_list);%获取图像总数量
%img_num = img_number;%设定一个数; 源代码是一个图片，为了不做大改动，故在基础上加了一个中间变量
%store_path = 'D:\2019IEEEACCESS_CEQA\图像集R890增强结果\逆滤波\' ;%处理后的图片存储路径; 
%for i = 1:img_num %逐一读取图像
   % image_name = img_path_list(i).name;% 图像名 
   % A = imread(strcat(file_path,image_name));
   
    A = img;
    [h,w,c] = size(A);
    A1=rgb2hsi(A);  

    H = A1(:,:,1) ;
    S = A1(:,:,2);
    I = A1(:,:,3);

    HSI = zeros(h,w,c) ;
    HSI(:,:,1) = H ;
    HSI(:,:,2) = S ;

    I_img=I;
    G_img=fspecial('gaussian',[3,3],2);%滤波器大小，标准偏差参数为2
    Gimage=imfilter(I_img,G_img,'conv');%模糊图像

%     A1 = cat(3,H,S,Gimage)
%     A_rgb = hsi2rgb(A1)
%     figure;
% %   imshow(A_rgb)

    [j, p]=deconvblind(Gimage,G_img,10);
    A_refilter = cat(3,H,S,j);
    A_refilter_ = hsi2rgb(A_refilter);
    nlvb = A_refilter_;
  
%     figure;
%     imshow(A_refilter_)
   % imwrite(A_refilter_,[store_path,image_name])
end
