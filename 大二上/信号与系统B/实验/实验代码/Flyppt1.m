function Flyppt1(T,w,h_axes,h_axes1) 
    syms t
    tao=w;
      n0=T/tao;
      i=1;e=5*n0;
      while  e-i > 1
          i=i+1;
      end     
      n=1:i;
  fn_p0=int(t/w,t,0,w)/T+int((1-(t-w)/(T-w)),t,w,T)/T;
 fn_p2=sym2poly(fn_p0);
fn_pb=int(t*exp(-2*pi*n*j*t/T)/w,t,0,w)/T+int((1-(t-w)/(T-w))*exp(-2*pi*n*j*t/T),t,w,T)/T;
fn_pb1=sym2poly(fn_pb);
fn_pabsb=abs(fn_pb1);
fn_mabsb=fliplr(fn_pabsb(1:i));
fnabs=[fn_mabsb fn_p2 fn_pabsb];
axes(h_axes);t=0:0.01:2*T;x=sawtooth(2*pi*t/T,w/T)/2+0.5;plot(t,x);xlabel('t(s)');ylabel('幅度(V)');title('原信号');grid on;% 画出锯齿波
axes(h_axes1);stem(-i:i,fnabs,'.');xlabel('n');ylabel('幅度(V)');grid; 