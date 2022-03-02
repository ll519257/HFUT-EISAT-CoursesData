% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02 
function other3(htext,str1,t3,htext1,str2,w3,h_axes3,h_axes4)
cla,set(htext, 'string' ,[str1,sprintf( '%1.4g' ,t3)]); % 更新静态文本框内容
cla,set(htext1, 'string' ,[str2,sprintf( '%1.4g' ,w3)]); % 更新静态文本框内容

axes(h_axes3);t=-5:0.001:5;t1=6;y=exp(-w3*2*t).*((t>0)-(t>t1));plot(t,y,'b');title('尺度变换');axis([-3 3 0 1]);grid on;
axes(h_axes4);t=-5:0.001:5;y=exp(-2*(t-t3)).*((t>(0+t3))-(t>(t1+t3)));plot(t,y,'b');title('信号延迟');axis([-3 3 0 1]);grid on;