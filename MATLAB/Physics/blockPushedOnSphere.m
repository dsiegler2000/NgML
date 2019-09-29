g = 10;
r = 1; % radius
u = 1; % mu
q = 0; % theta
q1 = 2.275; % theta dot, 2.275 is the cutoff, anything lower and q1 = 0 (it stays on)
e = 0.0001; % a small timestep

while(g * cos(q) > r * q1 ^ 2 && q1 > 0)

    q2 = (g / r) * sin(q) - u * ((g / r) * cos(q) - q1 ^ 2);
    q = q + e * q1;
    q1 = q1 + e * q2;
    
end

disp(q);
disp(q1);
