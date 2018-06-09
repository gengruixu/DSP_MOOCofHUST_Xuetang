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
while(1)
% Plot the waveform.
    % Record your voice for 5 seconds.
    recObj = audiorecorder;
%     disp('Start speaking.')
    recordblocking(recObj, 0.002);

    % Play back the recording.
    play(recObj);

    % Store data in double-precision array.
    myRecording = getaudiodata(recObj);
%     x = 0
    plot(myRecording);
%     xlim([x,x+300])
    ylim([-0.2,0.2])
%     x = x+5
%     pause(0.01)
end
    disp('End of Recording.');