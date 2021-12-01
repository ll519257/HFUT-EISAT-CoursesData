% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02
clear
clf reset
H=axes( 'unit' , 'normalized' , 'position' ,[0,0,1,1], 'visible' , 'off' );
h_fig=get(H, 'parent' );
str= ' 系统的零状态响应 ' ;
set(h_fig, 'name' ,str,'unit' , 'normalized' , 'color',[0.7 0.7 0.9],'numbertitle' , 'off','position' ,[0.18,0.2,0.75,0.65]); % 书写图形窗名

h_text=uicontrol(gcf,'Style','frame',...
'unit' , 'normalized' , 'backgroundcolor',[0.4 0.4 0.5], 'position' ,[0.715,0.07,0.26,0.6], ...
'horizontal' , 'left' ,'fontsize' ,11);

h_axes=axes( 'parent' ,h_fig, ...
'unit' , 'normalized' , 'position' ,[0.08,0.1,0.6,0.78], ...
'xlim' ,[0 15], 'ylim' ,[0 1.8], 'fontsize' ,8); 
ts=0;te=15;dt=0.01;sys=tf([1],[1 0.709]); t=ts:dt:te;f =sin(t); 
y=lsim(sys,f,t);plot(t,f,t,y,'r');xlabel('t(s)');ylabel('y(t)');legend('输入信号','输出信号');grid on;
h_push3=uicontrol(h_fig, 'style' , 'push' , ...
'unit' , 'normalized', 'fontname',' 行书' ,'fontsize' ,12,'backgroundcolor',[0.9 0.7 0.6], 'position' ,[0.75,0.13,0.2,0.09], ...
'string' , '返回上一页' , 'foregroundcolor','k','callback' , 'lztxy' );
h_text=uicontrol(h_fig, 'style' , 'text' , ...
'unit' , 'normalized' , 'position' ,[0.75,0.58,0.20,0.05], ...
'horizontal' , 'left' ,'foregroundcolor','k','fontsize' ,12,'backgroundcolor',[0.3 0.8 0.6], 'string' ,{ '输入信号x(t) ' });
h_popup = uicontrol(h_fig,'fontsize' ,9,'foregroundcolor','k','Style','popupmenu','Units','normalized','Position',[0.75 0.45 0.2 0.14],...
         'BackgroundColor','white','String',{'正弦信号','余弦信号','单位斜坡信号','冲激信号'});
h_push3=uicontrol(h_fig, 'style' , 'push' , ...
'unit' , 'normalized' ,'fontname',' 行书' ,'fontsize' ,11,'backgroundcolor',[0.3 0.8 0.6], 'position' ,[0.75,0.34,0.2,0.09], ...
'string' , '开 始 仿 真' , 'foregroundcolor','k','callback' , 'lztxy2' );
h_text=uicontrol(h_fig, 'style' , 'text' , ...
'unit' , 'normalized' , 'position' ,[0.23,0.88,0.3,0.07], ...
'horizontal' , 'left' ,'fontsize' ,12,'backgroundcolor',[0.7 0.7 0.9], 'string' ,{ '系统模型: y''(t)+0.709y(t)=x(t)' });
h_text=uicontrol(h_fig, 'style' , 'text' , ...
'unit' , 'normalized' , 'position' ,[0.72,0.87,0.35,0.05], ...
'horizontal' , 'left' ,'fontsize' ,11,'backgroundcolor',[0.7 0.7 0.9], 'string' ,{ '系统模型:T=RC=1.41(s) ' });
h3=axes('Position',[0.62,0.65,0.63,0.32]); % 设置画框图的轴位框 
set(h3,'Xlim',[0,1.2],'Ylim',[0,0.5]) % 设置轴的刻度范围 
set(h3,'DataAspectRatio',[1 1 1]) % 设置刻度比例 
set(h3,'ColorOrder',[0,0,0]) % 设置绘线的首选用色 
set(h3,'Visible','off') % 隐去坐标轴
hh1=rectangle('Position',[0.33,0.28,0.12,0.05],'Curvature',[0,0]); 
% 画方框 <37> 
xx2=0.15:0.02:0.33; xx1=0.53:0.01:0.59;
xx3=0.45:0.02:0.7;xx4=0.15:0.02:0.7; xx7=0.53:0.01:0.59;
yy5=0.1:0.02:0.18; yy6=0.22:0.001:0.308; 
yy2=0.305*ones(size(xx2)); yy1=0.18*ones(size(xx1));
yy3=0.305*ones(size(xx3));yy4=0.1*ones(size(xx4)); 
xx5=0.56*ones(size(yy5));xx6=0.56*ones(size(yy6));
yy7=0.22*ones(size(xx7));
line(xx2,yy2);line(xx3,yy3);line(xx4,yy4); 
line(xx5,yy5);line(xx6,yy6);line(xx1,yy1);
line(xx7,yy7);
text(0.15,0.2,'x(t)'); 
text(0.64,0.2,'y(t)'); 
text(0.35,0.25,'30K'); 
text(0.43,0.2,'47uF');

