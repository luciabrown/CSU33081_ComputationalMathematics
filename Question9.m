% Jacobi Iteration

% [12 7 3; 1 5 1; 2 7 -11;]:
% [2; -5; 6 ;];

x1=1;
x2=3;
x3=5;

max_iter = 3;

while max_iter ~= 0
    x1_new = (2-((7*x2)+(3*x3)))/12;
    x2_new = (-5-(1*x1)+(1*x3))/5;
    x3_new = (6-((2*x1)+(7*x2)))/-11;

    max_iter = max_iter -1;

    x1=x1_new;
    x2=x2_new;
    x3=x3_new;
end

disp(x1);
disp(x2);
disp(x3);