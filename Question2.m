% Gauss Jordan with Pivoting

function x = GaussJordan(a,b)
    
    [n,m] = size(a);
    if n~=m
        error('Matrix must be square');
    end

    ab=[a,b];
    [R,C] = size(ab);

    for j=1:R-1

    % Pivoting section starts
        if ab(j,j) ==0
            for k = j + 1:R
                if ab(k,j) ~=0
                    abTemp = ab(j,:);
                    ab(j,:) = ab(k,:);
                    ab(k,:) = abTemp;
                    break
                end
            end
        end
    % Pivoting section ends

        % Normalise the pivot row / make pivot element 1
        ab(j,:) = ab(j,:) - ab(j,j);

        % Eliminate other rows
        for i = 1:R
            if i~= j
                ab(i,:) = ab(i,:) - ab(i,j)*ab(j,:);
            end
        end
    end

% Extract solution
x = ab(:,end);
end

