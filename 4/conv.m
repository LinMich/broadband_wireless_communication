clear
echo on;
x=-4:8;
for i=1:length(x)
    SNR=x(i);
    sim('conversion_code');
    y(i)=mean(BitErrorRate(1));
end
semilogy(x,y);
xlabel('Eb/No (dB)');ylabel('误码率');
title('Viterbi译码的误码率与信噪比曲线');
grid on;