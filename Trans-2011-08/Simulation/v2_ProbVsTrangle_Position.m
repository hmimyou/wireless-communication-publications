clear
clc


% position of Eavesdropper, Source1,Source2, and the Intermediate nodes
% set.
XS1=0.00001+0.0001j;
XS2=1+0.00001j;
XInCenter=0.5+0.00001j;
XIn=[XInCenter,XInCenter+0.02+0.02j,XInCenter-0.02-0.02j,XInCenter-0.02+0.02j,XInCenter+0.02-0.02j,XInCenter+0.05+0.03j,XInCenter-0.05+0.02j,XInCenter-0.03+0.05j];
InterNodeNum=6;
TestPointNum=11;
XE=ones(TestPointNum,1);

for m=0:TestPointNum-1
    theta=(m/20+0.25)*pi;
    XE(m+1)=0.5+cos(theta)+sin(theta)*1j;
    
    if m==3
        X=XE(m+1);
    end
end

 figure(1);
 plot([XS1,XS2]);
 hold on;
 plot(XIn);
 hold on;
 plot(XE);
 hold on;
 plot(X);
 