clear all, close all,  clc, format compact
%Input---------------------------------------------------------------------
f = 3400;
A =5;
cp = 2;
num_cf = 4; %Cantidad Frecuencias
phi = 3*pi/2; % 0 (Sen)

%Process-------------------------------------------------------------------
T = 1/f;
t = linspace(0, cp*T, 1000);
N_square = (4*A)/(pi); %Normalizacion
N_sawtooth = (2*A)/(pi); %Normalizacion
N_Triangle = (8*A)/(pi^2); %Normalizacion

s_square = 0;
s_sawtooth = 0;
s_triangle = 0;
s_sinusoidal = 0;

%Sinusoidal
for n=1:num_cf
    s_sinusoidal_f = A*sin(2*pi*f*t + phi);
    s_sinusoidal = s_sinusoidal + s_sinusoidal_f;
end


%Square
for n=1:2:(2*num_cf-1)
    s_square_f = (N_square/n)*sin(2*pi*n*f*t);
    s_square = s_square + s_square_f;
end

%Sawtooth
for n=1:num_cf
    s_sawtooth_f = ((-1)^(n+1))*(N_sawtooth/n)*sin(2*pi*n*f*t);
    s_sawtooth = s_sawtooth + s_sawtooth_f;
end

%Triangle
for n=1:2:(2*num_cf-1)
    s_triangle_f = (N_Triangle/n^2)*cos(2*pi*n*f*t);
    s_triangle = s_triangle + s_triangle_f;
end

%Output--------------------------------------------------------------------
%One graphic
figure(1)
subplot(2,2,1), plot(t,s_sinusoidal), title('Sinusoidal Signal'), grid on
subplot(2,2,2), plot(t,s_square), title('Square Signal'), grid on
subplot(2,2,3), plot(t,s_sawtooth), title('Sawtooth Signal'), grid on
subplot(2,2,4), plot(t,s_triangle), title('Triangle Signal'), grid on


%Sinusoidal graphic
figure(2)
plot(t, s_sinusoidal), title('Sinusoidal Signal')

%Square graphic
figure(3)
plot(t, s_square), title('Square Signal'), grid on

%Sawtooth graphic
figure(4)
plot(t, s_sawtooth), title('Sawtooth Signal'), grid on

%Triangle graphic
figure(5)
plot(t, s_triangle), title('Triangle Signal'), grid on
%NOTE, ADD SINOSUIDAL GRAHP