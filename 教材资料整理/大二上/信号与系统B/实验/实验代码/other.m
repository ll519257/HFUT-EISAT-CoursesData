% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02 
function other(htext,str1,t0,htext1,str2,w0,h_axes3,h_axes4)
cla,set(htext, 'string' ,[str1,sprintf( '%1.4g' ,t0)]); % 更新静态文本框内容
cla,set(htext1, 'string' ,[str2,sprintf( '%1.4g' ,w0)]); % 更新静态文本框内容

axes(h_axes3);t=-5:0.001:5;y=sin(w0*pi*t);plot(t,y,'b');title('尺度变换');axis([-3 3 -1 1]);grid on;
axes(h_axes4);t=-5:0.001:5;y=sin(pi*(t-t0));plot(t,y,'b');title('信号延迟');axis([-3 3 -1 1]);grid on;
