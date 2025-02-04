%audio filename must in same directory of this m file
Filename = 'piano_middle_C.wav';

%First read wav file into memory
[Sig, Fs]=audioread(Filename);

%Sig stores raw audio data in column;
%Fs sampling frequency
Duration = length(Sig)/Fs;
disp(Duration);
Ts = 1/Fs;
Time = 0:Ts:Duration-Ts;
plot(Time',Sig);
ylabel('Amplitude');
xlabel('Duration');


%method 2: Create Matlab code to input the full signal called “Sig”
%and then manipulate the array, assigning samples from 0.5 second
%to 1 second to a new variable called "sig2”
 
%%sig_cropped = sig(Fs*0.5:Sig*1);
plot(sig_cropped)%%

info1 = audioinfo("piano_middle_C.wav");
audioinfo(Filename);

t1 = 0.5;
t2 = 1;
%sample indicies
t1samples = t1*Fs;
t2samples = t2*Fs;

partSig = Sig(t1samples:t2samples);
partTime = Time(t1samples:t2samples);
plot(partTime ,partSig);

audioread("piano_middle_C.wav")