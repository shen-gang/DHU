%function sfdb = SuanFaDuiBi(im)%�㷨�Ա�ͼ
clc;
clear all;
%close all;

%�����õ�һ��ͼ���в���������gammaУ�������ݱ�����input1.mat���񻯵����ݱ�����input2.mat��
im= imread('D:\YJSDZJS\����\old.jpg');
%im = imread('D:\2018TIP Color Balance Fusion\image\6.jpg');
figure, subplot(3,3,2);
imshow(im);
xlabel('ԭʼͼ��');
% subplot(2,2,1);
% imshow(im);
% xlabel('origin image');
%CLAHE�㷨��ǿЧ��
im5 = CLAHE(im);
subplot(3,3,4);
imshow(im5);
xlabel('CLAHE�㷨��ǿЧ��');

%HE�㷨��ǿЧ��
%im6 = HE(im);
%subplot(3,3,5);
%imshow(im6);
%xlabel('HE�㷨��ǿЧ��');

%���˲���ǿ�㷨��ǿЧ��
im7 = NLVB(im);
subplot(3,3,6);
imshow(im7);
xlabel('���˲��㷨��ǿЧ��');

%3C�㷨��ǿЧ��
im8 = Ancuti2018(im);
subplot(3,3,7);
imshow(im8);
xlabel('3C�㷨��ǿЧ��');


%�Աȶ������㷨
im10 = DBDLS(im);
subplot(3,3,8);
imshow(im10);
xlabel('�Աȶ������㷨��ǿЧ��');

%�޼ලģ����ǿ�㷨
im11 = UCM(im);
subplot(3,3,9);
imshow(im11);
xlabel('�޼ලģ����ǿ�㷨��ǿЧ��');
%end

