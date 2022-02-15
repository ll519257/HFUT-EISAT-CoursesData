% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02
clear
clf reset
set(gcf, 'unit' , 'normalized' , 'position' ,[0.18,0.2,0.7,0.55]);
set(gcf, 'defaultuicontrolunits' , 'normalized' );
set(gcf, 'defaultuicontrolhorizontal' , 'left' );
str='信号的无失真传输';
set(gcf, 'name' ,str,'color',[0.7 0.7 0.9], 'numbertitle' , 'off' ); % 书写图形窗名
h_axes=axes( 'position' ,[0.07,0.1,0.6,0.8]); % 定义轴位框位置

h_text=uicontrol(gcf,'Style','frame',...
'unit' , 'normalized' , 'backgroundcolor',[0.4 0.4 0.5], 'position' ,[0.685,0.06,0.29,0.645], ...
'horizontal' , 'left' ,'fontsize' ,11);

r1=20;r2=20;c1=1;c2=1;w0=1;
num=[r1*r2*c1*1e-3 r2];den=[r1*r2*c2*1e-3+r1*r2*c1*1e-3 r1+r2 ];%num=[r1*r2*c1 r2];den=[r1*r2*c2+r1*r2*c1 r1+r2];
sys=tf(num,den); t=0:0.0001:8;f =sin(2*w0*pi*t); 
y=lsim(sys,f,t);plot(t,f,t,y,'r');xlabel('t(s)');ylabel('y(t)');legend('输入信号','输出信号');axis([0 3 -1 1]);title('信号的无失真传输');grid on;

