function Flyppt(T,w,h_axes,h_axes1) 
    tao=w;
      n0=T/tao;
      i=1;e=5*n0;
      while  e-i > 1
          i=i+1;
      end     
      n=0:i;
      fn_p=tao/T*(sin(n*pi*tao/T+eps*(n==0)))./(n*pi*tao/T+eps*(n==0));
      fn_pabs=abs(fn_p);
      fn_mabs=fliplr(fn_pabs(2:i+1));
      fnabs=[fn_mabs fn_pabs];     

   axes(h_axes); t=0:0.001:2*T;duty=100*w/T;x=0.5*square(2*pi*t./T,duty)+0.5;plot(t,x);xlabel('t(s)');ylabel('幅度(V)');title('原信号');grid on; % 画出周期方波
   axis([0,2*T,0,1.2]); line([-10,10],[0,0]);
   axes(h_axes1);stem((-i:i),fnabs,'.');xlabel('n');ylabel('幅度(V)');grid;
