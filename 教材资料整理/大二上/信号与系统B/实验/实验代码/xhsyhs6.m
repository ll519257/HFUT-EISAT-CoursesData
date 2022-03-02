% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02
clear
clf reset
set(gcf, 'unit' , 'normalized' , 'position' ,[0.18,0.2,0.7,0.5]);
set(gcf, 'defaultuicontrolunits' , 'normalized' );
set(gcf, 'defaultuicontrolhorizontal' , 'left' );
str='连续信号';
set(gcf, 'name' ,str, 'color',[0.7 0.7 0.9],'numbertitle' , 'off' ); % 书写图形窗名
h_axes=axes( 'position' ,[0.08,0.15,0.56,0.75]); % 定义轴位框位置

h_text=uicontrol(gcf,'Style','frame',...
'unit' , 'normalized' , 'backgroundcolor',[0.4 0.4 0.5], 'position' ,[0.675,0.11,0.30,0.64], ...
'horizontal' , 'left' ,'fontsize' ,11);


z=5;a=2;t=0:0.01:5;ft=z*exp(-a*t); plot(t,ft);axis([0 5 0 10]);xlabel('t(s)');ylabel('幅度(V)');title('指数函数信号');grid on;
str1= ' K(0～10)   当前值=' ;
htext=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','backgroundcolor',[0.3 0.8 0.6],'fontname',' 行书' ,'fontsize' ,10,'position' ,[0.7,0.64,0.25,0.06], ...
'string' ,[str1,sprintf( '%1.4g' ,z)]);
hslider=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.7,0.57,0.25,0.09], ...
'max' ,10, 'min' ,0, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,5); 
str2= ' a(0～5)   当前值='; 
htext1=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','backgroundcolor',[0.3 0.8 0.6],'fontname',' 行书' ,'fontsize' ,10,'position' ,[0.7,0.42,0.25,0.06], ...
'string' ,[str2,sprintf( '%1.4g' ,a)]);
hslider1=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.7,0.35,0.25,0.09], ...
'max' ,5, 'min' ,0, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,2); 
set(hslider, 'callback' ,[ ... % 操作滑动键 , 引起回调 
'z=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'xhsyhs7(htext,str1,z,htext1,str2,a,h_axes)' ]); % 被回调的函数文件 
set(hslider1, 'callback' ,[ ... % 操作滑动键 , 引起回调 
'a=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'xhsyhs7(htext,str1,z,htext1,str2,a,h_axes)' ]); % 被回调的函数文件 
h_push=uicontrol(gcf, 'style' , 'push' , ...
'unit' , 'normalized' ,'fontname',' 隶书' ,'fontsize' ,11,'foregroundcolor','k', 'backgroundcolor',[0.9 0.7 0.6],'position' ,[0.7,0.16,0.25,0.1], ...
'string' , '返回波形选择窗口' , 'callback' , 'xhsyhs1' );
h_text1=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'unit' , 'normalized' ,'position' ,[0.7,0.82,0.12,0.07], ...
'horizontal' , 'center' , 'fontsize' ,11,'fontname',' 隶书' ,'foregroundcolor','blue','backgroundcolor',[0.7 0.7 0.9],'string' , { '指数函数：'});
h3=axes('Position',[0.48,0.62,0.63,0.32]); % 设置画框图的轴位框 
set(h3,'Xlim',[0,1.2],'Ylim',[0,0.5]); % 设置轴的刻度范围 
set(h3,'DataAspectRatio',[1 1 1]); % 设置刻度比例 
set(h3,'ColorOrder',[0,0,0]); % 设置绘线的首选用色 
set(h3,'Visible','off'); % 隐去坐标轴 
text(0.6,0.29,'f(t)=Ke^-^a^t ','hor','left','fontsize',12,'color','blue');

