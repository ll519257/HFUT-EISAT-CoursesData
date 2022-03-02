function Flyppt2(T,h_axes,h_axes1) 
 syms t
n=1:10;
fn_p=int(sin(2*pi*t/T)*exp(-2*pi*n*j*t/T),t,0,T)/T;
fn_p1=sym2poly(fn_p);
fn_pabs=abs(fn_p1);
  fn_mabs=fliplr(fn_pabs(1:10));
fnabs=[fn_mabs 0 fn_pabs];
axes(h_axes);Dt=0.001;t=0:Dt:2*T;xa=sin(2*pi*t/T);plot(t,xa);xlabel('t(s)');ylabel('x_a(t)');title('Ô­ÐÅºÅ');grid on;
axes(h_axes1);stem((-10:10),fnabs,'.');xlabel('n');ylabel('·ù¶È(V)');grid;
 
