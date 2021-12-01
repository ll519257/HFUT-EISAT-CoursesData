% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02
function xhsyhs9(htext,str1,a,h_axes)
cla,set(htext, 'string' ,[str1,sprintf( '%1.4g' ,a)]); % 更新静态文本框内容 
axes(h_axes);
t=0:0.001:4;ft=a*t;plot(t,ft);axis([0 4 0 4]);xlabel('t(s)');ylabel('幅度(V)');title('斜坡信号');grid on;