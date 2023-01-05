clear;

SNR=0:20;
for i=1:length(SNR)
    snr=SNR(i)
    sim('frequency_syn');
    a(i)=mean(fre.^2);
end
plot(SNR,a);
hold on
grid on
xlabel('SNR£¨dB£©');
ylabel('ÆµÂÊÍ¬²½Îó²î£¨rad£©');