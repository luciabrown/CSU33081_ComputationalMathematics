% Gauss Jordan with Pivoting

function x = GaussJordan(a,b)
    
    [n,m] = size(a);                    % If A's rows != A's columns
    if n~=m                             
        error('Matrix must be square'); % GaussJordan cannot work
    end

    ab=[a,b];                           % Augment A's matrix with B solution vector
    [R,C] = size(ab);                   % AB matrix's rows and columns

    for j=1:R-1                         % Iterate over the matrix

    % Pivoting section starts
        if ab(j,j) ==0                  % Check if pivot element is zero
            for k = j + 1:R             % Swap current row with a row containing non-zero element
                if ab(k,j) ~=0          % If another row's element !=0
                    abTemp = ab(j,:);   
                    ab(j,:) = ab(k,:);  % Pivot row = other row
                    ab(k,:) = abTemp;   % Other row = pivot row
                    break
                end
            end
        end
    % Pivoting section ends

        % Normalise the pivot row / make pivot element 1
        ab(j,:) = ab(j,:) - ab(j,j);                    % Divide entire row by pivot element

        % Eliminate other rows
        for i = 1:R                                 
            if i~= j                                    % For all rows except pivot row
                ab(i,:) = ab(i,:) - ab(i,j)*ab(j,:);    % Subtract pivot row from current row
            end    
        end
    end

% Extract solution
x = ab(:,end);
end

