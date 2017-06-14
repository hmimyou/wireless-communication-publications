clear
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Preparation of variables

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% position of Eavesdropper, Source1,Source2, and the Intermediate nodes
% set.
XE=0.5;
XS1=1j;
XS2=1+1j;

Ts=1.7;
TotalTestNum=1;     % number of  test loop, for averaging the outage probability
Framelength=5000;
MaxFramelength=8^3*Framelength;
ErrNum=100;           % register the error bit number. 
TestStep=1.5;            % Power step 
PowerRatio1=0.01;         %=L1
PowerRatio2=20;       %=L2

 PropVsPower_CS=ones(11,1);
 PropVsPower_OS=ones(11,1);
 PropVsPower_OSJ=ones(11,1);
 PropVsPower_OW=ones(11,1);
 PropVsPower_SSJ=ones(11,1);
 PropVsPower_Asymp=ones(11,1);
 PropVsPower_Asymp_OS=ones(11,1);


XIn=[0.5+0.5j,0.52+0.52j,0.48+0.48j,0.52+0.48j,0.48+0.52j,0.55+0.55j,0.55+0.53j,0.48+0.53j];
InterNodeNum=8;


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



 
 



 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 % Computing the outage probability of  each schemes
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for m=1:10     % totally 10 power point  
    
    PS=10^(m*TestStep/10);
    
 %   PJ2=0;
    PJ1=PS/PowerRatio1;
    PJ2=PS/PowerRatio2;
    PR=PS;
    
     'Power LOOP:'
    m
    'TOTAL LOOPS: 10' 

    
    temp_Prop_CS=0;
    temp_Prop_OS=0;
    temp_Prop_OSJ=0;
    temp_Prop_OW=0;
    temp_Prop_SSJ=0;

    
    for testloop=1:TotalTestNum   % several tests for averaging.

