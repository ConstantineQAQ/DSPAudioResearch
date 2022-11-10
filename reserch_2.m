clc;
clear;
close all;

Fs = input('请输入采样频率:');
recordt=input('请输入录制时间:');
disp('按任意键开始录音');
pause;
recorderObj = audiorecorder(Fs,16,1);
recordblocking(recorderObj, recordt);
info = getaudiodata(recorderObj);
N=length(info);
disp('录音结束.');
filename = 'G:\MATLAB2021a\wyn\ceshi.wav';
audiowrite(filename,info,Fs);
fft_infor = abs(fft(info));
fft_infor = fft_infor./max(fft_infor);
T=1/Fs;
t=(0:N-1)*T;
df=Fs/N;
f=(0:N-1)*df;

disp('按任意键播放音乐.');
pause;
player0 = audioplayer(info, Fs);
play(player0);
pause(recordt);
disp('结束.')

disp('按任意键显示画面');
pause;
figure;
subplot(1, 2, 1);plot(t,info);title('声音时域信息');xlabel('t');ylabel('audio_infor');
subplot(1, 2, 2);plot(f,fft_infor,'blue');title('声音的频域信息');xlabel('w/pi');ylabel('fft_audio_infor');