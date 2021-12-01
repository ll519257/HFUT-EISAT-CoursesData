function z = xhjjhs1(h_popup,h_popup1,h_axes,h_axes1,h_axes2); 
val = get(h_popup,'Value');
val1 = get(h_popup1,'Value');
% Make the GUI axes current
% Call appropriate command based on what user selected
if val == 1
    if val1 == 1
        x=[1,2,3,4,5,6,7];y=[1,0,1,0,1,0,1];z=conv(x,y);
        axes(h_axes);stem(0:length(x)-1,x);ylabel('x(n)');grid on;
        axes(h_axes1);stem(0:length(y)-1,y);ylabel('y(n)');grid on;
        axes(h_axes2);stem(0:length(z)-1,z);xlabel('n');ylabel('x(n)*y(n)');grid on;
    elseif val1 == 2
         x=[1,2,3,4,5,6,7];y=[3,1,4,1,5,9,2];z=conv(x,y);
        axes(h_axes);stem(0:length(x)-1,x);ylabel('x(n)');grid on;
        axes(h_axes1);stem(0:length(y)-1,y);ylabel('y(n)');grid on;
        axes(h_axes2);stem(0:length(z)-1,z);xlabel('n');ylabel('x(n)*y(n)');grid on;
    elseif val1 == 3
        x=[1,2,3,4,5,6,7];y=[1,2,3,1,2,3];z=conv(x,y);
        axes(h_axes);stem(0:length(x)-1,x);ylabel('x(n)');grid on;
        axes(h_axes1);stem(0:length(y)-1,y);ylabel('y(n)');grid on;
        axes(h_axes2);stem(0:length(z)-1,z);xlabel('n');ylabel('x(n)*y(n)');grid on;  
    end
elseif val == 2
    if val1 == 1
        x=[1,1,1,1,1,1];y=[1,0,1,0,1,0,1];z=conv(x,y);
        axes(h_axes);stem(0:length(x)-1,x);ylabel('x(n)');grid on;
        axes(h_axes1);stem(0:length(y)-1,y);ylabel('y(n)');grid on;
        axes(h_axes2);stem(0:length(z)-1,z);xlabel('n');ylabel('x(n)*y(n)');grid on;
    elseif val1 == 2
         x=[1,1,1,1,1,1];y=[3,1,4,1,5,9,2];z=conv(x,y);
        axes(h_axes);stem(0:length(x)-1,x);ylabel('x(n)');grid on;
        axes(h_axes1);stem(0:length(y)-1,y);ylabel('y(n)');grid on;
        axes(h_axes2);stem(0:length(z)-1,z);xlabel('n');ylabel('x(n)*y(n)');grid on;
    elseif val1 == 3
        x=[1,1,1,1,1,1];y=[1,2,3,1,2,3];z=conv(x,y);
        axes(h_axes);stem(0:length(x)-1,x);ylabel('x(n)');grid on;
        axes(h_axes1);stem(0:length(y)-1,y);ylabel('y(n)');grid on;
        axes(h_axes2);stem(0:length(z)-1,z);xlabel('n');ylabel('x(n)*y(n)');grid on; 
    end
elseif val == 3
    if val1 == 1
        x=[1,2,1,2,1,2,1,2];y=[1,0,1,0,1,0,1];z=conv(x,y);
        axes(h_axes);stem(0:length(x)-1,x);ylabel('x(n)');grid on;
        axes(h_axes1);stem(0:length(y)-1,y);ylabel('y(n)');grid on;
        axes(h_axes2);stem(0:length(z)-1,z);xlabel('n');ylabel('x(n)*y(n)');grid on;
    elseif val1 == 2
        x=[1,2,1,2,1,2,1,2];y=[3,1,4,1,5,9,2];z=conv(x,y);
        axes(h_axes);stem(0:length(x)-1,x);ylabel('x(n)');grid on;
        axes(h_axes1);stem(0:length(y)-1,y);ylabel('y(n)');grid on;
        axes(h_axes2);stem(0:length(z)-1,z);xlabel('n');ylabel('x(n)*y(n)');grid on;
    elseif val1 == 3
        x=[1,2,1,2,1,2,1,2];y=[1,2,3,1,2,3];z=conv(x,y);
        axes(h_axes);stem(0:length(x)-1,x);ylabel('x(n)');grid on;
        axes(h_axes1);stem(0:length(y)-1,y);ylabel('y(n)');grid on;
        axes(h_axes2);stem(0:length(z)-1,z);xlabel('n');ylabel('x(n)*y(n)');grid on; 
    end
end