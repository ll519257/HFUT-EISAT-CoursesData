% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02
clear
clf reset
set(gcf, 'unit' , 'normalized' , 'position' ,[0.18,0.2,0.7,0.5]);
set(gcf, 'defaultuicontrolunits' , 'normalized' );
set(gcf, 'defaultuicontrolhorizontal' , 'left' );
str='信号的尺度变换';
set(gcf, 'name' ,str,'color',[0.7 0.7 0.7], 'numbertitle' , 'off' ); % 书写图形窗名
h_axes=axes( 'position' ,[0.1,0.15,0.55,0.75]); % 定义轴位框位置
a=1;f=1;w=50;b=0.5;t=-6:0.01:6;x=a*sin(f*t);plot(t,x);xlabel('t(s)');ylabel('幅度(V)');title('正弦波信号');grid on;
str1= ' ' ;
htext=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','blue','backgroundcolor',[0.7 0.7 0.7],'fontsize' ,9,'position' ,[0.7,0.84,0.25,0.06], ...
'string' ,[str1,sprintf( '%1.4g' ,'')]);


str2= ' 尺度变换 ' ;
htext1=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','blue','backgroundcolor',[0.7 0.7 0.7],'fontsize' ,9,'position' ,[0.7,0.62,0.25,0.06], ...
'string' ,[str2,sprintf( '%1.4g' ,f)]);
hslider=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.7,0.54,0.25,0.09], ...
'max' ,5, 'min' ,0, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,1); 
set(hslider, 'callback' ,[ ... % 操作滑动键 , 引起回调 
'f=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'xhcdbh1(htext,str1,a,htext1,str2,f,htext2,str3,w,h_axes)' ]); % 被回调的函数文件 

str3= ' ' ;
htext2=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','blue','backgroundcolor',[0.7 0.7 0.7],'fontsize' ,9,'position' ,[0.7,0.4,0.3,0.06], ...
'string' ,[str3,sprintf( '%1.4g' ,'')]);

h_push=uicontrol(gcf, 'style' , 'push' , ...
'unit' , 'normalized' , 'fontsize' ,11,'foregroundcolor','blue','backgroundcolor',[0.7 0.7 0.7],'position' ,[0.7,0.15,0.25,0.1], ...
'string' , '返回目录' , 'callback' , 'xhdjbys' );