% [FileName,PathName] = uigetfile('*.m4a','Select mp3 File');
% path = strcat(PathName,FileName)
% [y,Fs] = audioread(path);
% % y = y(:,1);
% t = 0.00001:0.00001:length(y)/100000
% plot(t,y)
% sound(y,Fs)
% x = 0
% while(x<4.15)
%     axis([x,x+2,-0.5,0.5])
%     x = x+0.005725
%     pause(0.025)
% end

y = load('Re_p.mat','y');
y = y.y;
% y = y(1:4001)
Fs = load('Re_p.mat','Fs');
Fs = Fs.Fs;
t = 0.0001:0.0001:length(y)/10000;
plot(t,y);
sound(y);
