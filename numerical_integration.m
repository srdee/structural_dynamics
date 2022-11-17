
f = @(t) t^(-1)

%fplot(f,[1 5],"b")

x = [400,300, 200,150, 100, 60, 20, 10, 6,5,4,3, 2];
x = 4./x;
integr = @(dt) numInt(dt);
y= arrayfun(integr,x);

figure
set (gca, 'xdir', 'reverse' )
hold on
plot(x,y,'*-');
ylim([0, 3])
xlim([-.01,2.1])
hold off
title('Problem 1: Numberical Integration for various dt for f(t) = t^{-1} ')
subtitle('Stella Dee, 10/10/22')
xlabel('dt');
ylabel('Left-hand integration result for dt');