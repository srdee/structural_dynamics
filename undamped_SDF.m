%Enter given parameters for undamped SDOF oscillator where mass drops from
%2kg to 1kg at the 15 second mark 
m1 = 2
m2 = 1
k = .75
u0 = 0
dudt0 = .5

%Calculate the natural frequency of the system before and after the change
%in mass 
o1 = sqrt(k/m1)
o2 = sqrt(k/m2)

%Enter the governing equation for the system from 0-15 seconds
f1 = @(t) u0*cos(o1*t)+dudt0/o1*sin(o1*t)

%Enter the derivative for the governing equation 
dfdt1 = @(t) -o1*u0*sin(o1*t)+dudt0*cos(o1*t)

%Calculate the initial conditions for the system at t=15 by calculating the
%displacement and the velocity of the system at 5=15
u1 = f1(15)
dudt1 = dfdt1(15)

%Enter the governing equation for the system from 15-30 seconds, correct
%for the situation where t=15 but initial conditions have been recalculated
%as 0 by subtracting 15 from t
f2 = @(t) u1*cos(o2*(t-15))+dudt1/o2*sin(o2*(t-15))


%Plot the output from 0-30 seconds
fplot(f1,[0 15],"b")
hold on
fplot(f2,[15 30],"b")
hold off
grid on
title('Problem 1: Displacement of Undamped SDOF System')
subtitle('Stella Dee, 9/19/22')
xlabel('Time (s)');
ylabel('Displacement (m)');
