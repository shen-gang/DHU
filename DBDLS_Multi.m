
function dbdls = DBDLS(img)
    

    RGBimg= img;

    img_ori = double(RGBimg) ;
    [h, w, c] = size(img_ori) ;
    
    R= img_ori(:,:,1) ;
    G= img_ori(:,:,2) ;    
    B= img_ori(:,:,3) ;
   

% % % -------------对比度拉伸---------------------% %
    reR = reshape(R,h*w,1) ;
    reG = reshape(G,h*w,1) ;
    reB = reshape(B,h*w,1) ;

    [sort_R,index_R] = sort(reR, 'ascend') ;
    [sort_G,index_G] = sort(reG, 'ascend') ;
    [sort_B,index_B] = sort(reB, 'ascend') ;
    
    cutRate = 0.002; %%裁剪比例
    limit = round(cutRate*h*w) ;
    
    R_stretch = ContrastStretch(R, sort_R(1),sort_R(h*w-limit),sort_G(limit),sort_B(h*w)) ;
    G_stretch = ContrastStretch(G, sort_G(limit),sort_R(h*w),sort_R(limit),sort_B(h*w-limit)) ;
    B_stretch = ContrastStretch(B, sort_B(1),sort_B(h*w),sort_R(1),sort_B(h*w-limit)) ;
    
    RGB_stretch = zeros(h,w,c,'double') ;
    RGB_stretch(:,:,1) = R_stretch ;
    RGB_stretch(:,:,2) = G_stretch ;
    RGB_stretch(:,:,3) = B_stretch ;
    dbdls = uint8(RGB_stretch);
  
    %imwrite(uint8(RGB_stretch), strcat(store_path,image_name))
end