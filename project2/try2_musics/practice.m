% file = 'cleanspeech.mat'
% y = load(file,'y')
% y = y.y
% % y = y(1:4001)
% fs = load(file,'fs')
% fs = fs.fs
% t = 0.0001:0.0001:length(y)/10000
% plot(t,y)
% sound(y)
[FileName,PathName] = uigetfile('*.mp3','Select mp3 File');
path = strcat(PathName,FileName)
[y,Fs] = audioread(path,[1500000,2100000]);
% y = y(:,1);
t = 0.00001:0.00001:length(y)/100000
plot(t,y)
sound(y,Fs)
x = 0
while(x<4.15)
    axis([x,x+2,-0.5,0.5])
    x = x+0.005725
    pause(0.025)
end