%Enter mass and stiffness
m=10;
k = 75;

%Compute natural frequency in rad/s
wn = sqrt(k/m);

%Compute natural frequency in Hz
hn = wn/(2 * pi);

%Enter conditions for problem 1b
p0 = 15;
w = wn;
pt = @(t) p0 * sin(w * t);
wd = @(z) w * sqrt(1-z^2);
tb = (2 * pi())/ w;

z1 = 0;
z2 =.05;
z3 = .2;

ust = -p0/ (2 *k );

%For the undamped case z1=O:
uu = @(t) ust * (wn * t * cos(wn * t) - sin(wn * t));

%For the damped case z2=.05 and z3 =.2:
l1 = @(z) (p0/k) /(2 * z);
l2 = @(z,t) exp(-(z * wn * t));
l3 = @(z,t) cos(wd(z) * t) + (z * sin(wd(z) * t))/(sqrt(1 - z^2));
l4 = @(t) cos(wn * t);

%Enter equation for resonant case with damping
ud = @(z,t) l1(z) .* (l2(z,t) .* l3(z,t) - l4(t));

%Create different functions for each damping ratio
uz1 =@(t) uu(t);
uz2 = @(t) ud(z2, t);
uz3 = @(t) ud(z3, t);

%Part C
ust0 = p0/k;

%Part B2

u5 = @(z) (ust0 / (2 * z)) * (1- exp(-10 * pi() *z));

ssda = @(z4) ust0/(2 * z4);

%Make the plots
%Make tiles so both plots can be together
tiledlayout(1,2)
nexttile 
%Plot 1b equations
f1= fplot(uz1,[0 15],":g", LineWidth=2);
hold on
f2 = fplot(uz2,[0 15],"--r", LineWidth=2);
hold on
f3 = fplot(uz3,[0 15],"-b", LineWidth=2);
hold off
grid on
title('Problem 1b: Resonant Case of Damped SDOF System')
subtitle('Stella Dee, 9/25/22')
xlabel('Time (s)');
ylabel('Displacement (m)');
%Call next tile and plot 1c equation
nexttile
fplot(ssda,[0 .5],"-k", LineWidth=2)
grid on
title('Problem 1c: Steady State Displacement Amplitude as a Function of Damping Ratio')
subtitle('Stella Dee, 9/25/22')
xlabel('Damping Ratio');
ylabel('Steady State Displacement Amplitude');
