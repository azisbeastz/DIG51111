%Independent Task 1

function Output = my_convolution(signal, IR)
    % Ensure both signal and impulse response are row vectors
    if size(signal, 1) > 1
        signal = signal';  % Convert to row vector if signal is a column
    end
    if size(IR, 1) > 1
        IR = IR';  % Convert to row vector if IR is a column
    end
    
    % Length of the signal and impulse response
    signal_len = length(signal);
    IR_len = length(IR);
    
    % Output length
    Output_len = signal_len + IR_len - 1;
    
    % Initialize output to zero
    Output = zeros(1, Output_len);
    
    % Perform the convolution
    for i = 1:signal_len
        for ii = 1:IR_len
            % Update the output using the formula for convolution
            Output(i + ii - 1) = Output(i + ii - 1) + signal(i) * IR(ii);
        end
    end
end
