clear;
snr=[-8:2:8];
for k=1:length(snr);
    [t,x,y] = sim('ds_t',[0 2]);
    Pe(k)=ErrorVec(1);
end
semilogy(snr,Pe)
xlabel('Eb/No (dB)');ylabel('Pe');
title('���Ⱥϲ�����»������ͬ������Ⱥ������ʵĹ�ϵ����');
grid on;

