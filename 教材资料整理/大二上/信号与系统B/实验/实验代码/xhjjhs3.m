function z = xhjjhs3(h_popup,h_popup1,h_axes,h_axes1,h_axes2); 
val = get(h_popup,'Value');
val1 = get(h_popup1,'Value');
% Make the GUI axes current
T=0.01;t1=6;t2=6;t=0:T:t1+t2;
% Call appropriate command based on what user selected
if val == 1
    if val1 == 1
        x1=sin(t).*((t>0)-(t>t1));x2=sin(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 2
        x1=sin(t).*((t>0)-(t>t1));x2=cos(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');    
    elseif val1 == 3
        x1=sin(t).*((t>0)-(t>t1));x2=t.*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');        
    elseif val1 == 4
        x1=sin(t).*((t>0)-(t>t1));x2=0.5*t.^2.*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');    
    elseif val1 == 5
        x1=sin(t).*((t>0)-(t>t1));x2=exp(-t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 6
        x1=sin(t).*((t>0)-(t>t1));x2=sinc(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 7
        x1=sin(t).*((t>0)-(t>t1));x2=ones(size(t)).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s'); 
    end
    
elseif val == 2
    if val1 == 1
        x1=cos(t).*((t>0)-(t>t1));x2=sin(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 2
        x1=cos(t).*((t>0)-(t>t1));x2=cos(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');   
    elseif val1 == 3
        x1=cos(t).*((t>0)-(t>t1));x2=t.*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 4
        x1=cos(t).*((t>0)-(t>t1));x2=0.5*t.^2.*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 5
        x1=cos(t).*((t>0)-(t>t1));x2=exp(-t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 6
        x1=cos(t).*((t>0)-(t>t1));x2=sinc(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s'); 
    elseif val1 == 7
        x1=cos(t).*((t>0)-(t>t1));x2=ones(size(t)).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s'); 
    end; 
elseif val == 3
    if val1 == 1
        x1=t.*((t>0)-(t>t1));x2=sin(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 2
        x1=t.*((t>0)-(t>t1));x2=cos(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');  
    elseif val1 == 3
        x1=t.*((t>0)-(t>t1));x2=t.*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 4
        x1=t.*((t>0)-(t>t1));x2=0.5*t.^2.*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 5
        x1=t.*((t>0)-(t>t1));x2=exp(-t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 6
        x1=t.*((t>0)-(t>t1));x2=sinc(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s'); 
    elseif val1 == 7
        x1=t.*((t>0)-(t>t1));x2=ones(size(t)).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s'); 
    end
 elseif val == 4
    if val1 == 1
        x1=0.5*t.^2.*((t>0)-(t>t1));x2=sin(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 2
        x1=0.5*t.^2.*((t>0)-(t>t1));x2=cos(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');  
    elseif val1 == 3
        x1=0.5*t.^2.*((t>0)-(t>t1));x2=t.*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 4
        x1=0.5*t.^2.*((t>0)-(t>t1));x2=0.5*t.^2.*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 5
        x1=0.5*t.^2.*((t>0)-(t>t1));x2=exp(-t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 6
        x1=0.5*t.^2.*((t>0)-(t>t1));x2=sinc(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s'); 
   elseif val1 == 7
        x1=0.5*t.^2.*((t>0)-(t>t1));x2=ones(size(t)).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s'); 
    end
 elseif val == 5
     if val1 == 1
        x1=exp(-t).*((t>0)-(t>t1));x2=sin(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 2
        x1=exp(-t).*((t>0)-(t>t1));x2=cos(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 3
        x1=exp(-t).*((t>0)-(t>t1));x2=t.*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 4
        x1=exp(-t).*((t>0)-(t>t1));x2=0.5*t.^2.*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 5
        x1=exp(-t).*((t>0)-(t>t1));x2=exp(-t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 6
        x1=exp(-t).*((t>0)-(t>t1));x2=sinc(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 7
        x1=exp(-t).*((t>0)-(t>t1));x2=ones(size(t)).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
     end 
elseif val == 6
    if val1 == 1
        x1=sinc(t).*((t>0)-(t>t1));x2=sin(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 2
        x1=sinc(t).*((t>0)-(t>t1));x2=cos(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 3
        x1=sinc(t).*((t>0)-(t>t1));x2=t.*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 4
        x1=sinc(t).*((t>0)-(t>t1));x2=0.5*t.^2.*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 5
        x1=sinc(t).*((t>0)-(t>t1));x2=exp(-t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 6
        x1=sinc(t).*((t>0)-(t>t1));x2=sinc(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s'); 
    elseif val1 == 7
        x1=sinc(t).*((t>0)-(t>t1));x2=ones(size(t)).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s'); 
    end
  elseif val == 7
    if val1 == 1
        x1=ones(size(t)).*((t>0)-(t>t1));x2=sin(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 2
        x1=ones(size(t)).*((t>0)-(t>t1));x2=cos(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 3
        x1=ones(size(t)).*((t>0)-(t>t1));x2=t.*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 4
        x1=ones(size(t)).*((t>0)-(t>t1));x2=0.5*t.^2.*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 5
        x1=ones(size(t)).*((t>0)-(t>t1));x2=exp(-t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 6
        x1=ones(size(t)).*((t>0)-(t>t1));x2=sinc(t).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    elseif val1 == 7
        x1=ones(size(t)).*((t>0)-(t>t1));x2=ones(size(t)).*((t>0)-(t>t2));y=conv(x1,x2)*T;
        axes(h_axes);plot(t,x1);grid on;ylabel('x(t)');
        axes(h_axes1);plot(t,x2);grid on;ylabel('h(t)');
        axes(h_axes2);plot(t,y(1:(t2+t1)/T+1));grid on;ylabel('y(t)=x(t)*h(t)');xlabel('t/s');
    end  
    
end   