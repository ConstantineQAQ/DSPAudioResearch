clc;
clear;
close all;

filename='G:\MATLAB2021a\wyn\jiuwangleba.wav';
[info,Fs]=audioread(filename);
disp(Fs);

N=length(info);
T=1/Fs;
t=(0:N-1)*T;

df=Fs/N;
f=(0:N/2)*df;

info_fft=fft(info);
info_fft=abs(info_fft/N);
info_fft1=info_fft(1:N/2+1);
info_fft1(2:end-1) = 2*info_fft1(2:end-1);


subplot(2,1,1);plot(t,info);title('对歌曲44100hz采样');ylabel('时域离散信号');xlabel('n');
subplot(2,1,2);plot(f,info_fft1,'blue');title('对歌曲44100hz采样的频域图');ylabel('频域域离散信号');xlabel('f');