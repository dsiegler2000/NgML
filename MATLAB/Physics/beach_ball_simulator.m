% Not sure if you want a closed form solution calculator (don't have
% right now), but that's boring so I made a simulation for chapter 2
% problem 10:
% A beach-ball is thrown upward with initial speed v0. Assume that the drag 
% force is F = ?m?v. What is the speed of the ball, vf , when it hits the 
% ground? (An implicit equation is sufficient.) Does the ball spend more  
% time or less time in the air than it would if it were thrown in vacuum?

time = 0.0; % Time in seconds
deltatime = 0.00000001; % Take steps of 10 millis for now
v0 = 5; % The ball starts going up at 5m/s
v = v0 % The current velocity of the ball
vacuumV = v0 % The current velocity of the vacuum ball
m = 0.1 % The ball weighs .1 kg
y = 0 % The ball starts on the ground
vacuumY = 0 % Position for the ball in the vacuum
g = 9.8 % Gravity
alpha = 0.1 % I'm not sure what a good value of this would be, but to compare
% with the closed form, I kept it relatively small, but to prove the vacuum
% time is bigger you have to make it a bit larger (i.e. 0.1 and 1)

vacuumEndTime = -1
regularEndTime = -1

while(y >= 0 || vacuumY >= 0)

    % Down is negative, so Fg will always be negative
    Fg = -m * g;
    
    % When v > 0 (the ball is going up), Fd will be pointing down and when
    % v < 0 (the ball is going down), Fd will be pointing up
    Fd = -m * alpha * v;
    Fnet = Fg + Fd;
    
    % F = ma => a = F / m
    a = Fnet / m;
    
    vacuumA = Fg / m; % No air resistance in gravity
    
    % Since we are doing a simulation, update the position, velocity, and
    % time of the vacuum and regular ball
    time = time + deltatime;
    
    if y >= 0
        y = y + v * deltatime;
        v = v + a * deltatime;
    elseif regularEndTime < 0 && y < 0
        regularEndTime = time; % Record how long it took the regular ball
    end
        
    if vacuumY >= 0
        vacuumY = vacuumY + vacuumV * deltatime;
        vacuumV = vacuumV + vacuumA * deltatime;
    elseif vacuumEndTime < 0 && vacuumY < 0
        vacuumEndTime = time; % Record how long it took the vacuum ball
    end 
    
end

% Account for the loop breaking early
if vacuumEndTime < 0
    vacuumEndTime = time
end

if regularEndTime < 0
    regularEndTime = time
end

disp("Simulated total time: " + time + " seconds");
disp("Simulated velocity when the ball hits the ground: " + v + "m/s");

% Do closed form calculations to check the simulation
% This formula is also an approximation and works better with smaller
% alphas
vf = v0 - ((2 * alpha) / (3 * g)) * v0 * v0;

disp("Closed form vf: " + -vf + "m/s");
% The vast majority of the error comes from the closed form approximation
disp("Error (assuming the closed form is perfect) " + 100 * (abs(abs(v) - abs(vf)) / abs(vf)) + "%");

disp("The regular ball took " + regularEndTime + " seconds");
disp("The vacuum ball took " + vacuumEndTime + " seconds");
% I don't feel like making a terinary because I know what is going to
% happen
