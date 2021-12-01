% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02
function cjxy1(z,h_axes)

axes(h_axes);
dt=0.1;t=0:dt:10;N=length(t);y=impulse([10 10*z],[1 2*z z^2+4],t);plot(t,y);grid on;xlabel('t(s)');ylabel('y(t)');

h3=axes('Position',[0.6,0.6,0.63,0.4]); % 设置画框图的轴位框 
set(h3,'Xlim',[0,1.2],'Ylim',[0,0.5]) % 设置轴的刻度范围 
set(h3,'DataAspectRatio',[1 1 1]) % 设置刻度比例 
set(h3,'ColorOrder',[0,0,0]) % 设置绘线的首选用色 
set(h3,'Visible','off') % 隐去坐标轴

xx7=0.4:0.001:0.6;yy7=0.27*ones(size(xx7));line(xx7,yy7,'color','blue'); 
text(0.25,0.27,'\Phi(s)= ','fontsize' ,11,'color','blue','hor','left'); 
text(0.4,0.24,'(s+k)^2+4 ','fontsize' ,11,'color','blue','hor','left');
text(0.4,0.31,'10(s+k) ','fontsize' ,11,'color','blue','hor','left'); 


