function [sys,x0,str,ts]=singlerayleigh(t,x,u,flag,N)
switch flag,
    case 0
        [sys,x0,str,ts]=mdlInitializeSizes;
    case 3
        sys=mdlOutputs(t,x,u);
    case {1,2,4,9}
        sys=[];
    otherwise
        error(['Unhandled flag= ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes()
sizes=simsizes;
sizes.NumContStates=0;         %连续状态个数为0
sizes.NumDiscStates=0;         %离散状态个数为0
sizes.    =2066;         %输出信号个数为2066
sizes.NumInputs=0;             %输入信号个数为0
sizes.DirFeedthrough=0;        %不存在直接反馈
sizes.NumSampleTimes=1;        %抽样个数为1
sys=simsizes(sizes);           %通过simsizes把sizes结构返回给sys
str=[];                        %设置S-函数的保留参数str（设置为空向量）
x0=[];                         %设置S-函数的初始状态
ts=[0.25 0];                   %是一个具有两列元素的矩阵，第一表示抽样时间，第二列表示时间偏移
%函数的初始化结束
%--------------------------------------------------------------------------

function sys=mdlOutputs(t,x,u)  %计算S-函数的输出信号并且通过sys参数返回给Simulink
N=2066;                          %用于代表经典谱的频域点数目
fm=100;                         %最大多谱勒频移
delta_f=2*fm/(N-1);             %相邻谱线的频率间隔
T=1/delta_f;                    %衰落波形的时间周期
I_input_time=randn(1,N);        %产生N/2个高斯随机变量
Q_input_time=randn(1,N);        %产生N/2个高斯随机变量

I_input_freq=fft(I_input_time);      %对噪声源进行傅立叶变换
Q_input_freq=fft(Q_input_time);      %对噪声源进行傅立叶变换

for j=2:N-1
   f(j)=-100+(j-1)*200/(N-1);
   SEZ(j) = 1.5/(pi*fm*sqrt(1-(f(j)/fm)^2)); %衰落频谱的表示。。。。。。。。。。。。。多普勒经典谱表达式
end
f(1)=-99.99;f(N)=99.99;
SEZ(1) = 1.5/(pi*fm*sqrt(1-(f(1)/fm)^2));
SEZ(N) = 1.5/(pi*fm*sqrt(1-(f(N)/fm)^2));    %对第一点和第N点的频谱进行截断

I_output_freq = I_input_freq.* sqrt(SEZ); %同相的噪声源与衰落频谱相乘
Q_output_freq = Q_input_freq.* sqrt(SEZ); %正交的噪声源与衰落频谱相乘

I_output_time=ifft(I_output_freq);
Q_output_time=ifft(Q_output_freq);        %进行快速傅立叶反变换

r=abs(I_output_time + i*Q_output_time);   %取模值
sys=10*log10(r);                          %将结果赋给sys







