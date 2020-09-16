
% % -----------------------------------------------------
function nlvb = NLVB(img)
%file_path = 'D:\2019IEEEACCESS_CEQA\ͼ��R890\';% ͼ���ļ���·��
%img_path_list = dir(strcat(file_path,'*.png'));%��ȡ���ļ���������jpg��ʽ��ͼ��
%img_number = length(img_path_list);%��ȡͼ��������
%img_num = img_number;%�趨һ����; Դ������һ��ͼƬ��Ϊ�˲�����Ķ������ڻ����ϼ���һ���м����
%store_path = 'D:\2019IEEEACCESS_CEQA\ͼ��R890��ǿ���\���˲�\' ;%������ͼƬ�洢·��; 
%for i = 1:img_num %��һ��ȡͼ��
   % image_name = img_path_list(i).name;% ͼ���� 
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
    G_img=fspecial('gaussian',[3,3],2);%�˲�����С����׼ƫ�����Ϊ2
    Gimage=imfilter(I_img,G_img,'conv');%ģ��ͼ��

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
