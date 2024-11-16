function Xs = SquareRoot(p)
% SquareRoot: Computes the square root of a positive number by the Newton-Raphson method
% Input:
% p: the number whose square root is to be determined
% Output:
% Xs: the square root of positive

    % Initialise variables
    maxIter=20;
    Xs=p;
    tol=1e-5;

    for k=1:maxIter
        f_x = Xs^2 - p;
        f_prime_x = 2*Xs;

        x_new = Xs - (f_x / f_prime_x);

        % Check for convergence
        if abs(x_new - Xs) < tol
            break;
        end

        Xs = x_new;
end