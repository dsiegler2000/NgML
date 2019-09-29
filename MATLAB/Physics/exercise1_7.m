r = 1;
rVel = 0;
theta = pi / 18;
angularVel = 0;
deltatime = 0.00001;
g = 9.8;
time = 0;

while(r < 2)
    
    rAcc = (r * angularVel * angularVel - g * (1 - cos(theta))) / 2;
    r = r + deltatime  * rVel;
    rVel = rVel + deltatime * rAcc;
    thetaAcc = -2 * rVel * angularVel / r - g * sin(theta) / r;
    theta = theta + deltatime * angularVel;
    angularVel = angularVel + deltatime * thetaAcc;
    
    time = time + deltatime;
    
end

disp("t = " + time)