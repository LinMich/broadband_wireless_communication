clear
echo on;
x=0:1:10;
for i=1:length(x)
    ebn0=x(i);
    sim('BPSK');
    y(i)=ErrorVec(1);
end
    semilogy(x,y,'r-*');
    
