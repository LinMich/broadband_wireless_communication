clear
x=-6:10;
for i=1:length(x)
    SNR=x(i);
    sim('DS_CDMA1');
    y1(i)=mean(mse1);
    y2(i)=mean(mse2);
  
end
semilogy(x,y1,x,y2,'-ro');
xlabel('Eb/No (dB)');ylabel('������');
title('������ϲ������Ⱥϲ��ľ������');
grid on;
legend('y1���Ⱥϲ�','y2������ϲ�',2)


