function z = xhfjhc4(h_popup,h_axes); 
val = get(h_popup,'Value');
% Make the GUI axes current
t=-4:pi/1000:4;
% Call appropriate command based on what user selected
    if val == 1
        b=0.5;x1=sawtooth(pi*(t+0.5),b);x2=8*sin(pi*t)/pi^2;
        axes(h_axes);plot(t,x1,'b',t,x2,'r');grid on;xlabel('t/s');ylabel('幅度（V）');axis([0 4 -1.5 1.5]);legend('原信号','合成信号');
    elseif val == 2
        b=0.5;x1=sawtooth(pi*(t+0.5),b);x2=8*(sin(pi*t)-sin(3*pi*t)/9)/pi^2;
        axes(h_axes);plot(t,x1,'b',t,x2,'r');grid on;xlabel('t/s');ylabel('幅度（V）');axis([0 4 -1.5 1.5]);legend('原信号','合成信号');  
    elseif val == 3
        b=0.5;x1=sawtooth(pi*(t+0.5),b);x2=8*(sin(pi*t)-sin(3*pi*t)/9+sin(5*pi*t)/25)/pi^2;
        axes(h_axes);plot(t,x1,'b',t,x2,'r');grid on;xlabel('t/s');ylabel('幅度（V）');axis([0 4 -1.5 1.5]);legend('原信号','合成信号');    
    elseif val == 4
        b=0.5;x1=sawtooth(pi*(t+0.5),b);x2=8*(sin(pi*t)-sin(3*pi*t)/9+sin(5*pi*t)/25-sin(7*pi*t)/49)/pi^2;
        axes(h_axes);plot(t,x1,'b',t,x2,'r');grid on;xlabel('t/s');ylabel('幅度（V）');axis([0 4 -1.5 1.5]);legend('原信号','合成信号');
    end