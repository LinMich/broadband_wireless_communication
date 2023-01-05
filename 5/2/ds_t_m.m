clear;
snr=[-8:2:8];
for k=1:length(snr);
    [t,x,y] = sim('ds_t',[0 2]);
    Pe(k)=ErrorVec(1);
end
semilogy(snr,Pe)
xlabel('Eb/No (dB)');ylabel('Pe');
title('最大比合并情况下滑动相关同步信噪比和误码率的关系曲线');
grid on;

