# 水下图像一致性增强软件

DONGHUA UNIVERSITY

开发平台：Mtalab R2018a

## 使用须知：

下载全部文件后放在同一个文件夹目录下，Main.m为程序入口，test.png为测试图片，可用于测试单幅模块

## 主要分成3个功能模块：

单幅图像增强分析，双幅图像增强分析，多幅图像增强分析

单幅图像增强分析功能主要提供单一图像增强处理以及增强算法的性能评测功能。软件提供多种算法可供用户选择，当选取单一算法时，用户可对自由选择的图像进行增强并得到增强后的图像；若用户想查看现有算法的增强效果对比分析，可选择全部算法对图像进行增强，可以得到图像在各种算法增强后的对比图。若想更为客观地分析各种算法的增强性能可选择算法性能评测，系统将通过UCIQE质量评价准则对算法增强后的图像进行打分，根据分值的高低，用户可以针对图像选取较为合适的增强算法。

双幅图像增强分析功能:主要提供相似的两幅图像进行SURF特征点匹配功能，其中有效匹配特征点的个数越多，算法匹配效果越高。作品提供了原始图像匹配与增强图像匹配功能，用户既可以选择仅对原始的相似图像进行特征匹配，也可以选择增强算法对原始图像进行增强，提高图像的匹配效果。其中在算法选取上，用户可以通过对比增强前后图像有效匹配点个数，选取有利于提升图像匹配性能的增强算法。

图像集分析功能主要可以针对图像集进行统一的增强分析，共有三个子功能：图像集增强、图像集增强性能评测、子集自适应选取。其中图像集增强功能使用增强算法对所选图像集进行统一增强、通过UCIQE准则计算每幅图像增强前后质量分数差值，并将增强后质量降低的图像标志出来，给出增强算法在图像集增强效果上的主观展示以及客观数据化性能评测，子集选取功能通过动态选取算法，为大型图像集选取鲁棒的一致性增强算法。



## 图像分析仪主界面

![1601008847296](C:\Users\沈港\AppData\Roaming\Typora\typora-user-images\1601008847296.png)



## 单幅图像增强分析界面

![1601009083663](C:\Users\沈港\AppData\Roaming\Typora\typora-user-images\1601009083663.png)

![1601009092096](C:\Users\沈港\AppData\Roaming\Typora\typora-user-images\1601009092096.png)

![1601009106081](C:\Users\沈港\AppData\Roaming\Typora\typora-user-images\1601009106081.png)



![1601009122479](C:\Users\沈港\AppData\Roaming\Typora\typora-user-images\1601009122479.png)





## 双幅图像增强分析模块



![1601009145668](C:\Users\沈港\AppData\Roaming\Typora\typora-user-images\1601009145668.png)

![1601009178294](C:\Users\沈港\AppData\Roaming\Typora\typora-user-images\1601009178294.png)

![1601009213267](C:\Users\沈港\AppData\Roaming\Typora\typora-user-images\1601009213267.png)



## 图像集增强分析模块

![1601009236146](C:\Users\沈港\AppData\Roaming\Typora\typora-user-images\1601009236146.png)



![1601009274703](C:\Users\沈港\AppData\Roaming\Typora\typora-user-images\1601009274703.png)



![1601009281296](C:\Users\沈港\AppData\Roaming\Typora\typora-user-images\1601009281296.png)



![1601009309505](C:\Users\沈港\AppData\Roaming\Typora\typora-user-images\1601009309505.png)

![1601009316026](C:\Users\沈港\AppData\Roaming\Typora\typora-user-images\1601009316026.png)