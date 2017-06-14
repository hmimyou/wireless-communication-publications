clear
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Preparation of variables

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% position of Eavesdropper, Source1,Source2, and the Intermediate nodes
% set.
XE=0.5+1j;
XS1=0.00001+0.0001j;
XS2=1+0.00001j;
XInCenter=0.5+0.00001j;
XIn=[XInCenter,XInCenter+0.02+0.02j,XInCenter-0.02-0.02j,XInCenter-0.02+0.02j,XInCenter+0.02-0.02j,XInCenter+0.05+0.03j,XInCenter-0.05+0.02j,XInCenter-0.03+0.05j];
InterNodeNum=6;

 figure(1);
 plot([XS1,XS2]);
 hold on;
 plot(XIn);
 hold on;
 plot(XE);

DS1In=abs(XS1-XIn);
DS2In=abs(XS2-XIn);
DEIn=abs(XE-XIn);
DS1E=abs(XS1-XE);
DS2E=abs(XS2-XE);

SigmaS1In=DS1In.^(-3);
SigmaS2In=DS2In.^(-3);
SigmaEIn=DEIn.^(-3);
SigmaS1E=DS1E.^(-3);
SigmaS2E=DS2E.^(-3);

Ts=0.1;
TotalTestNum=1;     % number of  test loop, for averaging the outage probability
Framelength=16000;
MaxFramelength=4^6*Framelength;
ErrNum=100;           % register the error bit number. 
TestStep=0.5;            % Power Ratio Step
SigmaN=1;
 
 
 PropVsPower_CS=ones(11,1);
 PropVsPower_OS=ones(11,1);
 PropVsPower_OSJ=ones(11,1);
 PropVsPower_SJ3=ones(11,1);
 PropVsPower_Asymp=ones(11,1);

 x=zeros(11,1);

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 % Computing the outage probability of  each schemes
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for m=0:10     % totally 10 power point  
    
    PS=10;
    PR=PS;
    
    PowerRatio1=10^(m*TestStep-3);     %=L1
    
    
    PowerRatio2=PowerRatio1;       %=L2
    x(m+1)=PowerRatio1;
