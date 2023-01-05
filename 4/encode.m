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
sizes.NumContStates=0;         %连续状态个数为0
sizes.NumDiscStates=2;         %离散状态个数为2
sizes.NumOutputs=2;            %输出信号个数为2
sizes.NumInputs=1;             %输入信号个数为1
sizes.DirFeedthrough=1;        %存在直接反馈
sizes.NumSampleTimes=1;        %抽样个数为1
sys=simsizes(sizes);           %通过simsizes把sizes结构返回给sys
str=[];                        %设置S-函数的保留参数str（设置为空向量）
x0=zeros(2,1);                 %设置S-函数的初始状态
ts=[-1 0];                     %是一个具有两列元素的矩阵，第一表示抽样时间，第二列表示时间偏移
%函数的初始化结束
%--------------------------------------------------------------------------
function sys=mdlUpdate(t,x,u)
sys=[u;x(1,1)]; 

function sys=mdlOutputs(t,x,u)  %计算S-函数的输出信号并且通过sys参数返回给Simulink
out(1,1)=mod((u+x(2,1)),2);
out(2,1)=mod((u+x(1,1)+x(2,1)),2);
sys=out;
