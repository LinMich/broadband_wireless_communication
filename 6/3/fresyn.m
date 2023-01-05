function  output = fresyn(r)
gam=0;
    for k=1:29
        gam=gam+r(k)*(r(k+128))';
    end
output=-1/(2*pi)*angle(gam);
