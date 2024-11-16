function M = InfinityNorm(A)
    %InfinityNorm: Computes the Infinity norm of the matrix A
    % Inputs:
    % A: a matrix
    % Outputs:
    % N: the InfinityNorm of A

    % Calculate the sum of absolute values for each column
    row_sums = sum(abs(A),2);  % sum across rows (i.e., sum of each column)

    % Find the maximum column sum (this is the one norm)
    M = max(row_sums);
    disp(M);
end