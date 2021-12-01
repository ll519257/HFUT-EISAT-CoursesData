% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02
function xhcdbh1(htext,str1,a,htext1,str2,f,htext2,str3,w,h_axes)

cla,set(htext1, 'string' ,[str2,sprintf( '%1.4g' ,f)]); % 更新静态文本框内容

axes(h_axes);
t=-6:0.01:6;b=w/100;x=a*sin(f*t);plot(t,x);xlabel('t(s)');ylabel('幅度(V)');title('正弦波信号');grid on;