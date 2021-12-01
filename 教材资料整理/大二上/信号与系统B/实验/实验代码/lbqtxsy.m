% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02
clear
clf reset
set(gcf, 'unit' , 'normalized' ,'color',[0.7 0.7 0.9], 'position' ,[0.18,0.2,0.7,0.6]);
set(gcf, 'defaultuicontrolunits' , 'normalized' );
set(gcf, 'defaultuicontrolhorizontal' , 'left' );
str='滤波器幅频特性的研究';
set(gcf, 'name' ,str, 'numbertitle' , 'off' ); % 书写图形窗名

h_text=uicontrol(gcf,'Style','frame',...
'unit' , 'normalized' , 'backgroundcolor',[0.4 0.4 0.5], 'position' ,[0.671,0.09,0.28,0.82], ...
'horizontal' , 'left' ,'fontsize' ,11);

h_text=uicontrol(gcf, 'style' , 'text' , ...
'unit' , 'normalized' , 'position' ,[0.7,0.79,0.22,0.07], ...
'horizontal' , 'left' ,'foregroundcolor','k','fontsize' ,11,'backgroundcolor',[0.3 0.8 0.6], 'string' ,{ '滤波器种类' });
h_popup = uicontrol(gcf,'fontsize' ,10,'Style','popupmenu','Units','normalized','Position',[0.7 0.725 0.22 0.1],...
'BackgroundColor','white','foregroundcolor','k','String',{'低通滤波器','高通滤波器','带通滤波器','带阻滤波器'});
h_text=uicontrol(gcf, 'style' , 'text' , ...
'unit' , 'normalized' , 'position' ,[0.7,0.6,0.22,0.07], ...
'horizontal' , 'left' ,'foregroundcolor','k','fontsize' ,11,'backgroundcolor',[0.3 0.8 0.6], 'string' ,{ '所选滤波器截止角频率' });
h_edit=uicontrol(gcf, 'style' , 'edit' , ...
'unit' , 'normalized' ,'fontsize' ,12,'foregroundcolor','k','backgroundcolor','w', 'position' ,[0.7,0.56,0.22,0.07], ...
'horizontal' , 'left' , ...
'callback' ,[ ...
'Wp=str2num(get(gcbo,''string''));']);

h_push4=uicontrol(gcf, 'style' , 'push' , ...
'unit' , 'normalized' ,'fontname','行书','fontsize',12 ,'foregroundcolor','k', 'backgroundcolor',[0.3 0.8 0.6],'position' ,[0.7,0.34,0.22,0.09], ...
'string' , '开   始   仿   真' ,'callback' , 'lbqtxsy1(h_popup,Wp)');

h_push4=uicontrol(gcf, 'style' , 'push' , ...
'unit' , 'normalized' ,'fontname','行书','fontsize',12 ,'foregroundcolor','k', 'backgroundcolor',[0.9 0.7 0.6],'position' ,[0.7,0.14,0.22,0.09], ...
'string' , '返   回   目   录' ,'callback' , 'syxm');

h3=axes('Position',[-0.02,0.09,0.55,0.9]); % 设置画框图的轴位框 
set(h3,'Xlim',[0,1.2],'Ylim',[0,0.7]); % 设置轴的刻度范围 
set(h3,'DataAspectRatio',[1 1 1]); % 设置刻度比例 
set(h3,'ColorOrder',[0,0,0]); % 设置绘线的首选用色 
set(h3,'Visible','off'); % 隐去坐标轴
text(0.3,0.9,['\fontsize{11}滤波器的功能是让一定频率范围内的信号通过，抑制或'],'color','blue');
text(0.2,0.83,['\fontsize{11}急剧衰减频率范围以外的信号。根据频率范围可将其分为低'],'color','blue');
text(0.2,0.76,['\fontsize{11}通、高通、带通与带阻四种滤波器。'],'color','blue');
text(0.2,0.69,['\fontsize{11}        (1)   理想低通滤波器函数可表示为：'],'color','blue');
sint='{\fontsize{11}｛_{\fontsize{8}0          ω>ωc}^{Ke^-^j^ω^t    ω<ωc}}';
text(0.2,0.61,['\fontsize{11}                                     H(jω)=',sint],'color','blue') 
text(0.2,0.53,['\fontsize{11}        (2)   理想高通滤波器函数可表示为：'],'color','blue');
sint='{\fontsize{11}｛_{\fontsize{8}0          ω<ωc}^{Ke^-^j^ω^t    ω>ωc}}';
text(0.2,0.45,['\fontsize{11}                                     H(jω)=',sint],'color','blue')
text(0.2,0.37,['\fontsize{11}        (3)   理想带通滤波器函数可表示为：'],'color','blue');
sint='{\fontsize{11}｛_{\fontsize{8}0          ω<ωc1,ω>ωc2}^{Ke^-^j^ω^t    ωc1<ω<ωc2}}';
text(0.2,0.29,['\fontsize{11}                                     H(jω)=',sint],'color','blue')
text(0.2,0.21,['\fontsize{11}        (4)   理想带阻滤波器函数可表示为：'],'color','blue');
sint='{\fontsize{11}｛_{\fontsize{8}0          ωc1<ω<ωc2}^{Ke^-^j^ω^t    ω<ωc1,ω>ωc2}}';
text(0.2,0.13,['\fontsize{11}                                     H(jω)=',sint],'color','blue')
text(0.2,0.05,['\fontsize{11}        式中：ωc为截止频率，且ωc1<ωc2；'],'color','blue');
text(0.2,-0.02,['\fontsize{11}                    t为延迟时间。'],'color','blue');
text(0.3,-0.09,['\fontsize{11}在右侧的下拉框中选择滤波器的类型，并在文本框中输'],'color','blue');
text(0.2,-0.16,['\fontsize{11}入相应的截止频率，然后点击“开始仿真”按钮，即可得到不'],'color','blue');
text(0.2,-0.23,['\fontsize{11}同滤波器的频率特性曲线。'],'color','blue');
text(0.3,-0.3,['\fontsize{11}仿真过程中欲退出该软件可直接关闭窗口。'],'color','blue');