function y=Fre_Syn_CDMA(u)
r=u(1:63);
t=u(64:end);

for x=1:400;
    ep=x*0.00125;
    k=0:62;
    tt=t.*exp(j*2*pi*ep*k/63).';
    a(x)=tt'*r;
end
[Y,I]=max(abs(a));

y=I*0.00125;
