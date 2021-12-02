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

z=8;f=1;duty=50;t=-1:0.001:1;y=0.5*z*square(2*pi*f*t,duty); plot(t,y);axis([-1 1 -6 6]);xlabel('t(s)');ylabel('幅度(V)');title('矩形波信号');grid on;
str1= ' 幅度(Vpp) =' ;
htext=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','fontname',' 行书' ,'fontsize' ,10,'backgroundcolor',[0.3 0.8 0.6],'position' ,[0.7,0.81,0.25,0.06], ...
'string' ,[str1,sprintf( '%1.4g' ,z)]);
hslider=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.7,0.74,0.25,0.09], ...
'max' ,10, 'min' ,0, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,8); 
str2= ' 频率(Hz) ='; 
htext1=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','fontname',' 行书' ,'fontsize' ,10,'backgroundcolor',[0.3 0.8 0.6],'position' ,[0.7,0.60,0.25,0.06], ...
'string' ,[str2,sprintf( '%1.4g' ,f)]);
hslider1=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.7,0.53,0.25,0.09], ...
'max' ,5.05, 'min' ,0.05, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,1); 
str3= ' 正半周所占百分比 ='; 
htext2=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','fontname',' 行书' ,'fontsize' ,10,'backgroundcolor',[0.3 0.8 0.6],'position' ,[0.7,0.39,0.25,0.06], ...
'string' ,[str3,sprintf( '%1.4g' ,duty)]);
hslider2=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.7,0.32,0.25,0.09], ...
'max' ,100, 'min' ,0, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,50);
set(hslider, 'callback' ,[ ... % 操作滑动键 , 引起回调 
'z=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'xhsyhs5(htext,str1,z,htext1,str2,f,htext2,str3,duty,h_axes)' ]); % 被回调的函数文件 
set(hslider1, 'callback' ,[ ... % 操作滑动键 , 引起回调 
'f=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'xhsyhs5(htext,str1,z,htext1,str2,f,htext2,str3,duty,h_axes)' ]); % 被回调的函数文件 
set(hslider2, 'callback' ,[ ... % 操作滑动键 , 引起回调 
'duty=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'xhsyhs5(htext,str1,z,htext1,str2,f,htext2,str3,duty,h_axes)' ]); % 被回调的函数文件 
h_push=uicontrol(gcf, 'style' , 'push' , ...
'unit' , 'normalized' , 'foregroundcolor','k','fontname',' 隶书' ,'fontsize' ,11,'backgroundcolor',[0.9 0.7 0.6],'position' ,[0.7,0.14,0.25,0.1], ...
'string' , '返回波形选择窗口' , 'callback' , 'xhsyhs1' );