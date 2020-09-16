function fusion = Ancuti2018(img)

%建议用第一张图进行测评，最终gamma校正的数据保存在input1.mat，锐化的数据保存在input2.mat中
% 红色通道补充

im1 = redCompensate(img,5);
% figure, subplot(2,2,1)
% imshow(im1);
% xlabel('red channel compensate');

% 蓝色通道补充，在浑浊水域或者高水位或者浮游生物的大量存在，导致蓝色通道衰减强烈时，对蓝色通道进行补充
% im1 = blueCompensate(im1);
% subplot(2,3,3)
% imshow(im1);
% xlabel('blue channel compensate')

% 灰度世界变换
im2 = simple_color_balance(im1);
% subplot(2,2,2)
% imshow(im2);
% xlabel('white balance');

% 伽马校正
input1 = gammaCorrection(im2,1,1.2);
% subplot(2,2,3)
% imshow(input1);
% xlabel('gamma correction');

% 锐化
input2 = sharp(im2);
% subplot(2,2,4)
% imshow(input2);
% xlabel('sharp');

%.................................................%
% calculate weight
%.................................................%
lab1 = rgb_to_lab(input1);
lab2 = rgb_to_lab(input2);
R1 = double(lab1(:, :, 1)/255);
R2 = double(lab2(:, :, 1)/255);

% 1. Laplacian contrast weight (Laplacian filiter on input luminance channel)
WL1 = abs(imfilter(R1, fspecial('Laplacian'), 'replicate', 'conv')); 
WL2 = abs(imfilter(R2, fspecial('Laplacian'), 'replicate', 'conv')); 

% 2. Saliency weight
WS1 = saliency_detection(input1);
WS2 = saliency_detection(input2);

% 3. Saturation weight
WSat1 = Saturation_weight(input1);
WSat2 = Saturation_weight(input2);

% normalized weight
[W1, W2] = norm_weight(WL1, WS1, WSat1, WL2 , WS2, WSat2);

%.................................................%
% image fusion
% R(x,y) = sum G{W} * L{I}
%.................................................%
level = 3;

% weight gaussian pyramid
Weight1 = gaussian_pyramid(W1, level);
Weight2 = gaussian_pyramid(W2, level);

% image laplacian pyramid
% input1
r1 = laplacian_pyramid(double(double(input1(:, :, 1))), level);
g1 = laplacian_pyramid(double(double(input1(:, :, 2))), level);
b1 = laplacian_pyramid(double(double(input1(:, :, 3))), level);
% input2
r2 = laplacian_pyramid(double(double(input2(:, :, 1))), level);
g2 = laplacian_pyramid(double(double(input2(:, :, 2))), level);
b2 = laplacian_pyramid(double(double(input2(:, :, 3))), level);

% fusion
for i = 1 : level
    R_r{i} = Weight1{i} .* r1{i} + Weight2{i} .* r2{i};
    G_g{i} = Weight1{i} .* g1{i} + Weight2{i} .* g2{i};
    B_b{i} = Weight1{i} .* b1{i} + Weight2{i} .* b2{i};
end

% pyramin reconstruct
R = pyramid_reconstruct(R_r);
G = pyramid_reconstruct(G_g);
B = pyramid_reconstruct(B_b);

fusion = cat(3, R,G,B);

% uiqm = UIQM(fusion)
% uciqe = UCIQE(fusion)

% figure,imshow(fusion),title("fusion image");
% imwrite(fusion, '8.jpg');

end