% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02
function xhsyhs5(htext,str1,z,htext1,str2,f,htext2,str3,duty,h_axes)
cla,set(htext, 'string' ,[str1,sprintf( '%1.4g' ,z)]); % 更新静态文本框内容 
cla,set(htext1, 'string' ,[str2,sprintf( '%1.4g' ,f)]); % 更新静态文本框内容 
cla,set(htext2, 'string' ,[str3,sprintf( '%1.4g' ,duty)]); % 更新静态文本框内容 
axes(h_axes);
t=-1:0.001:1;y=0.5*z*square(2*pi*f*t,duty); plot(t,y);axis([-1 1 -6 6]);xlabel('t(s)');ylabel('幅度(V)');title('矩形波信号');grid on;