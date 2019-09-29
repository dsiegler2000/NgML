%
% Euler calculation of motion of simple pendulum
% by Kevin Berwick,
% based on 'Computational Physics' book by N Giordano and H Nakanishi,
% section 3.1 %
%pendulum length in metres % acceleration due to gravity
% initializes omega, a vector of dimension npoints X 1,to being all zeros % initializes theta, a vector of dimension npoints X 1,to being all zeros
% this initializes the vector time to being all zeros
% you need to have some initial displacement, otherwise the pendulum will
clear;
length= 1;
g = 9.8;
npoints = 250; % Discretize time into 250 intervals
dt = 0.04;
omega = zeros(npoints, 1); 
theta = zeros(npoints, 1); 
time = zeros(npoints, 1); 
theta(1)=0.2;
for step = 1:npoints-1 % loop over the timesteps 
    omega(step+1) = omega(step) - (g / length) * theta(step) * dt; 
    theta(step+1) = theta(step) + omega(step)*dt;
    time(step+1) = time(step) + dt;
end
plot(time,theta,'r' ); % plots the numerical solution in red xlabel('time (seconds) ');
ylabel('theta (radians)');
