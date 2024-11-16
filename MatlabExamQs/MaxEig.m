function e = MaxEig(A)
% MaxEig: Computes the largest eigenvalue of a square matrix A using the power method.
% Input:
%   A - The input square matrix (n x n)
% Output:
%   e - The largest eigenvalue of the matrix A

    % Ensure A is a Square Matrix
    [n,m] = size(A);
    if n ~=m    
        error('Matrix A must be square');
    end
    
    tol = 1e-6; % Convergence tolerance
    vectorX = [1; 1; 1;];
    maxIter = 10;

    e_old = 0;
    for k=1:maxIter
        vectorX = A * vectorX;
        e=max(vectorX);
        vectorX = vectorX/norm(vectorX);
        
        % Check for convergence
        if abs(e - e_old) < tol
            break;
        end
        e_old = e;
end