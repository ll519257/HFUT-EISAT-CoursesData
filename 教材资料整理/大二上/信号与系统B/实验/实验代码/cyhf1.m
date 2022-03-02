% Copyright (c) 1997-2000 by TH Technology, Inc.
% All Rights Reserved.
% Date: 2006/01/02   
syms t
n=1:4;
fn_p=int(sin(2*pi*t)*exp(-2*pi*n*j*t),t,-0.5,0.5);
fn_p1=sym2poly(fn_p);
fn_pabs=abs(fn_p1);
  fn_mabs=fliplr(fn_pabs(1:4));
fnabs=[fn_mabs 0 fn_pabs];
figure(3);subplot(2,1,1);Dt=0.001;t=0:Dt:3;xa=sin(2*pi*t);plot(t,xa);xlabel('t(s)');ylabel('x_a(t)');title('Ô­ÐÅºÅ');grid on;
subplot(2,1,2);stem((-4:4),fnabs,'.');xlabel('n');ylabel('·ù¶È(V)');grid;