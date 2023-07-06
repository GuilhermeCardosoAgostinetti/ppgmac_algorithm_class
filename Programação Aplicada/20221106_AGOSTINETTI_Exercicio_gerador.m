% euler1 Programa para o calculo da E.D.O. 
%  y' = y-t^2+1,  y(x0) = y0  onde x0 =0 e  yo = 0.2  [0,2]
% Metodo de Euler,EuLer Modificado, Runge-Kutta de 3a ordem e Runge-Kutta
% de 4a ordem

clear,clc;
a = 1;
b = 11;
h = 0.001;
n = (b - a)/h;
x0 = 1;
y0 =1.13976;

y3(1) = y0;        
x(1) = x0;
f = @(x)(-0.05*x^3-0.055*x^2-0.95*x+1)/(x^2*(0.05*x+1)^2*(-0.05*x+1));

for i = 1:n
x(i+1) = x(i) + h;
k13(i) = h*f(x(i));
k23(i) = h*f(x(i)+h/2);
k33(i) = h*f(x(i)+3*h/4);
y3(i+1) = y3(i) + (2/9)* k13(i) + 1/3*k23(i) + (4/9) * k33(i);
end

figure (1)
plot(x, y3, 'b-.')
hold on
xlabel('R'); 
ylabel('y = y(x)');
legend('Runge-Kutta 3');
title ('h = 0.001')


