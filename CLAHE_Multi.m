function clahe = CLAHE(img) 

%file_path = 'D:\2018TIP Color Balance Fusion\image\';% ͼ���ļ���·��
%img_path_list = dir(strcat(file_path,'8.jpg'));%��ȡ���ļ�����8,jpg��ͼ��
%img_number = length(img_path_list);%��ȡͼ��������
% store_path = 'D:\2018TIP Color Balance Fusion\image\CLAHE\'; 
% mkdir(store_path);

%for i =1 : img_number    %���ȡ���ļ�
    
%   img_name=allnames{1,number} ;
   %image_name = img_path_list.name;% ͼ����
   % RGBimg= imread(strcat(file_path,image_name));
   
     RGBimg = img;
  
    img_ori = double(RGBimg) ;
    [h, w, c] = size(img_ori) ;
    clip_limit = 0.03 ;%����ֱ��ͼ�ü�����
    tile_num = [round(h/100),round(w/100)] ;%%�ֿ���
%     tile_num  = [6,8] ;
    if tile_num(1)<2
        tile_num(1)=2;
    end
    if tile_num(2)<2
        tile_num(2)=2;
    end
    
%     %%%%%----------��ͨ������-------------------%%
%     RGB_clahe = zeros(h,w,c,'double') ;
%     RGB_clahe(:,:,1) = adapthisteq(R,'NumTiles', tile_num,'ClipLimit',clip_limit);
%     RGB_clahe(:,:,2) = adapthisteq(G,'NumTiles', tile_num,'ClipLimit',clip_limit);
%     RGB_clahe(:,:,3) = adapthisteq(B,'NumTiles', tile_num,'ClipLimit',clip_limit);
%     %%%%%---------------------------------------------------------------------
    
    %%%%--------��hsv�ռ���о���------------%%
    hsv_img=rgb2hsv(RGBimg);
    hsv_img(:,:,3) = adapthisteq(hsv_img(:,:,3),'NumTiles', tile_num,'ClipLimit',clip_limit);
    RGB_clahe=hsv2rgb(hsv_img);
    clahe =  RGB_clahe;%��ǿ�õ���ͼ��
   
    %imwrite(RGB_clahe, strcat(store_path,image_name))
end
%end