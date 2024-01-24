function [quantizedSignal,compressedSignal] = func_mu_law(inputSignal, quantizationLevel)
    % Constants
    mu = 2;  % Common value for mu in µ-law

    % Normalize the input signal
    maxVal = max(abs(inputSignal));
    normalizedSignal = inputSignal / maxVal;

    % Apply µ-law compression
    compressedSignal_rt = sign(real(normalizedSignal)) .* log(1 + mu * abs(real(normalizedSignal))) / log(1 + mu);
    compressedSignal_it = sign(imag(normalizedSignal)) .* log(1 + mu * abs(imag(normalizedSignal))) / log(1 + mu);
    compressedSignal = compressedSignal_rt + compressedSignal_it*1i;
    
% Quantize the compressed signal_rt
    % Assuming uniform quantization for the compressed signal
    levels = 2^quantizationLevel;
    % Assuming the input signal range is [-1, 1]
    % Scale the signal to [0, levels-1]
    scaledSignal_rt = (compressedSignal_rt + 1) * (levels - 1) / 2;
    % Round the values to the nearest integer
    quantizedValues_rt = round(scaledSignal_rt);
    % Scale back to the original range [-1, 1]
    quantizedSignal_rt = (quantizedValues_rt * 2 / (levels - 1)) - 1;
% Quantize the compressed signal_it
    % Scale the signal to [0, levels-1]
    scaledSignal_it = (compressedSignal_it + 1) * (levels - 1) / 2;
    % Round the values to the nearest integer
    quantizedValues_it = round(scaledSignal_it);
    % Scale back to the original range [-1, 1]
    quantizedSignal_it = (quantizedValues_it * 2 / (levels - 1)) - 1;
%combine
    quantizedSignal = quantizedSignal_rt + quantizedSignal_it*1i;


    % Apply inverse µ-law expansion
    %quantizedSignal = sign(quantizedSignal) .* (1/mu) .* ((1 + mu).^abs(quantizedSignal) - 1);
    
    % Rescale to the original range
    quantizedSignal = quantizedSignal * maxVal;
end