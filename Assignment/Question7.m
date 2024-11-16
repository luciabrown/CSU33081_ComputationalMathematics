function [x, y, iter] = NewtonsMethodNonLinear()

    % Define the system of equations
    f1 = @(x, y)  x^2 + x*y - 10;
    f2 = @(x, y) y + 3*x*y^2 - 57;

    x0 = 1.5;
    y0 = 3.5;
    tol = 0.0001;
    max_iter = 3;
    
    % Numerical differentiation step (small perturbation)
    h = 1e-6;

    % Function to calculate Jacobian dynamically
    function J = calcJacobian(x, y)
        % Partial derivatives for f1 and f2
        df1_dx = (f1(x + h, y) - f1(x, y)) / h;
        df1_dy = (f1(x, y + h) - f1(x, y)) / h;
        df2_dx = (f2(x + h, y) - f2(x, y)) / h;
        df2_dy = (f2(x, y + h) - f2(x, y)) / h;
        
        % Jacobian matrix
        J = [df1_dx, df1_dy; df2_dx, df2_dy];
    end
    
    % Initialize variables
    x = x0;
    y = y0;
    iter = 0;
    
    while iter < max_iter
        % Evaluate the functions at the current values
        F = [f1(x, y); f2(x, y)];
        
        % Calculate the Jacobian matrix dynamically
        Jacobian = calcJacobian(x, y);
        
        % Newton's update step
        delta = -Jacobian \ F; % Solve for deltaX and deltaY (faster than inv(J)*F)
        
        % Print the results of Jacobian, deltaX, and deltaY at each iteration
        fprintf('Iteration %d:\n', iter + 1);
        fprintf('Jacobian matrix:\n');
        disp(Jacobian);
        fprintf('deltaX = %.6f, deltaY = %.6f\n\n', delta(1), delta(2));
        
        % Update x and y
        x = x + delta(1);
        y = y + delta(2);
        
        % Check convergence
        if norm(delta, 2) < tol
            break;
        end
        
        iter = iter + 1;
    end
    
    if iter == max_iter
        warning('Maximum number of iterations reached without convergence.');
    end
end