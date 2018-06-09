fs = 11025;
durations = 2;
N = durations*fs;
fprintf('按任意键开始录音。。\n');
pause;
% y = 
p = audiorecorder(N,16,1);
% record(p,5);
record(p);
pause(10);
% pause(p);
% r = play(p)
% stop(p);
y = getaudiodata(p,'int16');
plot(y);