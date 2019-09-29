x = 2;
x1 = 0;
e = 0.01;
for i = 0:300
    x2 = -5*x;
    x =x+e*x1;
    x1 =x1+e*x2;
end
disp(x);
