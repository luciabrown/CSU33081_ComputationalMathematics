function x = Gauss(a,b)
% This function solves a system of linear equations using the Gaussian elimination method
% Input Variables:
% a The matrix of coefficients
% b Right hand side column vector of constants
% Output Variable:
% x A column vector with the solution 

% Append the column vector to the matrix A
ab = [a,b];
[R,C] = size(ab);

% Forward Elimination: convert the matrix into an upper triangular form
for j = 1:R-1                                                        % Iterate over columns, up to the second-to-last column
    for i = j+1:R                                                    % Iterate over the rows below the pivot element
        multiplier = ab(i,j)/ab(j,j);                                % Calculate the multiplier for the current row                            
        %pivotElement = ab(j,j);
        pivotEquation = ab(j,j:C);                                   % Extract the pivot row
        ab(i,j:C) = ab(i,j:C) - multiplier*pivotEquation;            % Update the current row
    end
end

% Back Substitution: solve for the unknowns starting from the last row
x = zeros(R,1);                                                          % Initialize the solution vector 'x' with zeros
x(R) = ab(R,C)/ab(R,R);                                                  % Solve for the last variable

% Iterate backwards to solve for the remaining variables
for i = R-1:-1:1                                                         % Calculate each unknown by solving the corresponding equation
    x(i) = (ab(i,C) - ab(i,i+1:R)*x(i+1:R))/ab(i,i);
end
end
