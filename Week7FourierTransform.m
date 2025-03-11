%% Generate Signal to Analyse
% In this example, we will plot the spectra of a simple sinusoidal signal.
fs = 44100; % sampling frequency (samples per second)
A = 1; % amplitude of the signal
freq = 10000; % frequency of the sine wave (10 kHz)
phase = 1; % phase shift in radians
dur = 0.1; % duration of the signal in seconds

ts = 1/fs; % calculate the sampling period (time between samples)
t = 0:ts:(dur - ts); % generate time vector from 0 to duration (dur) with step size ts
x = A * cos(2*pi*freq*t + phase); % generate the sinusoidal signal with given parameters

%% Compute the DFT using the direct formula
N = length(x); % length of the signal (number of samples)
X = zeros(1, N); % initialize an empty vector to store DFT results

for k = 1:N % loop over each frequency bin (index k represents different frequencies)
    for n = 1:N % loop over each sample of the signal (index n represents the samples in time domain)
        % Calculate the DFT value for the k-th frequency bin using the formula
        X(k) = X(k) + x(n) * exp(-1i * 2 * pi * (k-1) * (n-1) / N);
    end
end

%% Compute the magnitude and phase spectra of the DFT
Xmag = abs(X); % calculate the magnitude spectrum (amplitude of DFT coefficients)
Xphase = angle(X); % calculate the phase spectrum (angle of DFT coefficients)