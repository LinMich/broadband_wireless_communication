function [sys,x0,str,ts]=encode(t,x,u,flag)
switch flag,
    case 0
        [sys,x0,str,ts]=mdlInitializeSizes;
    case 2
        sys=mdlUpdate(t,x,u);
    case 3
        sys=mdlOutputs(t,x,u);
    case {1,4,9}
        sys=[];
    otherwise
        error(['Unhandled flag= ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes()
sizes=simsizes;
sizes.NumContStates=0;         %����״̬����Ϊ0
sizes.NumDiscStates=2;         %��ɢ״̬����Ϊ2
sizes.NumOutputs=2;            %����źŸ���Ϊ2
sizes.NumInputs=1;             %�����źŸ���Ϊ1
sizes.DirFeedthrough=1;        %����ֱ�ӷ���
sizes.NumSampleTimes=1;        %��������Ϊ1
sys=simsizes(sizes);           %ͨ��simsizes��sizes�ṹ���ظ�sys
str=[];                        %����S-�����ı�������str������Ϊ��������
x0=zeros(2,1);                 %����S-�����ĳ�ʼ״̬
ts=[-1 0];                     %��һ����������Ԫ�صľ��󣬵�һ��ʾ����ʱ�䣬�ڶ��б�ʾʱ��ƫ��
%�����ĳ�ʼ������
%--------------------------------------------------------------------------
function sys=mdlUpdate(t,x,u)
sys=[u;x(1,1)]; 

function sys=mdlOutputs(t,x,u)  %����S-����������źŲ���ͨ��sys�������ظ�Simulink
out(1,1)=mod((u+x(2,1)),2);
out(2,1)=mod((u+x(1,1)+x(2,1)),2);
sys=out;
