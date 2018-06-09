% % Record your voice for 5 seconds.
% recObj = audiorecorder;
% disp('Start speaking.')
% recordblocking(recObj, 5);
% disp('End of Recording.');
% 
% % Play back the recording.
% play(recObj);
% 
% % Store data in double-precision array.
% myRecording = getaudiodata(recObj);
% x = 0
%     recObj = audiorecorder;
%     disp('Start speaking.')
%      play(recObj);
%  play(recObj);
while(1)
% Plot the waveform.
    % Record your voice for 5 seconds.
    recObj = audiorecorder;
%     disp('Start speaking.')
    recordblocking(recObj, 0.1);

    % Play back the recording.
%     play(recObj);

    % Store data in double-precision array.
    myRecording = getaudiodata(recObj);
%     x = 0
    subplot(211)
    plot(myRecording);
    ylim([-0.2,0.2])
    fft_x = fftshift(fft(myRecording));
    w = linspace(-4000, 4000, 800);
    subplot(212)
    plot(w,abs(fft_x));
%     xlim([x,x+300])
    
%     x = x+5
%     pause(0.01)
end
    disp('End of Recording.');