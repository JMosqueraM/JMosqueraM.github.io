%% Modulador AM, FM y PM-------------------------------------------------------
clear all, close all,  clc, format compact
%Input---------------------------------------------------------------------
%Data In
Ax = 2;
fx = 3400;
cpx = 2;

%Carrier
Ac = 10;
fc = 1000e3;
cpc = 13;
phi_c = 0;

%Modulation Index
m = 0.6;               % 0<= m <=1
nfm = 2;               % nfm >= 2
npm = 2;               % npm >= 2

%Process-------------------------------------------------------------------
%xt
Tx = 1/fx;
tx = linspace(0, cpx*Tx, 1000);
xt = Ax*sin(2*pi*fx*tx);

%Carrier
Tc = 1/fc;
tc = linspace(0, cpc*Tc, 1000);
xc = Ac*sin(2*pi*fc*tc+phi_c);

%AM Modulation
xam = (1+m*xt).*xc;

%FM Modulation
xfm = Ac*sin(2*pi*fc*tc+nfm*xt);

%PM Modulation
Dxt = Ax*cos(2*pi*fx*tx);
xpm = Ac*sin(2*pi*fc*tc+npm*Dxt);
%Output--------------------------------------------------------------------
figure(1)
subplot(5,1,1), plot(tc, xc), title('Analog Data - Carrier')
subplot(5,1,2), plot(tx, xt), title('Analog Data - Voice')
subplot(5,1,3), plot(tc, xam), title('Signal - AM')
subplot(5,1,4), plot(tc, xfm), title('Signal - FM')
subplot(5,1,5), plot(tc, xpm), title('Signal - PM')