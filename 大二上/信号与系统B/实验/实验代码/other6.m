% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02 
function other6(htext,str1,t6,htext1,str2,w6,h_axes3,h_axes4)
cla,set(htext, 'string' ,[str1,sprintf( '%1.4g' ,t6)]); % 更新静态文本框内容
cla,set(htext1, 'string' ,[str2,sprintf( '%1.4g' ,w6)]); % 更新静态文本框内容

axes(h_axes3);t=-5:0.001:5;y=square(pi*w6*t);plot(t,y,'b');title('尺度变换');axis([-3 3 -1.5 1.5]);grid on;
axes(h_axes4);t=-5:0.001:5;y=square(pi*(t-t6));plot(t,y,'b');title('信号延迟');axis([-3 3 -1.5 1.5]);grid on;