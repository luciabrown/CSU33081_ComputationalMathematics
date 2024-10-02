% Use the Secant Method to find a root of the function
% f(x) = 16x^5 - 73x^2 - 133
% accurrate to an error of e = xn - xn-1 = 0.001 where xn is the value of x at the nth iteration
% Use starting points x0=3 and x1 = 2.5

%Init variables
x0 =3;
x1 = 2.5;
f = @(x) 16*x.^5 - 73*x.^2 - 133;
error = 0.001;
i = 0;

while abs(x1-x0)>error
    f_x0 = f(x0);
    f_x1 = f(x1);

    x_temp = (x1 - ((f_x1 * (x0-x1))/(f_x0 - f_x1)));

    x0=x1;
    x1=x_temp;

    i=i+1;
    % Display the current approximation and error
    fprintf('Iteration %d: x = %.6f, Error = %.6f\n', i, x1, abs(x1 - x0));

end
% Display final result
fprintf('Root found: x = %.6f\n', x1);
