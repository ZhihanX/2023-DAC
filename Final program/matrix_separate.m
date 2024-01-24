function[final_matrix]= matrix_separate(R_signals_new,Nuser,MTKL)
[rows, columns] = size(R_signals_new);

% Initialize the cell array used to store the small matrix
small_matrices = cell(1, rows/(Nuser*MTKL));


% Decompose original_matrix into 36 small matrices with 20 rows and 2 columns
for i = 1:rows/(Nuser*MTKL)
    i
    start_row = (i - 1) * (Nuser*MTKL) + 1;
    end_row = i * (Nuser*MTKL);
    small_matrices{i} = R_signals_new(start_row:end_row, :);
end

% Concatenate these little matrices horizontally
final_matrix = horzcat(small_matrices{:});