%im= imread('old.jpg');
im = imread('D:\YJSDZJS\OLDphoto\6.jpg');
o = UCIQE(im);
%o = UIQM(im);
%xlabel('ԭʼͼ��');
% subplot(2,2,1);
% imshow(im);
% xlabel('origin image');
%CLAHE�㷨��ǿЧ��
im1 = CLAHE_PF(im);
a = UCIQE(im1);
%a = UIQM(im1);

%HE�㷨��ǿЧ��
%im6 = HE(im);
%subplot(3,3,5);
%imshow(im6);
%xlabel('HE�㷨��ǿЧ��');

%���˲���ǿ�㷨��ǿЧ��
im2 = NLVB_PF(im);
b = UCIQE(im2);
%b = UIQM(im2);


%3C�㷨��ǿЧ��
im3 = Ancuti2018_PF(im);
c = UCIQE(im3);
%c =UIQM(im3);

%�Աȶ������㷨
im4 = DBDLS_PF(im);
%d = UCIQE(im4);
d = UIQM(im4);
%�޼ලģ����ǿ�㷨
im5 = UCM_PF(im);
e = UCIQE(im5);
%e = UIQM(im5);

%��ͼ
x=1:1:5;%x���ϵ����ݣ���һ��ֵ�������ݿ�ʼ���ڶ���ֵ��������������ֵ������ֹ
a1=[o,o,o,o,o]; %a����yֵ
b1=[a,b,c,d,e]; %b����yֵ
plot(x,a1,'-*b',x,b1,'--or'); %���ԣ���ɫ�����
axis([0,6,0,4])  %ȷ��x����y���ͼ��С
set(gca,'XTick',[0:1:6]) %x�᷶Χ1-7�����1
set(gca,'xticklabels',{'','a','b','c','d','e'})
set(gca,'YTick',[0:0.4:4]) %y�᷶Χ
legend('ԭͼ','��ǿ��');   %���ϽǱ�ע
xlabel('��ǿ�㷨')  %x����������
ylabel('��������') %y����������




