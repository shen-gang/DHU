function I2 = ContrastStretch(I,x1,x2,y1,y2)
%���ܣ����ʵ��һ���Ҷ����촦��
% addr ΪҪ�����ͼƬ���ļ�����Ĭ��Ϊimages\sy1.jpg
% x1,y1,x2,y2 Ϊ���촦����߶ζ˵����꣬������С��5��ʱ
% ��Щ���������Ĭ��ֵ������ֱ�Ӱ� F5 ���С�
if nargin<5
    x1=28;y1=28;
    x2=75;y2=255;
end
if  x1==x2
    display('x1��x2������ͬ���˳�����');
    return ;
end

[r,c,n]=size(I);
k=(y1-y2)/(x1-x2);
b=y1-k*x1;
if n>1
    I2=rgb2gray(I);
else I2=I;
end
I2=double(I2);
for x=1:r
    for y=1:c
        tmp=I2(x,y);
        if tmp>=x1 && tmp<=x2
            I2(x,y)=k*tmp+b;
        end
    end
end
% subplot(1,2,1);imshow(I);title('original image ');
% subplot(1,2,2);imshow(I2,[]);title('image after modification');
