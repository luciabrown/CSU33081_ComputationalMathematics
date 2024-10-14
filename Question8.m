% Gauss Jordan Inversion of a Matrix

a = [0 -3 -2; 1 -4 -2; -3 4 1;];    % Question matrix
b = [1 0 0; 0 1 0; 0 0 1;];         % Diagonal identity matrix
    
ab=[a,b];                 % Augmented matrix with solution vector
[R,C] = size(ab);         % Rows & cols of augmented matrix

% GaussJordan Elimination

for i=1:R  % Loop through each pivot element

    % Pivoting section starts
    if ab(i,i) == 0                 % If the pivot element is zero
        for k = i + 1:R             % Iterate over the matrix
            if ab(k,i) ~= 0         % If another element is not zero    
                abTemp = ab(i,:);   % Temp = pivot row
                ab(i,:) = ab(k,:);  % Pivot row = other row
                ab(k,:) = abTemp;   % Other row = pivot row
                break
            end
        end
    end

    ab(i, :) = ab(i, :) / ab(i, i);      % Divide the pivot row by its pivot element
    
    for j = 1:R                          % Iterate over the other rows
        if j ~= i                        % If not the pivot row
            ab(j, :) = ab(j, :) - ab(j, i) * ab(i, :);  % Eliminate other rows
        end
    end
end

inversion = ab(:, R+1:end);   % Take the 2nd half of the matrix

disp(inversion);