%Task 1
samplerate = 4000;
cutoff = 300;
nyquist = samplerate/2;
ratio = cutoff/nyquist;

b = ratio*sinc(ratio*(-30:30)); %b = sinc function
%% Task 2


% Given parameters
samplerate = 4000;  % Sampling frequency in Hz
cutoff = 300;      % Cutoff frequency in Hz
nyquist = samplerate / 2;  % Nyquist frequency
ratio = cutoff / nyquist;  % Ratio of cutoff frequency to Nyquist frequency

% Create the sinc function (61 points)
b = ratio*sinc(ratio*(-30:30));  % Sinc function (low-pass filter)

% Time vector for signal creation (1 second duration)
t = 0:1/samplerate:1-(1/samplerate);  % 1 second of samples

% Create the signal with two frequency components (150 Hz and 800 Hz)
f1 = 150;  % Frequency component 1 (150 Hz)
f2 = 800;  % Frequency component 2 (800 Hz)
signal = sin(2*pi*f1*t) + sin(2*pi*f2*t);  % Signal with two components

% Apply the sinc filter to the signal (convolution)
filtered_signal = conv(signal, b, 'same');  % Convolve signal with the sinc filter

plot (filtered_signal)