str1= ' 频率变化 =' ;
htext=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','backgroundcolor',[0.3 0.8 0.6],'fontsize' ,9,'position' ,[0.705,0.64,0.25,0.06], ...
'string' ,[str1,sprintf( '%1.4g' ,w0)]);
hslider=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.705,0.61,0.25,0.06], ...
'max' ,10, 'min' ,0, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,1); 
set(hslider, 'callback' ,[ ... % 操作滑动键 , 引起回调 
'w0=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'xhwszcs1(htext,str1,w0,htext1,str2,r1,htext2,str3,r2,htext3,str4,c1,htext4,str5,c2,h_axes)' ]); % 被回调的函数文件 

str2= ' R1(KΩ) =' ;
htext1=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','backgroundcolor',[0.3 0.8 0.6],'fontsize' ,9,'position' ,[0.705,0.53,0.25,0.06], ...
'string' ,[str2,sprintf( '%1.4g' ,r1)]);
hslider=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.705,0.50,0.25,0.06], ...
'max' ,20, 'min' ,0, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,20); 
set(hslider, 'callback' ,[ ... % 操作滑动键 , 引起回调 
'r1=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'xhwszcs1(htext,str1,w0,htext1,str2,r1,htext2,str3,r2,htext3,str4,c1,htext4,str5,c2,h_axes)' ]); % 被回调的函数文件 

str3= ' R2(KΩ) =' ;
htext2=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','backgroundcolor',[0.3 0.8 0.6],'fontsize' ,9,'position' ,[0.705,0.42,0.25,0.06], ...
'string' ,[str3,sprintf( '%1.4g' ,r2)]);
hslider=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.705,0.39,0.25,0.06], ...
'max' ,20, 'min' ,0, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,20); 
set(hslider, 'callback' ,[ ... % 操作滑动键 , 引起回调 
'r2=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'xhwszcs1(htext,str1,w0,htext1,str2,r1,htext2,str3,r2,htext3,str4,c1,htext4,str5,c2,h_axes)' ]); % 被回调的函数文件 

str4= ' C1(uF) =' ;
htext3=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','backgroundcolor',[0.3 0.8 0.6],'fontsize' ,9,'position' ,[0.705,0.31,0.25,0.06], ...
'string' ,[str4,sprintf( '%1.4g' ,c1)]);
hslider=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.705,0.28,0.25,0.06], ...
'max' ,20, 'min' ,0, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,1); 
set(hslider, 'callback' ,[ ... % 操作滑动键 , 引起回调 
'c1=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'xhwszcs1(htext,str1,w0,htext1,str2,r1,htext2,str3,r2,htext3,str4,c1,htext4,str5,c2,h_axes)' ]); % 被回调的函数文件 

str5= ' C2(uF) =' ;
htext4=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'foregroundcolor','k','backgroundcolor',[0.3 0.8 0.6],'fontsize' ,9,'position' ,[0.705,0.20,0.25,0.06], ...
'string' ,[str5,sprintf( '%1.4g' ,c2)]);
hslider=uicontrol(gcf, 'style' , 'slider' , ... % 创建滑动键 
'position' ,[0.705,0.17,0.25,0.06], ...
'max' ,20, 'min' ,0, ... 
'sliderstep' ,[0.01,0.05], ... 
'Value' ,1); 
set(hslider, 'callback' ,[ ... % 操作滑动键 , 引起回调 
'c2=get(gcbo,''value'');' , ... % 获得滑动键状态值 
'xhwszcs1(htext,str1,w0,htext1,str2,r1,htext2,str3,r2,htext3,str4,c1,htext4,str5,c2,h_axes)' ]); % 被回调的函数文件 

h_push=uicontrol(gcf, 'style' , 'push' , ...
'unit' , 'normalized' , 'fontname' ,'行书','fontsize' ,12,'foregroundcolor','k','backgroundcolor',[0.9 0.7 0.6],'position' ,[0.705,0.065,0.25,0.07], ...
'string' , '返 回 目 录' , 'callback' , 'syxm' );

h3=axes('Position',[0.6,0.65,0.6,0.32]); % 设置画框图的轴位框 
set(h3,'Xlim',[0,1.2],'Ylim',[0,0.5]) % 设置轴的刻度范围 
set(h3,'DataAspectRatio',[1 1 1]) % 设置刻度比例 
set(h3,'ColorOrder',[0,0,0]) % 设置绘线的首选用色 
set(h3,'Visible','off') % 隐去坐标轴 
hh1=rectangle('Position',[0.282,0.24,0.09,0.03],'Curvature',[0,0]); 
% 画方框 <37> 
hh1=rectangle('Position',[0.51,0.175,0.03,0.09],'Curvature',[0,0]); 
% 画方框 <37> 
xx2=0.15:0.02:0.31; xx1=0.57:0.01:0.62;
xx3=0.34:0.02:0.75;xx4=0.15:0.02:0.75; xx7=0.57:0.01:0.62;
yy5=0.3:0.0001:0.36; yy6=0.3:0.001:0.36; 
yy8=0.255:0.0001:0.33; yy9=0.255:0.001:0.33; 
xx10=0.23:0.001:0.285;xx11=0.375:0.001:0.43;
xx12=0.525:0.01:0.60;xx13=0.525:0.01:0.60;
yy14=0.24:0.0001:0.29; yy15=0.27:0.001:0.29; 
yy16=0.15:0.001:0.175; yy17=0.15:0.0001:0.21;
yy18=0.1:0.001:0.155;yy19=0.29:0.001:0.33;
xx20=0.535:0.01:0.585;

yy2=0.33*ones(size(xx2)); yy1=0.205*ones(size(xx1));
yy3=0.33*ones(size(xx3));yy4=0.12*ones(size(xx4)); 
xx5=0.31*ones(size(yy5));xx6=0.34*ones(size(yy6));
xx8=0.23*ones(size(yy8));xx9=0.43*ones(size(yy9));
yy7=0.235*ones(size(xx7));yy10=0.254*ones(size(xx10));
yy11=0.254*ones(size(xx11));
yy12=0.15*ones(size(xx12));yy13=0.29*ones(size(xx13));
xx14=0.59*ones(size(yy14));xx15=0.525*ones(size(yy15));
xx16=0.525*ones(size(yy16));xx17=0.59*ones(size(yy17));
xx18=0.555*ones(size(yy18));xx19=0.555*ones(size(yy19));
yy20=0.1*ones(size(xx20));

line(xx2,yy2);line(xx3,yy3);line(xx4,yy4);
line(xx5,yy5);line(xx6,yy6);line(xx1,yy1);
line(xx7,yy7);line(xx8,yy8);line(xx9,yy9);
line(xx10,yy10);line(xx11,yy11);
line(xx12,yy12);line(xx13,yy13);
line(xx14,yy14);line(xx15,yy15);
line(xx16,yy16);line(xx17,yy17);
line(xx18,yy18);line(xx19,yy19);
line(xx20,yy20);

text(0.15,0.22,'x(t)'); 
text(0.70,0.23,'y(t)'); 
text(0.3,0.21,'R1'); 
text(0.43,0.22,'R2');
text(0.3,0.39,'C1');
text(0.62,0.22,'C2');
text(0.0,0.45,'无失真传输电路图: ','fontsize' ,12,'hor','left');
