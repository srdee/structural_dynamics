
z = .025;
m = 12000;
wn = 8;
wd = wn * sqrt(1-z^2);
k = wn^2 * m ;

fm = @(personmass) personmass * ((2.7 + 3.7)/2);

p0 = fm(91) ;

w = @(Tn) 2* pi /Tn;

rat =@(Tn) w(Tn)/wn;

Rd =@(Tn) 1/sqrt((1-rat(Tn)^2)^2 + (2*z *rat(Tn)^2))

u0= @(Tn) (p0/k)*Rd(Tn)/(2*z)

Tn =[.01:.025:2]

displacements = arrayfun(u0,Tn)

plot(Tn,displacements, "-k");
grid on
title('Problem 2c: Steady-state displacement calculated as Rd*ust0 for different footfall intervals')
subtitle('Stella Dee, 10/23/22')
xlabel('Footfall period Tn(s)');
ylabel('Maximum steady=state displacement (m)');