%         if (m==3||ErrNum<20) && Framelength<MaxFramelength         % if the framelength is not long enough to have sufficient bit errors, double the framelength.
%             Framelength=Framelength*8;
%         end
        
         CS_Cs=zeros(Framelength,1);
         OS_Cs=zeros(Framelength,1);
         OSJ_Cs=zeros(Framelength,1);
         SSJ_Cs=zeros(Framelength,1);
         OW_Cs=zeros(Framelength,1);

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
             Max_OW1=0;
             Max_SSJ=0;
              
             gama_S1E=PS*h2_S1E(1,bitInd);      %% ??      
             gama_S2E=PS*h2_S2E(1,bitInd);
             E_gama_S1E=PS*SigmaS1E;      %% ??      
             E_gama_S2E=PS*SigmaS2E;
             
             for R=1:InterNodeNum
                 
                 gama_RS1=PR*h2_InS1(R,bitInd);
                 gama_RS2=PR*h2_InS2(R,bitInd);
                 gama_RE=PR*h2_InE(R,bitInd);
                 E_gama_RE=PR*SigmaEIn(R);
                  
                 % selected Ralay node for CS scheme for bit of bitInd
                 if gama_RS1>Max_CS 
                    Sel_R_CS=R;
                    Max_CS=gama_RS1; 
                 end
                  % selected Ralay node for OS scheme for bit of bitInd
                  Gama_E2_OS=gama_S2E/(gama_S1E+1)+gama_RE/(gama_RE+1);
                  if (1+gama_RS1)/(1+Gama_E2_OS)>Max_OS 
                      Sel_R_OS=R;
                      Max_OS=(1+gama_RS1)/(1+Gama_E2_OS);
                  end
                        
                 
                 for J1=1:InterNodeNum
                     if J1==R
                         continue;
                     end
                     gama_J1E=PJ1*h2_InE(J1,bitInd);
                     E_gama_J1E=PJ1*SigmaEIn(J1);
                     
                     Gama1_OW1=gama_RS1;
                     Gama_E2_OW1=gama_S2E/(gama_S1E+gama_J1E+1)+gama_RE/(gama_RE+1);
                     if (1+Gama1_OW1)/(1+Gama_E2_OW1)>Max_OW1 
                             Sel_R_OW1=R;
                             Sel_J1_OW1=J1;             
                             Max_OW1=(1+Gama1_OW1)/(1+Gama_E2_OW1);
                     end
                     
                    for J2=1:InterNodeNum
                        if J2==R
                            continue;
                        end                         % list all the possible combination of R, J1 and J2     
                        gama_J2S1=PJ2*h2_InS1(J2,bitInd);
                        gama_J2S2=PJ2*h2_InS2(J2,bitInd);
                        gama_J2E=PJ2*h2_InE(J2,bitInd);
                        E_gama_J2E=PJ2*SigmaEIn(J2);
                        
                        % selected R,J1,J2 for OSJ scheme for bit of bitInd
                        Gama1=gama_RS1/(gama_J2S1+1);
                        Gama_E2=gama_S2E/(gama_S1E+gama_J1E+1)+gama_RE/(gama_RE+gama_J2E+1);
                        if (1+Gama1)/(1+Gama_E2)>Max_OSJ 
                             Sel_R_OSJ=R;
                             Sel_J1_OSJ=J1;
                             Sel_J2_OSJ=J2;
                             Max_OSJ=(1+Gama1)/(1+Gama_E2);
                        end
                        
                        % selected R,J1,J2 for SSJ scheme for bit of bitInd
                        Gama1_SSJ=Gama1;
                        Gama_E2_SSJ=E_gama_S2E/(E_gama_S1E+E_gama_J1E+1)+E_gama_RE/(E_gama_RE+E_gama_J2E+1);
                        if (1+Gama1_SSJ)/(1+Gama_E2_SSJ)>Max_SSJ 
                             Sel_R_SSJ=R;
                             Sel_J1_SSJ=J1;
                             Sel_J2_SSJ=J2;
                             Max_SSJ=(1+Gama1_SSJ)/(1+Gama_E2_SSJ);
                        end

                    end
                 end
             end
             
             
    
              % secrecy rate computation
              
              % secrecy rate for CS scheme
              gama_RS1=PR*h2_InS1(Sel_R_CS,bitInd);
              gama_RS2=PR*h2_InS2(Sel_R_CS,bitInd);
              gama_RE=PR*h2_InE(Sel_R_CS,bitInd);
              Gama1_CS=gama_RS1;
              Gama_E2_CS=gama_S2E/(gama_S1E+1)+gama_RE/(gama_RE+1);
              CS_Cs(bitInd)=0.5*log2(1+Gama1_CS)-0.5*log2(1+Gama_E2_CS);
              
              % secrecy rate for OS scheme
              gama_RS1=PR*h2_InS1(Sel_R_OS,bitInd);
              gama_RS2=PR*h2_InS2(Sel_R_OS,bitInd);
              gama_RE=PR*h2_InE(Sel_R_OS,bitInd);
              Gama1_OS=gama_RS1;
              Gama_E2_OS=gama_S2E/(gama_S1E+1)+gama_RE/(gama_RE+1);
              OS_Cs(bitInd)=0.5*log2(1+Gama1_OS)-0.5*log2(1+Gama_E2_OS);
              
              % secrecy rate for OSJ scheme
              gama_RS1=PR*h2_InS1(Sel_R_OSJ,bitInd);
              gama_RS2=PR*h2_InS2(Sel_R_OSJ,bitInd);
              gama_RE=PR*h2_InE(Sel_R_OSJ,bitInd);
              gama_J1E=PJ1*h2_InE(Sel_J1_OSJ,bitInd);
              gama_J2S1=PJ2*h2_InS1(Sel_J2_OSJ,bitInd);
              gama_J2S2=PJ2*h2_InS2(Sel_J2_OSJ,bitInd);
              gama_J2E=PJ2*h2_InE(Sel_J2_OSJ,bitInd);
              Gama1_OSJ=gama_RS1/(gama_J2S1+1);
              Gama_E2_OSJ=gama_S2E/(gama_S1E+gama_J1E+1)+gama_RE/(gama_RE+gama_J2E+1);
              OSJ_Cs(bitInd)=0.5*log2(1+Gama1_OSJ)-0.5*log2(1+Gama_E2_OSJ);
              
               % secrecy rate for SSJ scheme
              gama_RS1=PR*h2_InS1(Sel_R_SSJ,bitInd);
              gama_RS2=PR*h2_InS2(Sel_R_SSJ,bitInd);
              gama_RE=PR*h2_InE(Sel_R_SSJ,bitInd);
              gama_J1E=PJ1*h2_InE(Sel_J1_SSJ,bitInd);
              gama_J2S1=PJ2*h2_InS1(Sel_J2_SSJ,bitInd);
              gama_J2S2=PJ2*h2_InS2(Sel_J2_SSJ,bitInd);
              gama_J2E=PJ2*h2_InE(Sel_J2_SSJ,bitInd);
              Gama1_SSJ=gama_RS1/(gama_J2S1+1);
              Gama_E2_SSJ=gama_S2E/(gama_S1E+gama_J1E+1)+gama_RE/(gama_RE+gama_J2E+1);
              SSJ_Cs(bitInd)=0.5*log2(1+Gama1_SSJ)-0.5*log2(1+Gama_E2_SSJ);
              
              % secrecy rate for OW scheme
              OW_Cs(bitInd)=max(OSJ_Cs(bitInd),0.5*log2(Max_OW1));
              
           
         end
         
        
        
        
        outageCount_CS=nnz(CS_Cs<Ts);
        outageCount_OS=nnz(OS_Cs<Ts);
        outageCount_OSJ=nnz(OSJ_Cs<Ts); 
        outageCount_OW=nnz(OW_Cs<Ts);
        outageCount_SSJ=nnz(SSJ_Cs<Ts);

        temp_Prop_CS=temp_Prop_CS+outageCount_CS/Framelength;  % accumulated outage probability
        temp_Prop_OS=temp_Prop_OS+outageCount_OS/Framelength;
        temp_Prop_OSJ=temp_Prop_OSJ+outageCount_OSJ/Framelength;
        temp_Prop_OW=temp_Prop_OW+outageCount_OW/Framelength;
        temp_Prop_SSJ=temp_Prop_SSJ+outageCount_SSJ/Framelength;

        ErrNum=outageCount_SSJ

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
    
    
    PropVsPower_OW(m+1)=temp_Prop_OW/TotalTestNum;
    if PropVsPower_OW(m+1)<1e-6
        PropVsPower_OW(m+1)=1e-5;
    end
    
    PropVsPower_SSJ(m+1)=temp_Prop_SSJ/TotalTestNum;
    if PropVsPower_SSJ(m+1)<1e-6
        PropVsPower_SSJ(m+1)=1e-6;
    end
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %  Asymptotic line of OSJ

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


        Ro=(2*2^(2*Ts)-1)/PR;
         LamdaRS1=SigmaS1In(1);
    %     Lamda1=SigmaS2E;
    %     Lamda2=SigmaS1E;
    %     LamdaY=SigmaEIn(1)/PowerRatio1;
    % 
    %     Prop_Asymp=1-LamdaS*exp(-2*Ro/LamdaS)/Ro;
    % 
