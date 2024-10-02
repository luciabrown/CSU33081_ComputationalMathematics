% Determining the square root of a number p is the same as finding the root of the equation f(x) = x^2 - p = 0.

% Write a MATLAB user defined function that determines the square root of a positive number by solving this equation using the NewtonRaphson Method.
% Name the function Xs = SquareRoot(p).
% The output argument Xs is the answer and p is the number whose square root is to be determined.
% The starting value for x should be x = p
% and the iterations should stop when the estimated relative error is less than 0.00001. 
% The maximum number of iterations should be 20.
% After 5 iterations the program calculates the square root of 729 to be (rounded to two decimal places):

function Xs = SquareRoot(p)                                                 % Name the function Xs = SquareRoot(p).
    if p <= 0
        error('Input must be a positive number');                          % Check if the input is a positive number
    end

    % Init variables
    x = p;                                                                  % The starting value for x should be x = p
    max_iterations = 20;                                                    % The maximum number of iterations should be 20.
    tolerance = 0.00001;                                                    % and the iterations should stop when the estimated relative error is less than 0.00001.
    
    % Newton-Raphson iteration
    for iteration = 1:max_iterations                                        % Loop from 1 to 20
        % Calculate the function value and its derivative
        f_x = x^2 - p;                                                      % f(x) = x^2 - p
        f_prime_x = 2 * x;                                                  % f'(x) = 2x

        x_new = x - (f_x / f_prime_x);                                      % xi+1 = xi - f(xi)/f'(xi)
        relative_error = abs((x_new - x) / x_new);                        % error = |(xi+1 - xi) / xi+1|

        x = x_new;                                                          % Update x to the new estimate

        if relative_error < tolerance                                        % If the error < 0.00001
            break;                                                          % Stop calculations
        end
    end

    Xs = x;                                                                 % Return answer
end
