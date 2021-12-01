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

a=5;t=5;x=0:0.001:10;y=a*(x>t);plot(x,y);axis([0 10 -10 10]);xlabel('t(s)');ylabel('幅度(V)');title('阶跃信号');grid on;
str1= ' 幅度(Vpp) =' ;
htext=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','backgroundcolor',[0.3 0.8 0.6],'fontname',' 行书' ,'fontsize' ,10,'position' ,[0.7,0.77,0.25,0.06], ...
'string' ,[str1,sprintf( '%1.4g' ,a)]);
hslider=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.7,0.7,0.25,0.09], ...
'max' ,10, 'min' ,-10, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,5); 
set(hslider, 'callback' ,[ ... % 操作滑动键 , 引起回调 
'a=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'xhsyhs13(htext,str1,a,htext1,str2,t,h_axes)' ]); % 被回调的函数文件 
str2= ' 滞后时间(s) =' ;
htext1=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','backgroundcolor',[0.3 0.8 0.6],'fontname',' 行书' ,'fontsize' ,10,'position' ,[0.7,0.50,0.25,0.06], ...
'string' ,[str2,sprintf( '%1.4g' ,t)]);
hslider1=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.7,0.43,0.25,0.09], ...
'max' ,10, 'min' ,0, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,5); 
set(hslider1, 'callback' ,[ ... % 操作滑动键 , 引起回调 
't=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'xhsyhs13(htext,str1,a,htext1,str2,t,h_axes)' ]); % 被回调的函数文件 
h_push=uicontrol(gcf, 'style' , 'push' , ...
'unit' , 'normalized' ,'fontname',' 隶书' , 'fontsize' ,11,'foregroundcolor','k','backgroundcolor',[0.9 0.7 0.6],'position' ,[0.7,0.19,0.25,0.1], ...
'string' , '返回波形选择窗口' , 'callback' , 'xhsyhs1' );