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
sizes.NumContStates=0;         %����״̬����Ϊ0
sizes.NumDiscStates=0;         %��ɢ״̬����Ϊ0
sizes.    =2066;         %����źŸ���Ϊ2066
sizes.NumInputs=0;             %�����źŸ���Ϊ0
sizes.DirFeedthrough=0;        %������ֱ�ӷ���
sizes.NumSampleTimes=1;        %��������Ϊ1
sys=simsizes(sizes);           %ͨ��simsizes��sizes�ṹ���ظ�sys
str=[];                        %����S-�����ı�������str������Ϊ��������
x0=[];                         %����S-�����ĳ�ʼ״̬
ts=[0.25 0];                   %��һ����������Ԫ�صľ��󣬵�һ��ʾ����ʱ�䣬�ڶ��б�ʾʱ��ƫ��
%�����ĳ�ʼ������
%--------------------------------------------------------------------------

function sys=mdlOutputs(t,x,u)  %����S-����������źŲ���ͨ��sys�������ظ�Simulink
N=2066;                          %���ڴ������׵�Ƶ�����Ŀ
fm=100;                         %��������Ƶ��
delta_f=2*fm/(N-1);             %�������ߵ�Ƶ�ʼ��
T=1/delta_f;                    %˥�䲨�ε�ʱ������
I_input_time=randn(1,N);        %����N/2����˹�������
Q_input_time=randn(1,N);        %����N/2����˹�������

I_input_freq=fft(I_input_time);      %������Դ���и���Ҷ�任
Q_input_freq=fft(Q_input_time);      %������Դ���и���Ҷ�任

for j=2:N-1
   f(j)=-100+(j-1)*200/(N-1);
   SEZ(j) = 1.5/(pi*fm*sqrt(1-(f(j)/fm)^2)); %˥��Ƶ�׵ı�ʾ�������������������������������վ����ױ��ʽ
end
f(1)=-99.99;f(N)=99.99;
SEZ(1) = 1.5/(pi*fm*sqrt(1-(f(1)/fm)^2));
SEZ(N) = 1.5/(pi*fm*sqrt(1-(f(N)/fm)^2));    %�Ե�һ��͵�N���Ƶ�׽��нض�

I_output_freq = I_input_freq.* sqrt(SEZ); %ͬ�������Դ��˥��Ƶ�����
Q_output_freq = Q_input_freq.* sqrt(SEZ); %����������Դ��˥��Ƶ�����

I_output_time=ifft(I_output_freq);
Q_output_time=ifft(Q_output_freq);        %���п��ٸ���Ҷ���任

r=abs(I_output_time + i*Q_output_time);   %ȡģֵ
sys=10*log10(r);                          %���������sys







