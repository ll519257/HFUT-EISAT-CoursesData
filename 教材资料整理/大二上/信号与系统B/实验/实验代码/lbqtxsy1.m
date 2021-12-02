function lbqtxsy1(h_popup,Wp)
selected_cmd = get(h_popup,'Value');
% Make the GUI axes current
% Call appropriate command based on what user selected
switch selected_cmd
case 1 % 低通滤波器
     [b,a]=butter(2,Wp,'low','s');[c,d]=butter(4,Wp,'s');figure(4);bode(b,a);hold on;bode(c,d);legend('二阶','四阶');grid on;title('二阶、四阶巴特沃斯低通滤波器');hold off;clear;
case 2 % 高通滤波器
    [b,a]=butter(2,Wp,'high','s');[c,d]=butter(4,Wp,'high','s');figure(4);bode(b,a);hold on;bode(c,d);legend('二阶','四阶');grid on;title('二阶、四阶巴特沃斯高通滤波器');hold off;clear;
case 3 %带通滤波器
    [b,a]=butter(2,Wp,'bandpass','s');[c,d]=butter(4,Wp,'bandpass','s');figure(4);bode(b,a);hold on;bode(c,d);legend('二阶','四阶');grid on;title('二阶、四阶巴特沃斯带通滤波器');hold off;clear;
case 4 % 带阻滤波器
    [b,a]=butter(2,Wp,'stop','s');[c,d]=butter(4,Wp,'stop','s');figure(4);bode(b,a);hold on;bode(c,d);legend('二阶','四阶');grid on;title('二阶、四阶巴特沃斯带阻滤波器');hold off;clear;
end