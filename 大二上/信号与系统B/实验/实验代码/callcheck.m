% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02
function callcheck(z,h_axes,vchk1)
axes(h_axes);
dt=0.1;t=0:dt:20;N=length(t);y=step([10 10*z],[1 2*z z^2+4],t);plot(t,y);grid on;xlabel('t(s)');ylabel('y(t)');
 
if vchk1 % 假如峰值框被选中 
[ym,km]=max(y);
if km<(N-3) % 假如在设定时间范围内能插值 
k1=km-3;k2=km+3;k12=k1:k2;tt=t(k12);
yy=spline(t(k12),y(k12),tt); % 局部样条插值 
[yym,kkm]=max(yy); % 求更精确的峰值位置
line(tt(kkm),yym, 'marker' , '.' , ... % 画峰值点 
'markeredgecolor' , 'r' , 'markersize' ,20);
ystr=[ 'ymax = ' ,sprintf( '%1.4g' ,yym)];
tstr=[ 'tmax = ' ,sprintf( '%1.4g' ,tt(kkm))];
text(tt(kkm),0.9*yym,{ystr;tstr})
else % 假如在设定时间范围内不能插值 
text(10,0.4*y(end),{ 'ymax --> 1' ; 'tmax --> inf' })
end
end

h3=axes('Position',[0.6,0.6,0.63,0.4]); % 设置画框图的轴位框 
set(h3,'Xlim',[0,1.2],'Ylim',[0,0.5]) % 设置轴的刻度范围 
set(h3,'DataAspectRatio',[1 1 1]) % 设置刻度比例 
set(h3,'ColorOrder',[0,0,0]) % 设置绘线的首选用色 
set(h3,'Visible','off') % 隐去坐标轴
xx7=0.4:0.001:0.6;yy7=0.27*ones(size(xx7));line(xx7,yy7,'color','blue'); 
text(0.25,0.27,'\Phi(s)= ','fontsize' ,11,'color','blue','hor','left'); 
text(0.4,0.24,'(s+k)^2+4 ','fontsize' ,11,'color','blue','hor','left');
text(0.4,0.31,'10(s+k) ','fontsize' ,11,'color','blue','hor','left');
