function N = ConditionNumber(A)
    %ConditionNumber: Computes the ConditionNumber of the matrix A, using
    % its OneNorm
    % Inputs:
    % A: a matrix
    % Outputs:
    % N: the ConditionNumber of A

    column_sums = sum(abs(A), 1);  % sum across rows (i.e., sum of each column)
    OneNorm = max(column_sums);

    a_inv = inv(A);
    column_inv_sums = sum(abs(a_inv), 1);
    OneNorm_inv = max(column_inv_sums);

    N = abs(OneNorm) * abs(OneNorm_inv);
    disp(N);
end