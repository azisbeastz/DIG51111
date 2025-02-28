%tutorial 2
%TASK1

%audio filename must in same directory of this m file
Filename = 'piano_middle_C.wav';
%First read wav file into memory
[Sig, Fs]=audioread(Filename);
%Sig stores raw audio data in column;
%Fs sampling frequency
Duration = length(Sig)/Fs;%calculates duration of signal with sig/fs
disp(Duration);%displays duration
Ts = 1/Fs;%sampling frequency
Time = 0:Ts:Duration-Ts;%creates an array of time for each sample point
plot(Time',Sig);%plots the graph
ylabel('Amplitude');
xlabel('Time in sec');

%TASK2
%1)
Filesize = Duration*44100*16/8
disp(Filesize)

%2)
info1 = audioinfo("piano_middle_C.wav");
audioinfo(Filename);

%3) Create Matlab code to input the full signal called "Sig”
%and then manipulate the array, assigning samples from 0.5 second
%to 1 second to a new variable called "sig2”
t1 = 0.5;
t2 = 1;
%sample indicies
t1samples = t1*Fs;
t2samples = t2*Fs;
partSig = Sig(t1samples:t2samples);
partTime = Time(t1samples:t2samples);
plot(partTime ,partSig);
audioread("piano_middle_C.wav")

%4)
[mono_audio, Fs] = audioread("piano_middle_C.wav");%loads the mono file 
%replace with the file path
stereo_audio = [mono_audio, mono_audio];%create a stereo audio signal by duplicating the mono signal 
audiowrite('stereo_piano_middle_C.wav', stereo_audio, Fs);%duplicating mono signal into two columns 
plot(stereo_audio)%write the stereo audio to a new file

%5a)
[mono_audio, Fs] = audioread('piano_middle_C.wav', 'native'); %replace with your file path
%time vector for plotting (time in seconds)
t = (0:length(mono_audio)-1) / Fs;
%plot the signal in the time domain
figure;
plot(t, mono_audio);
xlabel('Time (s)');
ylabel('Amplitude');
title('Mono audio signal in time domain (native format');
grid on;

%5b) 1. Double Precision Floating Point (e.g., double)
% What is it?: A way of storing numbers with decimal points (e.g., 3.14159), using 64 bits (8 bytes).
% Precision: It can store very large or very small numbers with lots of digits (15-17 decimal places).
% Used For: Complex calculations in signal processing. It’s common in MATLAB’s internal data for higher accuracy.
% Example: 3.14159, 0.00012345.

%. Signed Integer Numbers (e.g., int16, int32)
% What is it?: Whole numbers (no decimals), and they can be positive or negative.
% Range: The range of numbers depends on the number of bits:
% int16: 16-bit signed integers range from -32768 to 32767.
% int32: 32-bit signed integers range from -2,147,483,648 to 2,147,483,647.
% Used For: Storing audio data in files like WAV, because it’s more compact than floating-point numbers.
% Example: -32768, 12345, -10000.

%Normal vs. Native Format in MATLAB:
% Normal Format: MATLAB usually works with double precision numbers (e.g., double), so audio values are converted to the range [-1, 1].
% Native Format: When using 'native', MATLAB reads the audio file exactly as stored. For example, if the file is in 16-bit integers (int16),
% MATLAB will return the data in the original integer format with values like [-32768, 32767].

%6)
% Step 1: Read the audio file with 'native' argument
[mono_audio_native, fs] = audioread('piano_middle_C.wav', 'native');  % Replace with your file path

% Step 2: Normalize the audio to the range [-1, 1]
% For int16, the range is from -32768 to 32767.
max_val = double(intmax(class(mono_audio_native)));  % Get the maximum value for the native format (e.g., 32767 for int16)

% Step 3: Normalize the audio
normalized_audio = double(mono_audio_native) / max_val;  % Convert to double and normalize

% Step 4: Verify the result (optional)
% Plot the normalized audio signal
t = (0:length(normalized_audio)-1) / fs;  % Time vector in seconds
figure;
plot(t, normalized_audio);
xlabel('Time (s)');
ylabel('Amplitude');
title('Normalized Mono Audio Signal (Range [-1, 1])');
grid on;

% Step 5: Optionally, save the normalized audio to a new file (in double precision)
audiowrite('normalized_piano_middle_C.wav', normalized_audio, fs);

%7) 
% Load an audio file
[signal, fs] = audioread('piano_middle_C.wav');  % Replace with your file path

% Calculate the RMS of the audio signal
rms_value = rms(signal);

% Display the result
disp(['RMS value of the audio signal: ', num2str(rms_value)]);

