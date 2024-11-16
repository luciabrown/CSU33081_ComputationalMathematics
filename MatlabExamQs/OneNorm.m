function N = OneNorm(A)
    %OneNorm: Computes the one norm of the matrix A
    % Inputs:
    % A: a matrix
    % Outputs:
    % N: the onenorm of A

    % Calculate the sum of absolute values for each column
    column_sums = sum(abs(A), 1);  % sum across rows (i.e., sum of each column)

    % Find the maximum column sum (this is the one norm)
    N = max(column_sums);
    disp(N);
end