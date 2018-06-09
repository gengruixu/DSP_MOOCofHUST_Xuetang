Fs = 44100;
dt = 1.0/Fs;
T = 2;
N = T/dt;
t = [0:N-1]/N;
x0 = 0.3*sin(2*pi*600*t);
x = x0 .* exp(-1.5*t)
plot(t,x)
axis([0,0.01,-0.5,0.5]);
p = audioplayer(x,Fs);                  %�°�matlab�Ķ���ԭ��Ϊwaveplayһ����伴��
% play(p,[1 (get(p,'SampleRate')*3)]);    %�°�matlab�Ķ���ԭ��Ϊwaveplayһ����伴��
play(p);
% sound(p)
set(gca,'color',[0.95,0.95,0.95]);