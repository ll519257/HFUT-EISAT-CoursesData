
t=-4:pi/100:4;
figure(3);subplot(2,1,1),plot(t,sin(t));grid on;ylabel('y=sin(t)');title('原信号');xlabel('t/s');subplot(2,1,2),plot(t,sin(-t));grid on;ylabel('y=sin(-t)');title('反折信号');xlabel('t/s')
    