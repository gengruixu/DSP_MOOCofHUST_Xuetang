fs = 11025;
durations = 2;
N = durations*fs;
fprintf('���������ʼ¼������\n');
pause;
y = wavrecord(N,fs);
plot(y)