%     Prop_Asymp=0;
%     for n=0:InterNodeNum
%         CnK=factorial(InterNodeNum)/(factorial(n)*factorial(InterNodeNum-n));
%         Prop_Asymp=Prop_Asymp+CnK*(-1)^n/(n*Ro+InterNodeNum-1);
%     end

    PropVsPower_Asymp(m+1)=(1-exp(-Ro/LamdaRS1))^InterNodeNum;
    
   %  PropVsPower_Asymp=Prop_Asymp*(InterNodeNum-1)*ones(11,1);
   
   
   
       
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %  Asymptotic line of OS
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    Prop_Asymp=1;
        
    for n=1:InterNodeNum
        CnK=factorial(InterNodeNum)/(factorial(n)*factorial(InterNodeNum-n));   
        An=n*(2^(2*Ts+1)-1)/SigmaS1In(1)/PR;
        Bn=SigmaS2E*n*2^(2*Ts)/SigmaS1E/SigmaS1In(1)/PR;
        Prop_Asymp=Prop_Asymp+((-1)^n)*CnK*exp(-An)*(1-Bn*exp(Bn)*expint(Bn));
    end
    
    PropVsPower_Asymp_OS(m+1)=Prop_Asymp;
    
   
    
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

%  Plotting the graphic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x=0:TestStep:10*TestStep;

figure(2);
semilogy(x,PropVsPower_CS,'y->');

hold on;
semilogy(x,PropVsPower_OS,'m-<');

hold on;
semilogy(x,PropVsPower_OSJ,'b-^');

hold on;
semilogy(x,PropVsPower_OW,'k-v');

hold on;
semilogy(x,PropVsPower_SSJ,'r-d');

hold on;
semilogy(x,PropVsPower_Asymp,'g-d');

hold on;
semilogy(x,PropVsPower_Asymp_OS,'c-d');

grid on;
box on;
