%% Generate Signal to Analyse
% In this example we will plot the spectra of a simple sinusoidal signal.
fs = 44100; % sampling frequency
A = 1; % amplitude
freq = 10000; % frequency
phase = 1; % phase in radians
dur = 0.1; % duration in seconds

 ts = 1/fs; % calculate the sampling period
 t = 0:ts:(dur - ts); % generate sample times
 x = A * cos(2*pi*freq*t + phase);

% Compute the DFT using the direct formula
N = length(x);
X = zeros(1, N);
for k = 1:N %frequnecy buns 
for n = 1:N %values on=f g]n
X(k) = X(k) + x(n) * exp(-1i * 2 * pi * (k-1) * (n-1) / N);
end
end
% Compute the magnitude spectrum of the DFT 
Xmag = abs(X);
% Compute the phase spectrum of the DFT 
Xphase = angle(X);