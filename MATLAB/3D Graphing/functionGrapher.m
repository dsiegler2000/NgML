disp(f(1, 2));

x = linspace(-2 * pi,2 * pi);
y = linspace(0, 4 * pi);
[X,Y] = meshgrid(x, y);
Z = X^2 + Y^2;

figure;
surf(X, Y, Z);