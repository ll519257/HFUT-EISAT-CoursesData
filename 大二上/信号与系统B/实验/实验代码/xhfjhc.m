% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02
clear
clf reset
str= ' 非正弦周期信号的分解与合成 ' ;
set(gcf, 'name' ,str,'unit' , 'normalized' , 'color',[0.7 0.7 0.9],'numbertitle' , 'off','position' ,[0.18,0.2,0.65,0.5] ); % 书写图形窗名

h_text=uicontrol(gcf,'Style','frame',...
'unit' , 'normalized' , 'backgroundcolor',[0.4 0.4 0.5], 'position' ,[0.72,0.08,0.25,0.84], ...
'horizontal' , 'left' ,'fontsize' ,11);

h_push1=uicontrol(gcf, 'style' , 'push' , ...
'unit' , 'normalized' , 'backgroundcolor',[0.3 0.8 0.6],'position' ,[0.75,0.35,0.19,0.1], ...
'foregroundcolor','k','fontname','行书','fontsize' ,13,'string' , '全 波' , ...
'callback' , 'xhfjhc5');
h_push2=uicontrol(gcf, 'style' , 'push' , ...
'unit' , 'normalized' , 'position' ,[0.75,0.55,0.19,0.1], ...
'foregroundcolor','k','fontname','行书','fontsize' ,13,'backgroundcolor',[0.3 0.8 0.6],'string' , '三 角 波' , ...
'callback' , 'xhfjhc3');
h_push3=uicontrol(gcf, 'style' , 'push' , ...
'unit' , 'normalized' , 'position' ,[0.75,0.75,0.19,0.1], ...
'foregroundcolor','k','fontname','行书','fontsize' ,13,'backgroundcolor',[0.3 0.8 0.6],'string' , '方  波' , ...
'callback' , 'xhfjhc1');
h_push5=uicontrol(gcf, 'style' , 'push' , ...
'unit' , 'normalized' , 'backgroundcolor',[0.9 0.7 0.6],'position' ,[0.75,0.15,0.19,0.1], ...
'string' , '返 回 目 录' ,'fontname','行书','fontsize' ,13,'foregroundcolor','k', 'callback' , 'syxm' );
h3=axes('Position',[0.05,0.07,0.55,0.9]); % 设置画框图的轴位框 
set(h3,'Xlim',[0,1.6],'Ylim',[0,1.5]); % 设置轴的刻度范围 
set(h3,'DataAspectRatio',[1 1 1]); % 设置刻度比例 
set(h3,'ColorOrder',[0,0,0]); % 设置绘线的首选用色 
set(h3,'Visible','off') % 隐去坐标轴

text(0.14,1.35,['\fontsize{12}任何电信号都是由各种不同频率、幅值和初相的正弦波'],'color','blue');
text(0.0,1.24,['\fontsize{12}迭加而成的，一个非正弦周期函数可以用一系列频率成整数'],'color','blue');
text(0.0,1.13,['\fontsize{12}倍的正弦函数来表示，其中与非正弦具有相同频率的成分称'],'color','blue');
text(0.0,1.02,['\fontsize{12}为基波或一次谐波，其它成分则根据其频率为基波频率的2、'],'color','blue');
text(0.0,0.91,['\fontsize{12}3、4、...、n等倍数分别称二次、三次、四次、...、n次谐波，'],'color','blue');
text(0.0,0.80,['\fontsize{12}其幅度将随谐波次数的增加而减小，直至无穷小。'],'color','blue');
text(0.14,0.69,['\fontsize{12}不同频率的谐波可以合成一个非正弦周期波，反过来，'],'color','blue');
text(0.0,0.58,['\fontsize{12}一个非正弦周期波也可以分解为无限个不同频率的谐波成分。'],'color','blue');
text(0.0,0.47,['\fontsize{12}点击右侧的按钮，可分别进入三种波形的仿真界面，观察基'],'color','blue');
text(0.0,0.36,['\fontsize{12}波和其谐波的合成。'],'color','blue');
text(0.14,0.25,['\fontsize{12}点击“返回目录”按钮，回到目录界面，以便开始其他仿'],'color','blue');
text(0.0,0.14,['\fontsize{12}真.仿真过程中欲退出该软件可直接关闭窗口。'],'color','blue');