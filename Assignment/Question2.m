% Gauss Jordan with Pivoting

function x = GaussJordan(a,b)
    
    % Check if the input matrix is square
    [n,m] = size(a);
    if n~=m
        error('Matrix must be square');
    end

    ab=[a,b];                 % Augmented matrix with solution vector
    [R,C] = size(ab);         % Rows & cols of augmented matrix

    for j=1:R  % Loop through each pivot element

        % Pivoting section starts
        if ab(j,j) == 0                 % If the pivot element is zero
            for k = j + 1:R             % Iterate over the matrix
                if ab(k,j) ~= 0         % If another element is not zero    
                    abTemp = ab(j,:);   % Temp = pivot row
                    ab(j,:) = ab(k,:);  % Pivot row = other row
                    ab(k,:) = abTemp;   % Other row = pivot row
                    break
                end
            end
        end
        % Pivoting section ends

        % Normalise the pivot row / make pivot element 1
        ab(j,:) = ab(j,:) / ab(j,j);  % Divide current row by pivot row

        % Eliminate other rows
        for i = 1:R
            if i ~= j
                ab(i,:) = ab(i,:) - ab(i,j) * ab(j,:);  % Eliminate other rows
            end
        end
    end

    % Extract solution
    x = ab(:,end);
end
