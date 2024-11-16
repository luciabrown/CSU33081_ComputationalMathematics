%Approximation of a function with Taylor series expansion.

x = linspace(0,pi,40);
y = sin(x);
y2 = x;
y4 = x - x.^3/factorial(3);
y6 = x - x.^5/factorial(5);


plot(x,y,'r' ,x,y2, 'k--' ,x,y4,'k-.' ,x,y6, 'r--')
%'r' = red line
%'k--' = black dashes
%'k-.' = black dash-dots
%'r--' = red dashes
axis([0,4,-2,2])
legend('Exact' ,'Two terms' ,'Four terms' ,'Six terms')
xlabel ( 'x' ) ; ylabel ( 'y' )