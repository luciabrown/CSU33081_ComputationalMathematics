function N = EuclideanNorm(A)
    %EuclideanNorm: Computes the Euclidean norm of the matrix A
    % Inputs:
    % A: a matrix
    % Outputs:
    % N: the Euclidean norm of A

    sumA = sum(sum(A.^2));
    N = sqrt(sumA);
    disp(N);
end