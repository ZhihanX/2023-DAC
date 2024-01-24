function y = func_a_law(input_signal, bits)
    % A-law algorithm parameter A is set to 1.2
    A = 1.2;
    y = zeros(length(input_signal),1);

    % normalization
    Vmax = max(max(abs(input_signal)));
    input_signal    = input_signal / Vmax;

    % A-law function
    function compressed = a_law_compress(x, A)
        if abs(x) < 1 / A
            compressed = (A * abs(x)) / (1 + log(A));
        else
            compressed = (1 + log(A * abs(x))) / (1 + log(A));
        end
        compressed = sign(x) * compressed;
    end

    % Determine how to quantize based on the value of bits

    quantization_levels = 2^(bits) - 1;
    y = arrayfun(@(x) round(a_law_compress(x, A) * quantization_levels) / quantization_levels, input_signal);
 
    y = Vmax * y / max(max(abs(y)));
end
