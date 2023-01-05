clear;

SNR=0:20;
for i=1:length(SNR)
    snr=SNR(i)
    sim('time_syn');
    a(i)=sum(corr)/length(corr);
end
figure(1)
plot(SNR,a);
grid on
xlabel('SNR£¨dB£©');
ylabel('²¶»ñ¸ÅÂÊ');