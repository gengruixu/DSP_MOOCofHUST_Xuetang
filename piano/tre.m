Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt
t = linspace(0, T, N);
x = 0.3*sin(2*pi*247*t);
plot(t,x);
axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);