function y = func_uni(x, w)
    % Check input parameters
    if nargin ~= 2
        error('Two input parameters are required: signal and resolution');
    end
    if w <= 0 || floor(w) ~= w
        error('Resolution must be a positive integer');
    end

    % Normalized input signal
    Vmax = max(abs(x));
    if Vmax == 0
        Vmax = 1; % Avoid devided by zero
    end
    x_normalized = x / Vmax;

    % Calculation of the quantization level
    levels = 2^w;
    stepSize = 2 / levels;

    % Quantization
    y = stepSize * round(x_normalized / stepSize);

    % Scaling back to original amplitude
    y = y * Vmax;
end

