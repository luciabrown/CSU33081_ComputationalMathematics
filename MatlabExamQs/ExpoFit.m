function [b, m] = ExpoFit(x,y)
% ExpoFit = Computes the best fit of an exponential function
% Inputs:
% x,y = vectors with the coordinates of the data points
% Outputs:
% b m = values of the coefficients

    % y = be^mx
    if(length(x) ~= length(y))
        error('Each x value must have an equivalent y value');
    end

    ln_y = log(y);

    n = length(x);
    Sx = sum(x);
    Sxx = sum(x.^2);

    Sy = sum(ln_y);
    Sxy = sum(x.*ln_y);

    m = ((n*Sxy) - (Sx*Sy)) / ((n*Sxx)-(Sx^2));
    ln_b = ((Sxx*Sy)-(Sxy*Sx)) / ((n*Sxx)-(Sx^2));

    b = exp(ln_b);

    disp(['b = ', num2str(b)]);
    disp(['m = ', num2str(m)]);
end