%     PJ1=0;
%     PJ2=0;
    PJ1=PS*PowerRatio1;
    PJ2=PS*PowerRatio2;
    PJ3=PJ1;
    
     'Power LOOP:'
    m
    'TOTAL LOOPS: 10' 

    
    temp_Prop_CS=0;
    temp_Prop_OS=0;
    temp_Prop_OSJ=0;
    temp_Prop_SJ3=0;

    
    for testloop=1:TotalTestNum   % several tests for averaging.

        if (ErrNum<50) && Framelength<MaxFramelength         % if the framelength is not long enough to have sufficient bit errors, double the framelength.
            Framelength=Framelength*4;
        end
        
         CS_Cs=zeros(Framelength,1);
         OS_Cs=zeros(Framelength,1);
         OSJ_Cs=zeros(Framelength,1);
         SJ3_Cs=zeros(Framelength,1);
       
         %%%  channel coefficient matrix 
        h2_S1E=SigmaS1E.*(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;
        h2_S2E=SigmaS2E.*(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;

        h2_InS1=zeros(InterNodeNum,Framelength);
        for i=1:InterNodeNum
            h2_InS1(i,:)=SigmaS1In(i).*(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;
        end

        h2_InS2=zeros(InterNodeNum,Framelength);
        for i=1:InterNodeNum
            h2_InS2(i,:)=SigmaS2In(i).*(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;
        end

        h2_InE=zeros(InterNodeNum,Framelength);
        for i=1:InterNodeNum
            h2_InE(i,:)=SigmaEIn(i).*(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;
        end
        
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Relay & Jammer Selection    && secrecy rate computation   for each
        % bit in the Frame
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%
         
         for bitInd=1:Framelength   %secrecy rate computation for each bit in the frame
             
            
              % Relay & Jammer Selection
             Max_CS=0;
             Max_OS=0;
             Max_OSJ=0;
             Max_SJ3=0;
              
             gama_S1E=PS*h2_S1E(1,bitInd);      
             gama_S2E=PS*h2_S2E(1,bitInd);
%              E_gama_S1E=PS*SigmaS1E;            
%              E_gama_S2E=PS*SigmaS2E;
             
             for R=1:InterNodeNum
                 
                 gama_RS1=PR*h2_InS1(R,bitInd);
                 gama_RS2=PR*h2_InS2(R,bitInd);
                 gama_RE=PR*h2_InE(R,bitInd);
%                  E_gama_RE=PR*SigmaEIn(R);
                  
                 % selected Ralay node for CS scheme for bit of bitInd
                 if min(gama_RS1,gama_RS2)>Max_CS 
                    Sel_R_CS=R;
                    Max_CS=min(gama_RS1,gama_RS2); 
                 end
                  % selected Ralay node for OS scheme for bit of bitInd
                  Gama1_OS=gama_RS1/SigmaN;
                  Gama2_OS=gama_RS2/SigmaN;
                  Gama_E1_OS=gama_S1E/SigmaN+gama_RE/SigmaN;
                  Gama_E2_OS=gama_S2E/SigmaN+gama_RE/SigmaN;
                  Temp=min(Gama1_OS/Gama_E2_OS, Gama2_OS/Gama_E1_OS);
                  if Temp>Max_OS 
                      Sel_R_OS=R;
                      Max_OS=Temp;
                  end
                        
                 
                 for J1=1:InterNodeNum
                     if J1==R
                         continue;
                     end
                     gama_J1E=PJ1*h2_InE(J1,bitInd);
%                      E_gama_J1E=PJ1*SigmaEIn(J1);
                                     
                    for J2=1:InterNodeNum
                        if J2==R
                            continue;
                        end                         % list all the possible combination of R, J1 and J2     
                        
                        gama_J2E=PJ2*h2_InE(J2,bitInd);
%                         E_gama_J2E=PJ2*SigmaEIn(J2);
                        
                        % selected R,J1,J2 for OSJ scheme for bit of bitInd
                        Gama1=gama_RS1/SigmaN;
                        Gama2=gama_RS2/SigmaN;
                        Gama_E1=gama_S1E/(gama_J1E+SigmaN)+gama_RE/SigmaN;
                        Gama_E2=gama_S2E/(gama_J2E+SigmaN)+gama_RE/SigmaN;
                        Temp=min(Gama1/Gama_E2, Gama2/Gama_E1);
                        if Temp>Max_OSJ 
                             Sel_R_OSJ=R;
                             Sel_J1_OSJ=J1;
                             Sel_J2_OSJ=J2;
                             Max_OSJ=Temp;
                        end
%                       
                        for J3=1:InterNodeNum
                            if J3==R
                                continue;
                            end
                            gama_J3E=PJ3*h2_InE(J3,bitInd);
                            gama_J3S1=PJ3*h2_InS1(J3,bitInd);
                            gama_J3S2=PJ3*h2_InS2(J3,bitInd);
                            
                             % selected R,J1,J2,J3 for SJ scheme  with J3 for bit of bitInd
                            
                            Gama1_SJ3=gama_RS1/(gama_J3S1+SigmaN);
                            Gama2_SJ3=gama_RS2/(gama_J3S2+SigmaN);
                            Gama_E1_SJ3=gama_S1E/(gama_J1E+SigmaN)+gama_RE/(gama_J3E+SigmaN);
                            Gama_E2_SJ3=gama_S2E/(gama_J2E+SigmaN)+gama_RE/(gama_J3E+SigmaN);
                            Temp=min(Gama1_SJ3/Gama_E2_SJ3, Gama2_SJ3/Gama_E1_SJ3);
                            if Temp>Max_SJ3
                                 Sel_R_SJ3=R;
                                 Sel_J1_SJ3=J1;
                                 Sel_J2_SJ3=J2;
                                 Sel_J3_SJ3=J3;
                                 Max_SJ3=Temp;
                            end
                            
                        end
%                         % selected R,J1,J2 for SSJ scheme for bit of bitInd
%                         Gama1_SSJ=Gama1;
%                         Gama2_SSJ=Gama2;
%                         Gama_E1_SSJ=E_gama_S1E/(E_gama_J1E+SigmaN)+E_gama_RE/SigmaN;
%                         Gama_E2_SSJ=E_gama_S2E/(E_gama_J2E+SigmaN)+E_gama_RE/SigmaN;
%                         Temp=min(Gama1_SSJ/Gama_E2_SSJ, Gama2_SSJ/Gama_E1_SSJ);
%                         if Temp>Max_SSJ 
%                              Sel_R_SSJ=R;
%                              Sel_J1_SSJ=J1;
%                              Sel_J2_SSJ=J2;
%                              Max_SSJ=Temp;
%                        end

                    end
                 end
             end
             
             
    
              % secrecy rate computation
              
              % secrecy rate for CS scheme
              gama_RS1=PR*h2_InS1(Sel_R_CS,bitInd);
              gama_RS2=PR*h2_InS2(Sel_R_CS,bitInd);
              gama_RE=PR*h2_InE(Sel_R_CS,bitInd);
              Gama1_CS=gama_RS1/SigmaN;
              Gama2_CS=gama_RS2/SigmaN;
              Gama_E1_CS=gama_S1E/SigmaN+gama_RE/SigmaN;
              Gama_E2_CS=gama_S2E/SigmaN+gama_RE/SigmaN;
              Cs1_CS=0.5*log2(1+Gama1_CS)-0.5*log2(1+Gama_E2_CS);
              Cs2_CS=0.5*log2(1+Gama2_CS)-0.5*log2(1+Gama_E1_CS);
              CS_Cs(bitInd)=min(Cs1_CS,Cs2_CS);
              
              % secrecy rate for OS scheme
              gama_RS1=PR*h2_InS1(Sel_R_OS,bitInd);
              gama_RS2=PR*h2_InS2(Sel_R_OS,bitInd);
              gama_RE=PR*h2_InE(Sel_R_OS,bitInd);
              Gama1_OS=gama_RS1/SigmaN;
              Gama2_OS=gama_RS2/SigmaN;
              Gama_E1_OS=gama_S1E/SigmaN+gama_RE/SigmaN;
              Gama_E2_OS=gama_S2E/SigmaN+gama_RE/SigmaN;
              Cs1_OS=0.5*log2(1+Gama1_OS)-0.5*log2(1+Gama_E2_OS);
              Cs2_OS=0.5*log2(1+Gama2_OS)-0.5*log2(1+Gama_E1_OS);
              OS_Cs(bitInd)=min(Cs1_OS,Cs2_OS);
              
              % secrecy rate for OSJ scheme
              gama_RS1=PR*h2_InS1(Sel_R_OSJ,bitInd);
              gama_RS2=PR*h2_InS2(Sel_R_OSJ,bitInd);
              gama_RE=PR*h2_InE(Sel_R_OSJ,bitInd);
              gama_J1E=PJ1*h2_InE(Sel_J1_OSJ,bitInd);
              gama_J2E=PJ2*h2_InE(Sel_J2_OSJ,bitInd);
              Gama1_OSJ=gama_RS1/SigmaN;
              Gama2_OSJ=gama_RS2/SigmaN;
              Gama_E1_OSJ=gama_S1E/(gama_J1E+SigmaN)+gama_RE/SigmaN;
              Gama_E2_OSJ=gama_S2E/(gama_J2E+SigmaN)+gama_RE/SigmaN;
              Cs1_OSJ=0.5*log2(1+Gama1_OSJ)-0.5*log2(1+Gama_E2_OSJ);
              Cs2_OSJ=0.5*log2(1+Gama2_OSJ)-0.5*log2(1+Gama_E1_OSJ);
              OSJ_Cs(bitInd)=min(Cs1_OSJ,Cs2_OSJ);
             
%                % secrecy rate for SJ3 scheme
              gama_RS1=PR*h2_InS1(Sel_R_SJ3,bitInd);
              gama_RS2=PR*h2_InS2(Sel_R_SJ3,bitInd);
              gama_RE=PR*h2_InE(Sel_R_SJ3,bitInd);
              gama_J1E=PJ1*h2_InE(Sel_J1_SJ3,bitInd);
              gama_J2S1=PJ2*h2_InS1(Sel_J2_SJ3,bitInd);
              gama_J2S2=PJ2*h2_InS2(Sel_J2_SJ3,bitInd);
              gama_J2E=PJ2*h2_InE(Sel_J2_SJ3,bitInd);
              gama_J3E=PJ3*h2_InE(Sel_J3_SJ3,bitInd);
              gama_J3S1=PJ3*h2_InS1(Sel_J3_SJ3,bitInd);
              gama_J3S2=PJ3*h2_InS2(Sel_J3_SJ3,bitInd);
              
              Gama1_SJ3=gama_RS1/(gama_J3S1+SigmaN);
              Gama2_SJ3=gama_RS2/(gama_J3S2+SigmaN);
              Gama_E1_SJ3=gama_S1E/(gama_J1E+SigmaN)+gama_RE/(gama_J3E+SigmaN);
              Gama_E2_SJ3=gama_S2E/(gama_J2E+SigmaN)+gama_RE/(gama_J3E+SigmaN);
              Cs1_SJ3=0.5*log2(1+Gama1_SJ3)-0.5*log2(1+Gama_E2_SJ3);
              Cs2_SJ3=0.5*log2(1+Gama2_SJ3)-0.5*log2(1+Gama_E1_SJ3);
              SJ3_Cs(bitInd)=min(Cs1_SJ3,Cs2_SJ3);
%               
              
           
         end
         
        
        
        
        outageCount_CS=nnz(CS_Cs<Ts);
        outageCount_OS=nnz(OS_Cs<Ts);
        outageCount_OSJ=nnz(OSJ_Cs<Ts); 
        outageCount_SJ3=nnz(SJ3_Cs<Ts);

        temp_Prop_CS=temp_Prop_CS+outageCount_CS/Framelength;  % accumulated outage probability
        temp_Prop_OS=temp_Prop_OS+outageCount_OS/Framelength;
        temp_Prop_OSJ=temp_Prop_OSJ+outageCount_OSJ/Framelength;
        temp_Prop_SJ3=temp_Prop_SJ3+outageCount_SJ3/Framelength;

        ErrNum=outageCount_OSJ

    end

    %%%%%%%%%%%
    % Outage Probability vs Transmitted Power
    %%%%%%%%%%%%%%
    PropVsPower_CS(m+1)=temp_Prop_CS/TotalTestNum;
    if PropVsPower_CS(m+1)<1e-6
        PropVsPower_CS(m+1)=1e-6;
    end
    
    PropVsPower_OS(m+1)=temp_Prop_OS/TotalTestNum;
    if PropVsPower_OS(m+1)<1e-6
        PropVsPower_OS(m+1)=1e-6;
    end
    
    PropVsPower_OSJ(m+1)=temp_Prop_OSJ/TotalTestNum;
    if PropVsPower_OSJ(m+1)<1e-6
        PropVsPower_OSJ(m+1)=1e-6;
    end
    
    
    PropVsPower_SJ3(m+1)=temp_Prop_SJ3/TotalTestNum;
    if PropVsPower_SJ3(m+1)<1e-6
        PropVsPower_SJ3(m+1)=1e-6;
    end
    
    
   
    
end


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %  Asymptotic line of OSJ

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    Ro=2^(2*Ts);
    Asymp=(1-1/((SigmaEIn(1)/SigmaS1In(1)+SigmaEIn(1)/SigmaS2In(1))*Ro+1))^InterNodeNum;
    
    PropVsPower_Asymp=PropVsPower_Asymp.*Asymp;
    
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

%  Plotting the graphic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure(2);
semilogy(x,PropVsPower_CS,'y->');

hold on;
semilogy(x,PropVsPower_OS,'m-<');

hold on;
semilogy(x,PropVsPower_OSJ,'b-^');

hold on;
semilogy(x,PropVsPower_SJ3,'r-d');

hold on;
semilogy(x,PropVsPower_Asymp,'g-d');


grid on;
box on;
