clc;
clear;
close all;

%% 加噪前

[info,fs]=audioread('G:\MATLAB2021a\wyn\ceshi.wav'); 
disp('按任何按键播放加噪前声音')
pause;
sound(info,fs);
n=length(info);
y_f=fft(info,n);
f=fs*(0:n/2-1)/n;
disp('按任何按键显示图形');
pause;
subplot 211;plot(info,'red');xlabel('时间s');ylabel('幅值 ');title('加噪前的时域波形');
subplot 212;plot(f,abs(y_f(1:n/2)));xlabel('频率Hz');ylabel('频率幅值');title('加噪前的频谱图');

%% 加噪后

L=length(info);
noise=0.1*randn(L,1);
info_noise=info+noise;
disp('按任何按键播放加噪后声音')
pause;
sound(info_noise,fs);
n=length(info);
y_zf=fft(info_noise,n);
f=(0:n/2-1)/n;
disp('按任何按键显示图形');
pause;
subplot 211;plot(info_noise);xlabel('时间s');ylabel('幅值');title('加噪后的时域波形');
subplot 212;plot(f,abs(y_zf(1:n/2)));xlabel('频率Hz');ylabel('频率幅值');title('加噪后的频谱图');

%% 滤波之后

info=info-mean(info);                                % 消除直流分量
info=info/max(abs(info));                        % 幅值归一
N=length(info);                                % 语音长度
time=(0:N-1)/fs;                        % 设置时间刻度
itr=length(info);
M=50;                                       % 设置Ｍ和mu
mu=0.000001;
[y,W,e]=LMS(info_noise,info,M,mu,itr);
output=e/max(abs(e));                 	% LMS滤波输出
disp('按任何按键播放加噪前声音')
pause;
sound(output,fs);
% 作图
subplot 311; plot(time,info,'r'); ylabel('幅值') 
ylim([-1 1 ]); title('原始语音信号');
subplot 312; plot(time,info_noise,'g'); ylabel('幅值') 
ylim([-1 1 ]); title('带噪语音信号');
subplot 313; plot(time,output,'b'); 
ylim([-1 1 ]); title('LMS滤波输出语音信号');
xlabel('时间/s'); ylabel('幅值');