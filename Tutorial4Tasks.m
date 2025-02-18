%Tutorial4Tasks

% Load the .wav file (replace 'filename' with the actual file name)
[signal, Fs] = audioread('Church.wav'); % Example with Church.wav

% Step 1: Apply clipping distortion
threshold_high = 0.5;
threshold_low = -0.5;

clip = signal; % Start with the original signal

% Apply clipping: If signal exceeds the threshold, it gets clipped
clip(clip > threshold_high) = threshold_high;
clip(clip < threshold_low) = threshold_low;

% Step 2: Normalize the clipped signal
clip = clip / max(abs(clip)); % Normalize to make sure it's within -1 to 1

% Step 3: Plot the clipped signal (only a portion for visibility)
plot(clip(1:1000)); % Plot the first 1000 samples for clarity
axis([1, 1000, -1, 1]); % Zoom in to see the clipped signal
grid on;
title('Clipped Audio Signal');
xlabel('Sample Index');
ylabel('Amplitude');

% Optionally, play the clipped signal
sound(clip, Fs);
