% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02
clear
clf reset
set(gcf, 'unit' , 'normalized' , 'position' ,[0.18,0.2,0.7,0.5]);
set(gcf, 'defaultuicontrolunits' , 'normalized' );
set(gcf, 'defaultuicontrolhorizontal' , 'left' );
str='连续信号';
set(gcf, 'name' ,str,'color',[0.7 0.7 0.9], 'numbertitle' , 'off' ); % 书写图形窗名
h_axes=axes( 'position' ,[0.08,0.15,0.56,0.75]); % 定义轴位框位置

h_text=uicontrol(gcf,'Style','frame',...
'unit' , 'normalized' , 'backgroundcolor',[0.4 0.4 0.5], 'position' ,[0.675,0.11,0.30,0.79], ...
'horizontal' , 'left' ,'fontsize' ,11);

a=8;f=0.5;w=50;b=0.5;t=-2:0.01:10;x=a*sawtooth(2*pi*f*t,b)/2;plot(t,x);axis([-2 10 -6 6]);xlabel('t(s)');ylabel('幅度(V)');title('锯齿波信号');grid on;
str1= ' 幅度(Vpp) =' ;
htext=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','backgroundcolor',[0.3 0.8 0.6],'fontname',' 行书' ,'fontsize' ,10,'position' ,[0.7,0.81,0.25,0.06], ...
'string' ,[str1,sprintf( '%1.4g' ,a)]);
hslider=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.7,0.74,0.25,0.09], ...
'max' ,10, 'min' ,0, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,8); 
set(hslider, 'callback' ,[ ... % 操作滑动键 , 引起回调 
'a=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'xhsyhs11(htext,str1,a,htext1,str2,f,htext2,str3,w,h_axes)' ]); % 被回调的函数文件 

str2= ' 频率(Hz) =' ;
htext1=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','backgroundcolor',[0.3 0.8 0.6],'fontname',' 行书' ,'fontsize' ,10,'position' ,[0.7,0.60,0.25,0.06], ...
'string' ,[str2,sprintf( '%1.4g' ,f)]);
hslider=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.7,0.53,0.25,0.09], ...
'max' ,1, 'min' ,0, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,0.5); 
set(hslider, 'callback' ,[ ... % 操作滑动键 , 引起回调 
'f=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'xhsyhs11(htext,str1,a,htext1,str2,f,htext2,str3,w,h_axes)' ]); % 被回调的函数文件 

str3= ' 左半波宽度所占百分比 =' ;
htext2=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','backgroundcolor',[0.3 0.8 0.6],'fontname',' 行书' ,'fontsize' ,10,'position' ,[0.7,0.39,0.25,0.06], ...
'string' ,[str3,sprintf( '%1.4g' ,w)]);
hslider=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.7,0.32,0.25,0.09], ...
'max' ,100, 'min' ,0, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,50); 
set(hslider, 'callback' ,[ ... % 操作滑动键 , 引起回调 
'w=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'xhsyhs11(htext,str1,a,htext1,str2,f,htext2,str3,w,h_axes)' ]); % 被回调的函数文件 
h_push=uicontrol(gcf, 'style' , 'push' , ...
'unit' , 'normalized' , 'fontname',' 隶书' ,'fontsize' ,11,'foregroundcolor','k','backgroundcolor',[0.9 0.7 0.6],'position' ,[0.7,0.14,0.25,0.1], ...
'string' , '返回波形选择窗口' , 'callback' , 'xhsyhs1' );