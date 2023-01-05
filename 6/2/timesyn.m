function  output = timesyn(r)
te=zeros(1,28);
rou=10^(r(187)/10)/(10^(r(187)/10)+1);
for i=1:28
    gam=0;fai=0;
    for k=i:i+28
        gam=gam+r(k)*(r(k+128))';
        fai=fai+0.5*abs(r(k))*abs(r(k))+0.5*abs(r(k+128))*abs(r(k+128));
    end
    te(i)=abs(gam)-rou*fai;
end
[a output]=max(te);