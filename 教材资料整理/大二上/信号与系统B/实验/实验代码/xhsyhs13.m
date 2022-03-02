% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02 
function xhsyhs13(htext,str1,a,htext1,str2,t,h_axes)
cla,set(htext, 'string' ,[str1,sprintf( '%1.4g' ,a)]); % 更新静态文本框内容
cla,set(htext1, 'string' ,[str2,sprintf( '%1.4g' ,t)]); % 更新静态文本框内容
axes(h_axes);
x=0:0.001:10;y=a*(x>t);plot(x,y);axis([0 10 -10 10]);xlabel('t(s)');ylabel('幅度(V)');title('阶跃信号');grid on;