% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02
clear
clf reset
set(gcf, 'unit' , 'normalized' , 'position' ,[0.18,0.2,0.6,0.5]);
set(gcf, 'defaultuicontrolunits' , 'normalized' );
set(gcf, 'defaultuicontrolfontsize' ,12);
set(gcf, 'defaultuicontrolfontname' , ' 隶书 ' );
set(gcf, 'defaultuicontrolhorizontal' , 'left' );
str= '二阶系统阶跃响应曲线 ' ;
set(gcf, 'name' ,str,'color',[0.7 0.7 0.9], 'numbertitle' , 'off' ); % 书写图形窗名
h_axes=axes( 'position' ,[0.08,0.13,0.6,0.8]); % 定义轴位框位置

set(h_axes, 'xlim' ,[0,20]); % 设置时间轴长度
grid on;
h_text=uicontrol(gcf,'Style','frame',...
'unit' , 'normalized' , 'backgroundcolor',[0.4 0.4 0.5], 'position' ,[0.7,0.1,0.28,0.62], ...
'horizontal' , 'left' ,'fontsize' ,11);

hcheck1=uicontrol(gcf, 'style' , 'checkbox' , ... % 创建峰值检录框 
'foregroundcolor','k','fontsize' ,10,'backgroundcolor',[0.3 0.8 0.6],'string' , ' 最大峰值 ' , ...
'position' ,[0.72,0.45,0.15,0.07]);
vchk1=get(hcheck1, 'value' ); % 获得峰值检录框的状态值 
set(hcheck1, 'callback' ,[ ... % 操作峰值检录框 , 引起回调 
'vchk1=get(gcbo,''value'');' , ... % 获得峰值检录框状态值 
'callcheck(vchk1)' ]); % 被回调的函数文件 

h_text=uicontrol(gcf, 'style' , 'text' , ...
'unit' , 'normalized' , 'position' ,[0.72,0.62,0.24,0.05], ...
'horizontal' , 'left' ,'fontsize' ,10,'foregroundcolor','k','backgroundcolor',[0.3 0.8 0.6], 'string' ,{ 'K 取值为：' });
h_edit=uicontrol(gcf, 'style' , 'edit' , ...
'unit' , 'normalized' ,'foregroundcolor','k','backgroundcolor','w', 'position' ,[0.72,0.56,0.24,0.07], ...
'fontname','行书','fontsize' ,10,'horizontal' , 'left' , ...
'callback' ,[ ...
'z=str2num(get(gcbo,''string''));']);

h_push5=uicontrol(gcf, 'style' , 'push' , ...
'unit' , 'normalized' ,'fontname','行书','fontsize' ,13, 'backgroundcolor',[0.9 0.7 0.6],'position' ,[0.72,0.3,0.24,0.10], ...
'string' , '确   定' ,'foregroundcolor','k', 'callback' , 'callcheck(z,h_axes,vchk1)' );


h_push=uicontrol(gcf, 'style' , 'push' , ...
'unit' , 'normalized' ,'foregroundcolor','k','fontsize' ,13,'backgroundcolor',[0.9 0.7 0.6], 'position' ,[0.72,0.15,0.24,0.10], ...
'string' , '返回上一页' , 'callback' , 'lxxtxy' );
h_text1=uicontrol(gcf, 'style' , 'text' , ... % 制作静态说明文本框 
'unit' , 'normalized' ,'position' ,[0.7,0.88,0.18,0.04], ...
'horizontal' , 'center' , 'fontsize' ,11,'fontname',' 隶书' ,'foregroundcolor','blue','backgroundcolor',[0.7 0.7 0.9],'string' , { '系统函数：'});
h3=axes('Position',[0.6,0.6,0.63,0.4]); % 设置画框图的轴位框 
set(h3,'Xlim',[0,1.2],'Ylim',[0,0.5]) % 设置轴的刻度范围 
set(h3,'DataAspectRatio',[1 1 1]) % 设置刻度比例 
set(h3,'ColorOrder',[0,0,0]) % 设置绘线的首选用色 
set(h3,'Visible','off') % 隐去坐标轴
xx7=0.4:0.001:0.6;yy7=0.27*ones(size(xx7));line(xx7,yy7,'color','blue'); 
text(0.25,0.27,'\Phi(s)= ','fontsize' ,11,'color','blue','hor','left'); 
text(0.4,0.24,'(s+k)^2+4 ','fontsize' ,11,'color','blue','hor','left');
text(0.4,0.31,'10(s+k) ','fontsize' ,11,'color','blue','hor','left');