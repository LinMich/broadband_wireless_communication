function output=DSsyn(input)
       B=input(127:189);
   for k=1:63
       A=input(k:k+62);
       C(k)=A'*B;
   end
   [Y1,I1]=max(abs(C));
   C(I1)=0;
   [Y2,I2]=max(abs(C));
   C(I2)=0;
   [Y3,I3]=max(abs(C));
   out1=input(I1:I1+62);
   out2=input(I2:I2+62);
   out3=input(I3:I3+62);
   output=[out1;out2;out3];