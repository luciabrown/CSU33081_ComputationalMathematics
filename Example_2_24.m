% Write a MATLAB program in a script file that evaluates the derivative of the function f(x) = x3cosx
% at the point x = 3 by using central difference approximation. The value of the derivative is calculated sixteen times by using
% a = 3 and sixteen values of x, x = 2.6, 2.65, .. ., 2.95, 3.05, .. ., 3.35, 3.4. The program should also plot the
% values of the derivative versus x.

% Define the function
f = @(x) x.^3 * cos(x);

% Define the value at which we evaluate the derivative
a = 3;

% Define the range of values around x = 3
x_values = [2.6:0.05:2.95, 3.05:0.05:3.4];


% Allocate array for derivative values
derivative_values = zeros(size(x_values));

% Define step size for central derivative approximation
h = 1e-5;

% Loop through the x values and compute the derivative using central difference
for i = 1:length(x_values)
    x = x_values(i);
    % Central difference formula to approximate derivative
    derivative_values(i) = (f(x + h) - f(x - h)) / (2 * h);
end

% Plot the derivative values versus x
figure;
plot(x_values, derivative_values, '-o', 'LineWidth', 2);
xlabel('x');
ylabel('Numerical Derivative of f(x)');
title('Derivative of f(x) = x^3 * cos(x) vs. x');
grid on;

% Display the values
disp('x values:');
disp(x_values);
disp('Derivative values:');
disp(derivative_values);