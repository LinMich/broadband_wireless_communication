function y=Fre_Offset_CDMA(u)
ep=.25;
 k=0:62;
 y=u.*exp(j*2*pi*ep*k/63).';
 

