function [sys,x0,str,ts]=decode(t,x,u,flag)
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
sizes.NumDiscStates=1;         %离散状态个数为1
sizes.NumOutputs=20;           %输出信号个数为20
sizes.NumInputs=40;            %输入信号个数为40
sizes.DirFeedthrough=1;        %存在直接反馈
sizes.NumSampleTimes=1;        %抽样个数为1
sys=simsizes(sizes);           %通过simsizes把sizes结构返回给sys
str=[];                        %设置S-函数的保留参数str（设置为空向量）
x0=0;                          %设置S-函数的初始状态
ts=[-1 0];                     %是一个具有两列元素的矩阵，第一列表示抽样时间，第二列表示时间偏移
%函数的初始化结束
%--------------------------------------------------------------------------
 

function sys=mdlOutputs(t,x,u)  %计算S-函数的输出信号并且通过sys参数返回给Simulink
T=zeros(21,4);                  %设置矩阵空间，前20行保存四组输出，最后一行保存四组汉明距
T(19,3)=1;T(19,4)=1;
T(20,2)=1;T(20,4)=1;            %对矩阵赋初值，以区别四个状态(从做到右设4个状态为S0,S2,S1,S3)
for j=1:20;
    TT=T;
%-------------------------------------------------------------------------
    d1=abs(u(j*2-1))+abs(u(j*2));      %从状态S0到S0的汉明距
    d3=abs(u(j*2-1)-1)+abs(u(j*2)-1);  %从状态S1到S0的汉明距
    if((TT(21,1)+d1)<=(TT(21,3)+d3))
        T(1:18,1)=TT(2:19,1);
        T(21,1)=TT(21,1)+d1;
    else 
        T(1:18,1)=TT(2:19,3);
        T(21,1)=TT(21,3)+d3;
    end
%-------------------------------------------------------------------------
    d1=abs(u(j*2-1)-1)+abs(u(j*2)-1); %从状态S0到S2的汉明距
    d3=abs(u(j*2-1))+abs(u(j*2));     %从状态S1到S2的汉明距
    if((TT(21,1)+d1)<=(TT(21,3)+d3))
        T(1:18,2)=TT(2:19,1);
        T(21,2)=TT(21,1)+d1;
    else 
        T(1:18,2)=TT(2:19,3);
        T(21,2)=TT(21,3)+d3;
    end
%------------------------------------------------------------------------
    d2=abs(u(j*2-1))+abs(u(j*2)-1);  %从状态S2到S1的汉明距
    d4=abs(u(j*2-1)-1)+abs(u(j*2));  %从状态S3到S1的汉明距
    if((TT(21,2)+d2)<=(TT(21,4)+d4))
        T(1:18,3)=TT(2:19,2);
        T(21,3)=TT(21,2)+d2;
    else 
        T(1:18,3)=TT(2:19,4);
        T(21,3)=TT(21,4)+d4;
    end
%--------------------------------------------------------------------------
    d2=abs(u(j*2-1)-1)+abs(u(j*2));  %从状态S2到S3的汉明距
    d4=abs(u(j*2-1))+abs(u(j*2)-1);  %从状态S3到S3的汉明距
    if((TT(21,2)+d2)<=(TT(21,4)+d4))
        T(1:18,4)=TT(2:19,2);
        T(21,4)=TT(21,2)+d2;
    else 
        T(1:18,4)=TT(2:19,4);
        T(21,4)=TT(21,4)+d4;
    end
end
[z,k]=min(T(21,1:4));
y=T(1:20,k);
sys=y';