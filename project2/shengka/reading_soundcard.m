function reading_soundcard()
  global loops;
  loops = 2;
  fs = 44100; % Sampling frequency in Hz
  nbits = 16; % number of bits
  acq_ch = 1; % acquisition channel
  secs2rec= 1;
  % creating object for recording:
  lineinput = audiorecorder(fs, nbits, acq_ch);
  lineinput.StopFcn = {@record_off,lineinput};
  % The function recording_off will be called when the
  % recording is done.
  record(lineinput, secs2rec); % start the recording
end