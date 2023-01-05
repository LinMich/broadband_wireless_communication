

N=2066;                          %用于代表经典谱的频域点数目
fm=100;                         %最大多谱勒频移
delta_f=2*fm/(N-1);             %相邻谱线的频率间隔
T=1/delta_f;                    %衰落波形的时间周期


for j=2:N-1
   f(j)=-100+(j-1)*200/(N-1);
   SEZ(j) = 1.5/(pi*fm*sqrt(1-(f(j)/fm)^2)); %衰落频谱的表示。。。。。。。。。。。。。多普勒经典谱表达式
end
f(1)=-99.99;f(N)=99.99;
SEZ(1) = 1.5/(pi*fm*sqrt(1-(f(1)/fm)^2));
SEZ(N) = 1.5/(pi*fm*sqrt(1-(f(N)/fm)^2));    %对第一点和第N点的频谱进行截断

plot (SEZ, 'DisplayName', 'SEZ', 'YDataSource', 'SEZ'); figure(gcf)
hold on




