clear all

SNR=0:30;
for i=1:length(SNR)
    snr=SNR(i)
    sim('OFDM');
    Error(i)=ErrorVec(1);
    MSE(i)=mean(simout);
end
figure(1)
semilogy(SNR,Error);
xlabel('SNR(dB)');
ylabel('误码率');
grid on
figure(2)
plot(SNR,MSE);
xlabel('SNR(dB)');
ylabel('信道估计均方误差');
grid on