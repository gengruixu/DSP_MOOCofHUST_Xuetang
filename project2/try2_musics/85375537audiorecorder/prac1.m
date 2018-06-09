r = audiorecorder(22050,16,1)
while(1)
    record(r)
    pause(5)
    p = play(r)
    pause(5)
end