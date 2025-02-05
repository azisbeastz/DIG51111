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
sig_cropped = sig(Fs*0.5:Sig*1);
kplot(sig_cropped)