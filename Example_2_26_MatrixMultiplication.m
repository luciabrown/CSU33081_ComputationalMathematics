% Write a user-defined MATLAB function that carries out multiplication of two matrices [c] = [a][b]


% FUNCTION C THAT TAKES IN TWO ARGUMENTS A AND B 
% FUNCTION NAME MUST HAVE THE SAME NAME AS THE FILENAME

function C = Example_2_26_MatrixMultiplication(A, B)

    % Check if the number of columns of A matches the number of rows of B

    % SIZE IS A BUILT-IN FUNCTION

    [rowsA, colsA] = size(A);
    [rowsB, colsB] = size(B);
    
    if colsA ~= rowsB
        C = 'The matrices cannot be multiplied since the number of columns in A is not equal to the number of rows in B';
        return;
    end
    
    % Initialize result matrix C with zeros
    C = zeros(rowsA, colsB);
    
    % Perform the matrix multiplication
    for i = 1:rowsA
        for j = 1:colsB
            for k = 1:colsA
                C(i,j) = C(i,j) + A(i,k) * B(k,j);
            end
        end
    end
end
