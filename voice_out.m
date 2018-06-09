Fs = 44100;
dt = 1.0/Fs;
T = 2;
N = T/dt;
t = [0:N-1]/N;
x0 = 0.3*sin(2*pi*600*t);
x = x0 .* exp(-1.5*t)
plot(t,x)
axis([0,0.01,-0.5,0.5]);
p = audioplayer(x,Fs);                  %新版matlab改动，原本为waveplay一条语句即可
% play(p,[1 (get(p,'SampleRate')*3)]);    %新版matlab改动，原本为waveplay一条语句即可
play(p);
% sound(p)
set(gca,'color',[0.95,0.95,0.95]);