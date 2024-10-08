% Newton Raphson

f = @(x) x.^6 - x.^2 - 1;
f_prime = @(x) 6*x.^5 - 2*x;
error = 0.001;
xi = 1.5;  % Initial guess

while true
    x_new = xi - f(xi) / f_prime(xi);  % Compute the new x value
    
    if abs(x_new - xi) < error  % Check if the change is smaller than the error tolerance
        break;  % Stop if converged
    end
    
    xi = x_new;  % Update xi to the new value
end

% Display final result
fprintf('Root found: x = %.6f\n', xi);
