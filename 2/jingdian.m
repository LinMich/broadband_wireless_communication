

N=2066;                          %���ڴ������׵�Ƶ�����Ŀ
fm=100;                         %��������Ƶ��
delta_f=2*fm/(N-1);             %�������ߵ�Ƶ�ʼ��
T=1/delta_f;                    %˥�䲨�ε�ʱ������


for j=2:N-1
   f(j)=-100+(j-1)*200/(N-1);
   SEZ(j) = 1.5/(pi*fm*sqrt(1-(f(j)/fm)^2)); %˥��Ƶ�׵ı�ʾ�������������������������������վ����ױ��ʽ
end
f(1)=-99.99;f(N)=99.99;
SEZ(1) = 1.5/(pi*fm*sqrt(1-(f(1)/fm)^2));
SEZ(N) = 1.5/(pi*fm*sqrt(1-(f(N)/fm)^2));    %�Ե�һ��͵�N���Ƶ�׽��нض�

plot (SEZ, 'DisplayName', 'SEZ', 'YDataSource', 'SEZ'); figure(gcf)
hold on




