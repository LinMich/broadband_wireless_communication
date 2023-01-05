clear
x=-6:10;
for i=1:length(x)
    SNR=x(i);
    sim('DS_CDMA1');
    y1(i)=mean(mse1);
    y2(i)=mean(mse2);
  
end
semilogy(x,y1,x,y2,'-ro');
xlabel('Eb/No (dB)');ylabel('误码率');
title('等增益合并和最大比合并的均方误差');
grid on;
legend('y1最大比合并','y2等增益合并',2)


