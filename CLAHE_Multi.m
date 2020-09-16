function clahe = CLAHE(img) 

%file_path = 'D:\2018TIP Color Balance Fusion\image\';% 图像文件夹路径
%img_path_list = dir(strcat(file_path,'8.jpg'));%获取该文件夹中8,jpg的图像
%img_number = length(img_path_list);%获取图像总数量
% store_path = 'D:\2018TIP Color Balance Fusion\image\CLAHE\'; 
% mkdir(store_path);

%for i =1 : img_number    %逐次取出文件
    
%   img_name=allnames{1,number} ;
   %image_name = img_path_list.name;% 图像名
   % RGBimg= imread(strcat(file_path,image_name));
   
     RGBimg = img;
  
    img_ori = double(RGBimg) ;
    [h, w, c] = size(img_ori) ;
    clip_limit = 0.03 ;%设置直方图裁剪上限
    tile_num = [round(h/100),round(w/100)] ;%%分块数
%     tile_num  = [6,8] ;
    if tile_num(1)<2
        tile_num(1)=2;
    end
    if tile_num(2)<2
        tile_num(2)=2;
    end
    
%     %%%%%----------分通道均衡-------------------%%
%     RGB_clahe = zeros(h,w,c,'double') ;
%     RGB_clahe(:,:,1) = adapthisteq(R,'NumTiles', tile_num,'ClipLimit',clip_limit);
%     RGB_clahe(:,:,2) = adapthisteq(G,'NumTiles', tile_num,'ClipLimit',clip_limit);
%     RGB_clahe(:,:,3) = adapthisteq(B,'NumTiles', tile_num,'ClipLimit',clip_limit);
%     %%%%%---------------------------------------------------------------------
    
    %%%%--------在hsv空间进行均衡------------%%
    hsv_img=rgb2hsv(RGBimg);
    hsv_img(:,:,3) = adapthisteq(hsv_img(:,:,3),'NumTiles', tile_num,'ClipLimit',clip_limit);
    RGB_clahe=hsv2rgb(hsv_img);
    clahe =  RGB_clahe;%增强得到的图像
   
    %imwrite(RGB_clahe, strcat(store_path,image_name))
end
%end