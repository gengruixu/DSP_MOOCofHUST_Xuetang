clear all;
Fs = 11025;
N = 8192;
filename = '1.mp3'
[y,Fs] = audioread(filename,[5,100000])
audiowrite('2.wav',y,Fs);
y = y';
y = y.*30
y = y(1,:)
audiowrite('3.wav',y,Fs);
% y = wavrecord(N, Fs);
y = y(N/2+1:N);
N = 4096;
x = linspace(0,N,N);
subplot(2,1,1);
plot(x,y,'b','LineWidth',1.5);
P = fft(y',N);
Pyy = 2 *sqrt(P.*conj(P))/N;
f = linspace(0,Fs/2,N/2);
subplot(2,1,2);
plot(f,Pyy(1:N/2),'b','LineWidth',1.5);
