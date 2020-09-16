%function sfdb = SuanFaDuiBi(im)%算法对比图
clc;
clear all;
%close all;

%建议用第一张图进行测评，最终gamma校正的数据保存在input1.mat，锐化的数据保存在input2.mat中
im= imread('D:\YJSDZJS\界面\old.jpg');
%im = imread('D:\2018TIP Color Balance Fusion\image\6.jpg');
figure, subplot(3,3,2);
imshow(im);
xlabel('原始图像');
% subplot(2,2,1);
% imshow(im);
% xlabel('origin image');
%CLAHE算法增强效果
im5 = CLAHE(im);
subplot(3,3,4);
imshow(im5);
xlabel('CLAHE算法增强效果');

%HE算法增强效果
%im6 = HE(im);
%subplot(3,3,5);
%imshow(im6);
%xlabel('HE算法增强效果');

%逆滤波增强算法增强效果
im7 = NLVB(im);
subplot(3,3,6);
imshow(im7);
xlabel('逆滤波算法增强效果');

%3C算法增强效果
im8 = Ancuti2018(im);
subplot(3,3,7);
imshow(im8);
xlabel('3C算法增强效果');


%对比度拉伸算法
im10 = DBDLS(im);
subplot(3,3,8);
imshow(im10);
xlabel('对比度拉伸算法增强效果');

%无监督模型增强算法
im11 = UCM(im);
subplot(3,3,9);
imshow(im11);
xlabel('无监督模型增强算法增强效果');
%end

