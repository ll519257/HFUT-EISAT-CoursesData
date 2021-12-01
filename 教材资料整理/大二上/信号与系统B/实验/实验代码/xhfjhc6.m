function z = xhfjhc6(h_popup,h_axes); 
val = get(h_popup,'Value');
% Make the GUI axes current
t=-4:pi/1000:4;
% Call appropriate command based on what user selected
    if val == 1
        x1=abs(sin(pi*t));x2=4*(1/2-cos(2*pi*t)/3)/pi;
        axes(h_axes);plot(t,x1,'b',t,x2,'r');grid on;xlabel('t/s');ylabel('幅度（V）');axis([0 3 -0.5 1.5]);legend('原信号','合成信号');
    elseif val == 2
        x1=abs(sin(pi*t));x2=4*(1/2-cos(2*pi*t)/3-cos(4*pi*t)/15)/pi;
        axes(h_axes);plot(t,x1,'b',t,x2,'r');grid on;xlabel('t/s');ylabel('幅度（V）');axis([0 3 -0.5 1.5]);legend('原信号','合成信号');  
    elseif val == 3
        x1=abs(sin(pi*t));x2=4*(1/2-cos(2*pi*t)/3-cos(4*pi*t)/15-cos(6*pi*t)/35)/pi;
        axes(h_axes);plot(t,x1,'b',t,x2,'r');grid on;xlabel('t/s');ylabel('幅度（V）');axis([0 3 -0.5 1.5]);legend('原信号','合成信号');    
    elseif val == 4
        x1=abs(sin(pi*t));x2=4*(1/2-cos(2*pi*t)/3-cos(4*pi*t)/15-cos(6*pi*t)/35-cos(8*pi*t)/63)/pi;
        axes(h_axes);plot(t,x1,'b',t,x2,'r');grid on;xlabel('t/s');ylabel('幅度（V）');axis([0 3 -0.5 1.5]);legend('原信号','合成信号');
    end