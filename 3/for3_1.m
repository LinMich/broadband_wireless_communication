snr=zeros(1,30);
snr(1)=1e-3;
for i=1:29
    snr(i+1)=snr(i)*1.5;
end;    
Pb=zeros(1,length(snr));
for i=1:length(snr)
    Pb(i)=1/2*(1-sqrt(4*snr(i)/(1+4*snr(i))));
end;
snr1=zeros(1,30);
for i=1:30
    snr1(i)=20*log10(snr(i));
end;
plot(snr1,Pb);
xlabel('SNR(dB)');
ylabel('Pe');
title('理想误码率曲线');
grid on