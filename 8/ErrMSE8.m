clear;
SNR0=[-5:5:50];
%����BER�������ŵ��ľ������ƽ��ֵ��
for n=1:length(SNR0)
  snr=SNR0(n);  
  sim('pro8.mdl');
  Err(n)=mean(Perr);
  Mse(n)=mean(MSE);
end

figure(1);
semilogy(SNR0,Err);
xlabel('SNR_dB');
ylabel('BER');
grid on;
figure(2);
semilogy(SNR0,Mse);
xlabel('SNR_dB');
ylabel('MSE');
grid on;