%im= imread('old.jpg');
im = imread('D:\YJSDZJS\OLDphoto\6.jpg');
o = UCIQE(im);
%o = UIQM(im);
%xlabel('原始图像');
% subplot(2,2,1);
% imshow(im);
% xlabel('origin image');
%CLAHE算法增强效果
im1 = CLAHE_PF(im);
a = UCIQE(im1);
%a = UIQM(im1);

%HE算法增强效果
%im6 = HE(im);
%subplot(3,3,5);
%imshow(im6);
%xlabel('HE算法增强效果');

%逆滤波增强算法增强效果
im2 = NLVB_PF(im);
b = UCIQE(im2);
%b = UIQM(im2);


%3C算法增强效果
im3 = Ancuti2018_PF(im);
c = UCIQE(im3);
%c =UIQM(im3);

%对比度拉伸算法
im4 = DBDLS_PF(im);
%d = UCIQE(im4);
d = UIQM(im4);
%无监督模型增强算法
im5 = UCM_PF(im);
e = UCIQE(im5);
%e = UIQM(im5);

%绘图
x=1:1:5;%x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
a1=[o,o,o,o,o]; %a数据y值
b1=[a,b,c,d,e]; %b数据y值
plot(x,a1,'-*b',x,b1,'--or'); %线性，颜色，标记
axis([0,6,0,4])  %确定x轴与y轴框图大小
set(gca,'XTick',[0:1:6]) %x轴范围1-7，间隔1
set(gca,'xticklabels',{'','a','b','c','d','e'})
set(gca,'YTick',[0:0.4:4]) %y轴范围
legend('原图','增强后');   %右上角标注
xlabel('增强算法')  %x轴坐标描述
ylabel('质量分数') %y轴坐标描述




