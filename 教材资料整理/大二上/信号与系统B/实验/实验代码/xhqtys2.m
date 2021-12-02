% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02
clear
clf reset
set(gcf, 'unit' , 'normalized' , 'position' ,[0.18,0.2,0.70,0.60]);
set(gcf, 'defaultuicontrolunits' , 'normalized' );
set(gcf, 'defaultuicontrolhorizontal' , 'left' );
str='信号的其它运算';
set(gcf, 'name' ,str,'color',[0.7 0.7 0.9], 'numbertitle' , 'off' ); % 书写图形窗名
h_text=uicontrol(gcf,'Style','frame',...
'unit' , 'normalized' , 'backgroundcolor',[0.4 0.4 0.5], 'position' ,[0.53,0.04,0.43,0.24], ...
'horizontal' , 'left' ,'fontsize' ,11);
h_axes=axes( 'position' ,[0.05,0.70,0.43,0.24]); title('原始信号');grid on;  % 定义轴位框位置
h_axes1=axes( 'position' ,[0.05,0.37,0.43,0.24]); title('反折信号');grid on;% 定义轴位框位置
h_axes2=axes( 'position' ,[0.05,0.04,0.43,0.24]); title('倒相信号');grid on; % 定义轴位框位置
h_axes3=axes( 'position' ,[0.53,0.7,0.43,0.24]); title('尺度变换');grid on; % 定义轴位框位置
h_axes4=axes( 'position' ,[0.53,0.37,0.43,0.24]); title('信号延迟');grid on;% 定义轴位框位置
 
axes(h_axes);t=-5:0.001:5;y=2*t;plot(t,y,'b');title('原始信号');axis([-3 3 -3 3]);grid on;
axes(h_axes1);t=-5:0.001:5;y=-2*t;plot(t,y,'b');title('反折信号');axis([-3 3 -3 3]);grid on;
axes(h_axes2);t=-5:0.001:5;y=-2*t;plot(t,y,'b');title('倒相信号');axis([-3 3 -3 3]);grid on;
axes(h_axes3);w2=1;t=-5:0.001:5;y=w2*2*t;plot(t,y,'b');title('尺度变换');axis([-3 3 -3 3]);grid on;
axes(h_axes4);t2=0;t=-5:0.001:5;y=2*(t-t2);plot(t,y,'b');title('信号延迟');axis([-3 3 -3 3]);grid on;

str1= ' 信号延迟(s) =' ;
htext=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','backgroundcolor',[0.3 0.8 0.6],'fontname','行书','fontsize' ,10,'position' ,[0.56,0.085,0.22,0.06], ...
'string' ,[str1,sprintf( '%1.4g' ,t2)]);
hslider=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.56,0.06,0.22,0.05], ...
'max' ,3, 'min' ,-3, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,0); 
set(hslider, 'callback' ,[ ... % 操作滑动键 , 引起回调 
't2=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'other2(htext,str1,t2,htext1,str2,w2,h_axes3,h_axes4)' ]); % 被回调的函数文件 
str2= '尺度变换 =' ;
htext1=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','backgroundcolor',[0.3 0.8 0.6],'fontname','行书','fontsize' ,10,'position' ,[0.56,0.20,0.22,0.06], ...
'string' ,[str2,sprintf( '%1.4g' ,w2)]);
hslider1=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.56,0.175,0.22,0.05], ...
'max' ,10, 'min' ,0, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,1); 
set(hslider1, 'callback' ,[ ... % 操作滑动键 , 引起回调 
'w2=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'other2(htext,str1,t2,htext1,str2,w2,h_axes3,h_axes4)' ]); % 被回调的函数文件 

h_push=uicontrol(gcf, 'style' , 'push' , ...
'unit' , 'normalized' , 'fontname','行书','fontsize' ,11,'foregroundcolor','k','backgroundcolor',[0.9 0.7 0.6],'position' ,[0.81,0.12,0.12,0.07], ...
'string' , '返  回' , 'callback' , 'xhdqtys' );

