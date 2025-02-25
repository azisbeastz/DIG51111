%Tutorial 5 Tasks
% EXAMPLE CODE
% 
% % ir = zeros(1, 50000);
% % ir([1, 1000, 5000, 10000, 15000]) = [1, 0.8, 0.7,0.6, 0.5];% create an impulse response
% % 
% % [sig, fs] = audioread('pluck.wav'); %Read Signal
% % sound(sig,fs);
% % 
% % y = conv(sig, ir); % convolve the two signals
% % sound(y,fs);
% % subplot(211), plot(sig);
% % subplot(212), plot(y);
% % plot both signals on same figure.

%TASK1 
% Create impulse response for the echo system
ir = zeros(1, 50000); % Initialize the impulse response with zeros
ir([1, 1000, 5000, 10000, 15000]) = [1, 0.8, 0.7, 0.6, 0.5]; % Create echo response

% Read the audio signal
[sig, fs] = audioread('pluck.wav'); % Read signal from pluck.wav

% Convolve the original signal with the impulse response to create the echo effect
y = conv(sig, ir); % Perform convolution

% Play the original and processed signals
% sound(sig, fs); % Uncomment to play the original signal
% sound(y, fs);   % Uncomment to play the processed signal

% Plot the original signal and the convolved signal (with echo)
subplot(211); 
plot(sig); 
title('Original Signal');
xlabel('Sample index');
ylabel('Amplitude');

subplot(212); 
plot(y); 
title('Signal with Echo');
xlabel('Sample index');
ylabel('Amplitude');

% Play the original signal
disp('Playing the original signal...');
sound(sig, fs); % Play the original signal

% Pause for the duration of the original sound before playing the echoed signal
pause(length(sig) / fs); % Pause to ensure the first sound finishes before playing the second

% Play the convolved signal (echoed signal)
disp('Playing the echoed signal...');
sound(y, fs); % Play the processed (echoed) signal

%%SAM SMITH ECHO CODE%%


t = 