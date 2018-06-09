fs = 11025;
durations = 2;
N = durations*fs;
fprintf('按任意键开始录音。。\n');
pause;
y = wavrecord(N,fs);
plot(y)