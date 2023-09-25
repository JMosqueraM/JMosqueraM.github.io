clear all, close all,  clc, format compact
%Input---------------------------------------------------------------------
f = 3400;
A =5;
cp = 1;
num_cf = 4; %Cantidad Frecuencias

%Process-------------------------------------------------------------------
T = 1/f;
t = linspace(0, cp*T, 1000);
N_square = (4*A)/(pi); %Normalizacion
%v_f = (0:length(xt_cf4)-1)*T/length(xt_cf4);


cf1 = (A/1)*sin(2*pi*1*f*t);
cf2 = (A/3)*sin(2*pi*3*f*t);
cf3 = (A/5)*sin(2*pi*5*f*t);
cf4 = (A/7)*sin(2*pi*7*f*t);
 
xt_cf1 = cf1; 
xt_cf2 = cf1 + cf2;
xt_cf3 = cf1 + cf2 + cf3;
xt_cf4 = cf1 + cf2 + cf3 + cf4;

Xf_1cf = abs(fft(xt_cf1));
Xf_2cf = abs(fft(xt_cf2));
Xf_3cf = abs(fft(xt_cf3));
Xf_4cf = abs(fft(xt_cf4));

Xf_1cf_shift = abs(fftshift(fft(xt_cf1)));
Xf_2cf_shift = abs(fftshift(fft(xt_cf2)));
Xf_3cf_shift = abs(fftshift(fft(xt_cf3)));
Xf_4cf_shift = abs(fftshift(fft(xt_cf4)));

s_square = 0;
for n=1:2:(2*num_cf-1)
    s_square = s_square + (N_square/n)*sin(2*pi*n*f*t);
    s_square_tf = abs(fft(s_square));
end

%Output--------------------------------------------------------------------
figure(1)
%plot(t, xt_cf4)
subplot(2,2,1), plot(t,xt_cf1), title('Señal: cf1'), grid on
subplot(2,2,2), plot(t,xt_cf2), title('Señal: cf2'), grid on
subplot(2,2,3), plot(t,xt_cf3), title('Señal: cf3'), grid on
subplot(2,2,4), plot(t,xt_cf4), title('Señal: cf4'), grid on

figure(2)
%plot(t, xt_cf4)
subplot(2,2,1), plot(Xf_1cf(1:50))
subplot(2,2,2), plot(Xf_2cf(1:50))
subplot(2,2,3), plot(Xf_3cf(1:50))
subplot(2,2,4), plot(Xf_4cf(1:50))

figure(3)
%plot(t, xt_cf4)
subplot(2,2,1), plot(Xf_1cf_shift(450:550))
subplot(2,2,2), plot(Xf_2cf_shift(450:550))
subplot(2,2,3), plot(Xf_3cf_shift(450:550))
subplot(2,2,4), plot(Xf_4cf_shift(450:550))

figure(4)
subplot(2,1,1), plot(s_square)
subplot(2,1,2), plot(s_square_tf(1:50))
