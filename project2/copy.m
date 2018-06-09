function my_callback_fcn(handles)
global Z1; global Z2;
Fs = 11025;
N = 8192;
y = wavrecord(N, Fs);
y = y(N/2+1:N);
N = 4096;
x = linspace(0,N,N);
plot(h.axes1,x,y,'b','LineWidth',1.5);
ylim(h.axes1,[-Z1,Z1]);
grid(h.axes1);
P = fft(y,N);
Pyy = 2 *sqrt(P.*conj(P))/N;
f = linspace(0,Fs/2,N/2);
plot(h.axes2,f,Pyy(1:N/2),'b','LineWidth',1.5);
ylim(h.axes2,[0,0.1*Z2]);
grid(h.axes2);