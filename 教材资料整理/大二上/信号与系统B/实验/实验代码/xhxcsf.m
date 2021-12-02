function z = xhxcsf(h_popup,h_popup1,h_axes); 
val = get(h_popup,'Value');
val1 = get(h_popup1,'Value');
% Make the GUI axes current
t1=6;
t=-8:pi/60:8;
% Call appropriate command based on what user selected
if val == 1
    if val1 == 1
        x1=sin(t);x2=sin(t);x=sin(t).^2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g--',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 2
        x1=sin(t);x2=cos(t);x=sin(t).*cos(t);
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');    
    elseif val1 == 3
        x1=sin(t);x2=t;x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');        
    elseif val1 == 4
        x1=sin(t);x2=exp(-t).*((t>0)-(t>t1));x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');  
    elseif val1 == 5
        x1=sin(t);x2=exp(-t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');axis([-8 8 -10 200]);grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 6
        x1=sin(t);x2=sinc(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 7
        x1=sin(t);x2=1*(t>0);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    end
    
elseif val == 2
    if val1 == 1
        x1=cos(t);x2=sin(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 2
        x1=cos(t);x2=cos(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g--',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');  
    elseif val1 == 3
        x1=cos(t);x2=t;x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 4
        x1=cos(t);x2=exp(-t).*((t>0)-(t>t1));x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 5
        x1=cos(t);x2=exp(-t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');axis([-8 8 -50 1000]);grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 6
        x1=cos(t);x2=sinc(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 7
        x1=cos(t);x2=1*(t>0);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    end; 
elseif val == 3
    if val1 == 1
        x1=t;x2=sin(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 2
        x1=t;x2=cos(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 3
        x1=t;x2=t;x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g--',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 4
        x1=t;x2=exp(-t).*((t>0)-(t>t1));x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 5
        x1=t;x2=exp(-t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 6
        x1=t;x2=sinc(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 7
        x1=t;x2=1*(t>0);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    end
 elseif val == 4
    if val1 == 1
        x1=exp(-t).*((t>0)-(t>t1));x2=sin(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 2
        x1=exp(-t).*((t>0)-(t>t1));x2=cos(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 3
        x1=exp(-t).*((t>0)-(t>t1));x2=t;x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 4
        x1=exp(-t).*((t>0)-(t>t1));x2=exp(-t).*((t>0)-(t>t1));x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g--',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 5
        x1=exp(-t).*((t>0)-(t>t1));x2=exp(-t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');axis([-8 8 0 10]);grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 6
        x1=exp(-t).*((t>0)-(t>t1));x2=sinc(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
   elseif val1 == 7
        x1=exp(-t).*((t>0)-(t>t1));x2=1*(t>0);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    end
 elseif val == 5
     if val1== 1
        x1=exp(-t);x2=sin(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');axis([-8 8 -50 180]);grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 2
        x1=exp(-t);x2=cos(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');axis([-8 8 -50 900]);grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 3
        x1=exp(-t);x2=t;x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 4
        x1=exp(-t);x2=exp(-t).*((t>0)-(t>t1));x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');axis([-8 8 0 10]);grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 5
        x1=exp(-t);x2=exp(-t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g--',t,x,'r');grid on;xlabel('t/s');axis([-8 8 0 10]);ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 6
        x1=exp(-t);x2=sinc(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');axis([-8 8 -100 100]);grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 7
        x1=exp(-t);x2=1*(t>0);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');axis([-8 8 0 10]);grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
     end 
elseif val == 6
    if val1 == 1
        x1=sinc(t);x2=sin(t);x=x1.*x2;
       axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 2
        x1=sinc(t);x2=cos(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 3
        x1=sinc(t);x2=t;x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 4
        x1=sinc(t);x2=exp(-t).*((t>0)-(t>t1));x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 5
        x1=sinc(t);x2=exp(-t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');axis([-8 8 -100 100]);grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 6
        x1=sinc(t);x2=sinc(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g--',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 7
        x1=sinc(t);x2=1*(t>0);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    end
  elseif val == 7
    if val1 == 1
       x1=1*(t>0);x2=sin(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 2
        x1=1*(t>0);x2=cos(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 3
        x1=1*(t>0);x2=t;x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 4
        x1=1*(t>0);x2=exp(-t).*((t>0)-(t>t1));x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 5
        x1=1*(t>0);x2=exp(-t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');axis([-8 8 0 10]);grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 6
        x1=1*(t>0);x2=sinc(t);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    elseif val1 == 7
        x1=1*(t>0);x2=1*(t>0);x=x1.*x2;
        axes(h_axes);plot(t,x1,'b',t,x2,'g',t,x,'r');grid on;xlabel('t/s');ylabel('幅度（V）');legend('x(t)','h(t)','x(t)×h(t)');
    end  
    
end   