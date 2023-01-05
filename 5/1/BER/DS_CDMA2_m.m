clear
x=-6:12;
for i=1:length(x)
    SNR=x(i);
    sim('DS_CDMA2');
    y1(i)=mean(BitErrorRate1(1));
    y2(i)=mean(BitErrorRate2(1));
end
semilogy(x,y1,x,y2,'-ro');
xlabel('Eb/No (dB)');ylabel('������');
title('������ϲ������Ⱥϲ�������������');
grid on;
legend('y1���Ⱥϲ�','y2������ϲ�',2)

