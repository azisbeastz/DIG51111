% Parameters
Fs = 22050;     % Sampling frequency (22050 Hz)
dur = 1;        % Duration of the noise signal in seconds

% Create a noise signal using randn (Gaussian noise)
noise_signal = randn(1, Fs * dur);  % 1 second of noise

% Normalize the signal to avoid clipping
noise_signal = noise_signal / max(abs(noise_signal));  % Normalize to the range [-1, 1]

% Open Signal Analyzer to visualize the signal spectrum (if applicable)
try
    signalAnalyzer(noise_signal, Fs);  % Try using signalAnalyzer
catch
    % If it fails, plot the spectrum manually using FFT
    N = length(noise_signal);  % Number of samples
    f = (0:N-1)*(Fs/N);  % Frequency vector
    Y = fft(noise_signal);  % Compute the FFT of the signal

    % Plot the magnitude of the FFT (frequency spectrum)
    figure;
    plot(f(1:N/2), abs(Y(1:N/2)));  % Plot the first half of the spectrum
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('Frequency Spectrum of Noise Signal');
    grid on;
end

% Write the noise signal to a WAV file
audiowrite('noise_signal.wav', noise_signal, Fs);
