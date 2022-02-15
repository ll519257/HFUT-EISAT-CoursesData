% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02
function xhsyhs11(htext,str1,a,htext1,str2,f,htext2,str3,w,h_axes)
cla,set(htext, 'string' ,[str1,sprintf( '%1.4g' ,a)]); % 更新静态文本框内容
cla,set(htext1, 'string' ,[str2,sprintf( '%1.4g' ,f)]); % 更新静态文本框内容
cla,set(htext2, 'string' ,[str3,sprintf( '%1.4g' ,w)]); % 更新静态文本框内容
axes(h_axes);
t=-2:0.01:10;b=w/100;x=a*sawtooth(2*pi*f*t,b)/2;plot(t,x);axis([-2 10 -6 6]);xlabel('t(s)');ylabel('幅度(V)');title('锯齿波信号');grid on;