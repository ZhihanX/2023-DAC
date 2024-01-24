% figure for uniform
data = load('BER_5dBsnr_uni1bit.mat');
error_value5snr_11 = data.error(end-1);
% Load the .mat file
data = load('BER_5dBsnr_uni2bit.mat');

null = 0;
% Extract the last value of the 'error' array
error_value5snr_21 = data.error(end-1);

data = load('BER_5dBsnr_uni3bit.mat');
error_value5snr_31 = data.error(end-1);

data = load('BER_5dBsnr_uni4bit.mat');
error_value5snr_41 = data.error(end-1);

data = load('BER_5dBsnr_uni5bit.mat');
error_value5snr_51 = data.error(end-1);

data = load('BER_5dBsnr_uni6bit.mat');
error_value5snr_61 = data.error(end-1);

data = load('BER_5dBsnr_uni7bit.mat');
error_value5snr_71 = data.error(end-1);


% Store the last value in an array

% Create an array with all the error values
error_values1 = [error_value5snr_11, error_value5snr_21, error_value5snr_31, error_value5snr_41, error_value5snr_51, error_value5snr_61, error_value5snr_71];

% Plot the error values
plot(error_values1, '-o', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'yellow');
hold on;

% figure for A-law
data = load('BER_5dBsnr_alaw1bit.mat');
error_value5snr_12 = data.error(end-1);
% Load the .mat file
data = load('BER_5dBsnr_alaw2bit.mat');

null = 0;
% Extract the last value of the 'error' array
error_value5snr_22 = data.error(end-1);

data = load('BER_5dBsnr_alaw3bit.mat');
error_value5snr_32 = data.error(end-1);

data = load('BER_5dBsnr_alaw4bit.mat');
error_value5snr_42 = data.error(end-1);

data = load('BER_5dBsnr_alaw5bit.mat');
error_value5snr_52 = data.error(end-1);

data = load('BER_5dBsnr_alaw6bit.mat');
error_value5snr_62 = data.error(end-1);

data = load('BER_5dBsnr_alaw7bit.mat');
error_value5snr_72 = data.error(end-1);


% Store the last value in an array

% Create an array with all the error values
error_values2 = [error_value5snr_12, error_value5snr_22, error_value5snr_32, error_value5snr_42, error_value5snr_52, error_value5snr_62, error_value5snr_72];
% Plot the error values
plot(error_values2, '->', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerEdgeColor', 'black', 'MarkerFaceColor', 'blue');


% figure for mu-law
data = load('BER_5dBsnr_mulaw1bit.mat');
error_value5snr_13 = data.error(end-1);
% Load the .mat file
data = load('BER_5dBsnr_mulaw2bit.mat');

null = 0;
% Extract the last value of the 'error' array
error_value5snr_23 = data.error(end-1);

data = load('BER_5dBsnr_mulaw3bit.mat');
error_value5snr_33 = data.error(end-1);

data = load('BER_5dBsnr_mulaw4bit.mat');
error_value5snr_43 = data.error(end-1);

data = load('BER_5dBsnr_mulaw5bit.mat');
error_value5snr_53 = data.error(end-1);

data = load('BER_5dBsnr_mulaw6bit.mat');
error_value5snr_63 = data.error(end-1);

data = load('BER_5dBsnr_mulaw7bit.mat');
error_value5snr_73 = data.error(end-1);


% Store the last value in an array

% Create an array with all the error values
error_values3 = [error_value5snr_13, error_value5snr_23, error_value5snr_33, error_value5snr_43, error_value5snr_53, error_value5snr_63, error_value5snr_73];

% Plot the error values
plot(error_values3, '->', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', [1, 0.5, 0]);
title('Bit Error Probability for Different Bits DAC');
xlim([1 7]);
xlabel('Different Bits DAC');
ylabel('Bit Error Probability in SNR = 5dB');
grid on; % Adding grid

legend('uniform DAC','A-LAW non-uniform DAC','mu-LAW non-uniform DAC');

% Adjust the figure properties for better visibility
set(gcf, 'Color', 'white'); % Set background color
set(gca, 'FontSize', 12); % Set font size
