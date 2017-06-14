clear
clc
XE=0.5;
XS1=1j;
XS2=1+1j;
XR=[0.1+0.88j,0.2+0.9j,0.16+0.82j,0.24+0.79j,0.32+0.73j,0.22+0.85j,0.36+0.82j,0.17+0.79j];
XJ1=[0.1+0.88j,0.2+0.9j,0.16+0.82j,0.24+0.79j,0.32+0.73j,0.22+0.85j,0.36+0.82j,0.17+0.79j];
XJ2=[0.1+0.88j,0.2+0.9j,0.16+0.82j,0.24+0.79j,0.32+0.73j,0.22+0.85j,0.36+0.82j,0.17+0.79j];

figure(1);
plot([XS1,XS2]);
hold on;
plot(XE+0.00001j);
hold on;
plot(XR);

DS1R=abs(XS1-XR);
DRS1=DS1R;
DS2R=abs(XS2-XR);
DRS2=DS2R;
DS1E=abs(XS1-XE);
DS2E=abs(XS2-XE);
DJ1E=abs(XJ1-XE);
DJ2S1=abs(XJ2-XS1);
DJ2S2=abs(XJ2-XS2);
DJ2E=abs(XJ2-XE);
DRE=abs(XR-XE);

SigmaRS1=DRS1.^(-3);
SigmaS1R=SigmaRS1;
SigmaRS2=DRS2.^(-3);
SigmaS2R=SigmaRS2;
SigmaS1E=DS1E.^(-3);
SigmaS2E=DS2E.^(-3);
SigmaJ1E=DJ1E.^(-3);
SigmaJ2S1=DJ2S1.^(-3);
SigmaJ2S2=DJ2S2.^(-3);
SigmaJ2E=DJ2E.^(-3);
SigmaRE=DRE.^(-3);


TotalTestNum=10;
Framelength=1000;
PowerNum=11;
TestStep=2.5;
 
 
 
 
 SMS_Cs1(Framelength)=0;
 SMS_Cs2(Framelength)=0;
 SMM_Cs1(Framelength)=0;
 SMM_Cs2(Framelength)=0;
 OMS_Cs1(Framelength)=0;
 OMS_Cs2(Framelength)=0;
 OMM_Cs1(Framelength)=0;
 OMM_Cs2(Framelength)=0;
 CS_Cs1(Framelength)=0;
 CS_Cs2(Framelength)=0;
 OS_Cs1(Framelength)=0;
 OS_Cs2(Framelength)=0;
 SS_Cs1(Framelength)=0;
 SS_Cs2(Framelength)=0;
 OW_Cs1(Framelength)=0;
 OW_Cs2(Framelength)=0;
 SW_Cs1(Framelength)=0;
 SW_Cs2(Framelength)=0;
 OSKJ_Cs1(Framelength)=0;
 OSKJ_Cs2(Framelength)=0;
 
 SMS_Cs(Framelength)=0;
 OMS_Cs(Framelength)=0;
 SMM_Cs(Framelength)=0;
 OMM_Cs(Framelength)=0;
 SS_Cs(Framelength)=0;
 CS_Cs(Framelength)=0;
 OS_Cs(Framelength)=0;
 OW_Cs(Framelength)=0;
 SW_Cs(Framelength)=0;
 OSKJ_Cs(Framelength)=0;
 
 T_SMS_Cs(TotalTestNum)=0;
 T_OMS_Cs(TotalTestNum)=0;
 T_SMM_Cs(TotalTestNum)=0;
 T_OMM_Cs(TotalTestNum)=0;
 T_SS_Cs(TotalTestNum)=0;
 T_CS_Cs(TotalTestNum)=0;
 T_OS_Cs(TotalTestNum)=0;
 T_OW_Cs(TotalTestNum)=0;
 T_SW_Cs(TotalTestNum)=0;
 T_OSKJ_Cs(TotalTestNum)=0;
 
     E_SMS_Cs(PowerNum)=0;
     E_OMS_Cs(PowerNum)=0;
     E_SMM_Cs(PowerNum)=0;
     E_OMM_Cs(PowerNum)=0;
     E_SS_Cs(PowerNum)=0;
     E_CS_Cs(PowerNum)=0;
     E_OS_Cs(PowerNum)=0;
     E_OW_Cs(PowerNum)=0;
     E_SW_Cs(PowerNum)=0;
     E_OSKJ_Cs(PowerNum)=0;
     
     
for m=1:PowerNum-1
    
    PS=10^(TestStep*m/10);
    PJ=PS/10;
    
    m
 
    
for testloop=1:TotalTestNum
    
     f_RS1=(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;
     f_S1R=(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;
     f_RS2=(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;
     f_S2R=(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;
     f_S1E=(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;
     f_S2E=(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;
     f_J1E=(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;
     f_J1R=(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;
     f_J2E=(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;
     f_J2S1=(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;
     f_J2S2=(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;
     f_RE=(abs(randn(1,Framelength)+1j*randn(1,Framelength)).^2)/2;
    
for indf=1:Framelength
    
   
    
    OMSIndR=1;
    OMSIndJ1=2;
    OMSIndJ2=2;
    maxOMS=0;
    
    OMMIndR=1;
    OMMIndJ1=2;
    OMMIndJ2=2;
    maxOMM=0;
    
    
    SMSIndR=1;
    SMSIndJ1=2;
    SMSIndJ2=2;
    maxSMS=0;
    
    SMMIndR=1;
    SMMIndJ1=2;
    SMMIndJ2=2;
    maxSMM=0;
    
    CSIndR=1;
    CSIndJ1=2;
    CSIndJ2=2;
    maxCS=0;
    
    OSIndR=1;
    OSIndJ1=2;
    OSIndJ2=2;
    maxOS=0;
    
    SSIndR=1;
    SSIndJ1=2;
    SSIndJ2=2;
    maxSS=0;
    
    OWIndR=1;
    OWIndJ1=2;
    OWIndJ2=2;
    maxOW=0;
    
    SWIndR=1;
    SWIndJ1=2;
    SWIndJ2=2;
    maxSW=0;
    
    OSKJIndR=1;
    OSKJIndJ1=2;
    OSKJIndJ2=2;
    maxOSKJ=0;
    
    %=========================
    
    % relay selection
    
    for indR=1:8
        for indJ1=1:8
            if indJ1==indR
                continue;
            end
            for indJ2=1:8
                if indJ2==indR
                    continue;
                end
            DJ1R=abs(XJ1(indJ1)-XR(indR));
            SigmaJ1R=DJ1R^(-3);
            alpha2=PS/(f_RS1(indf)*SigmaRS1(indR)*PS+f_RS2(indf)*SigmaRS2(indR)*PS+f_J1R(indf)*SigmaJ1R*PJ);    
            
            WJ_alpha2=PS/(f_RS1(indf)*SigmaRS1(indR)*PS+f_RS2(indf)*SigmaRS2(indR)*PS);   
            
            WJ_gama_S1S2=WJ_alpha2*PS*SigmaRS1(indR)*SigmaRS2(indR)*f_S1R(indf)*f_RS2(indf);
            WJ_gama_S2S1=WJ_alpha2*PS*SigmaRS2(indR)*SigmaRS1(indR)*f_S2R(indf)*f_RS1(indf);
            WJ_gama_RS1=WJ_alpha2*SigmaRS1(indR)*f_RS1(indf);
            WJ_gama_RS2=WJ_alpha2*SigmaRS2(indR)*f_RS2(indf);
            WJ_gama_RE=WJ_alpha2*SigmaRE(indR)*f_RE(indf);
            WJ_gama_S1RE=WJ_alpha2*PS*SigmaS1R(indR)*SigmaRE(indR)*f_RE(indf)*f_S1R(indf);
            WJ_gama_S2RE=WJ_alpha2*PS*SigmaS2R(indR)*SigmaRE(indR)*f_RE(indf)*f_S2R(indf);
            EWJ_gama_RE=WJ_alpha2*SigmaRE(indR);
            EWJ_gama_S1RE=WJ_alpha2*PS*SigmaS1R(indR)*SigmaRE(indR);
            EWJ_gama_S2RE=WJ_alpha2*PS*SigmaS2R(indR)*SigmaRE(indR);

            gama_S1S2=alpha2*PS*SigmaRS1(indR)*SigmaRS2(indR)*f_S1R(indf)*f_RS2(indf);
            gama_S2S1=alpha2*PS*SigmaRS2(indR)*SigmaRS1(indR)*f_RS1(indf)*f_S2R(indf);
            gama_J1S1=alpha2*PJ*SigmaJ1R*SigmaRS1(indR)*f_J1R(indf)*f_RS1(indf);
            gama_J1S2=alpha2*PJ*SigmaJ1R*SigmaRS2(indR)*f_J1R(indf)*f_RS2(indf);
            gama_J2S1=PJ*SigmaJ2S1(indJ2)*f_J2S1(indf);
            gama_J2S2=PJ*SigmaJ2S2(indJ2)*f_J2S2(indf);
            gama_RS1=alpha2*SigmaRS1(indR)*f_RS1(indf);
            gama_RS2=alpha2*SigmaRS2(indR)*f_RS2(indf);
            
            gama_S1E=PS*SigmaS1E*f_S1E(indf);
            gama_S2E=PS*SigmaS2E*f_S2E(indf);
            gama_J1E=PJ*SigmaJ1E(indJ1)*f_J1E(indf);
            gama_J2E=PJ*SigmaJ2E(indJ2)*f_J2E(indf);
            gama_RE=alpha2*SigmaRE(indR)*f_RE(indf);
            gama_S1RE=alpha2*PS*SigmaS1R(indR)*SigmaRE(indR)*f_S1R(indf)*f_RE(indf);
            gama_S2RE=alpha2*PS*SigmaS2R(indR)*SigmaRE(indR)*f_S2R(indf)*f_RE(indf);
            gama_J1RE=alpha2*PJ*SigmaJ1R*SigmaRE(indR)*f_J1R(indf)*f_RE(indf);
            
            E_gama_S1E=PS*SigmaS1E;
            E_gama_S2E=PS*SigmaS2E;
            E_gama_J1E=PJ*SigmaJ1E(indJ1);
            E_gama_J2E=PJ*SigmaJ2E(indJ2);
            E_gama_RE=alpha2*SigmaRE(indR);
            E_gama_S1RE=alpha2*PS*SigmaS1R(indR)*SigmaRE(indR);
            E_gama_S2RE=alpha2*PS*SigmaS2R(indR)*SigmaRE(indR);
            E_gama_J1RE=alpha2*PJ*SigmaJ1R*SigmaRE(indR);
            
            
            sinr_S1S2=gama_S1S2/(gama_J1S2+gama_J2S2+gama_RS2+1);
            sinr_S2S1=gama_S2S1/(gama_J1S1+gama_J2S1+gama_RS1+1);
            sinr_S1E=gama_S1E/(gama_S2E+gama_J1E+1)+gama_S1RE/(gama_S2RE+gama_J1RE+gama_J2E+gama_RE+1);
            sinr_S2E=gama_S2E/(gama_S1E+gama_J1E+1)+gama_S2RE/(gama_S1RE+gama_J1RE+gama_J2E+gama_RE+1);
            E_sinr_S1S2=gama_S1S2/(gama_J1S2+gama_J2S2+gama_RS2+1);
            E_sinr_S2S1=gama_S2S1/(gama_J1S1+gama_J2S1+gama_RS1+1);
            E_sinr_S1E=E_gama_S1E/(E_gama_S2E+E_gama_J1E)+E_gama_S1RE/(E_gama_S2RE+E_gama_J1RE+E_gama_J2E+E_gama_RE);
            E_sinr_S2E=E_gama_S2E/(E_gama_S1E+E_gama_J1E)+E_gama_S2RE/(E_gama_S1RE+E_gama_J1RE+E_gama_J2E+E_gama_RE);
            
            OS_sinr_1=(WJ_gama_S2S1)/(1+WJ_gama_RS1);
            OS_sinr_2=(WJ_gama_S1S2)/(1+WJ_gama_RS2);
            OS_sinr_E1=(gama_S1E)/(1+gama_S2E)+(WJ_gama_S1RE)/(1+WJ_gama_S2RE+WJ_gama_RE);
            OS_sinr_E2=(gama_S2E)/(1+gama_S1E)+(WJ_gama_S2RE)/(1+WJ_gama_S1RE+WJ_gama_RE);
            
            SS_sinr_1=(WJ_gama_S2S1)/(1+WJ_gama_RS1);
            SS_sinr_2=(WJ_gama_S1S2)/(1+WJ_gama_RS2);
            SS_sinr_E1=E_gama_S1E/(1+E_gama_S2E)+(EWJ_gama_S1RE)/(1+EWJ_gama_S2RE+EWJ_gama_RE);
            SS_sinr_E2=E_gama_S2E/(1+E_gama_S1E)+(EWJ_gama_S2RE)/(1+EWJ_gama_S1RE+EWJ_gama_RE);
            
            OSKJ_sinr_S1S2=gama_S1S2/(gama_RS2+1);
            OSKJ_sinr_S2S1=gama_S2S1/(gama_RS1+1);
            OSKJ_sinr_S1E=sinr_S1E;
            OSKJ_sinr_S2E=sinr_S2E;
            
            temp=(1+WJ_gama_S1S2)*(1+WJ_gama_S2S1)/(1+WJ_gama_RS2)/(1+WJ_gama_RS1);
            if temp>maxCS
                maxCS=temp;
                CSIndR=indR;
                
            end
            
            temp=(1+OS_sinr_1)*(1+OS_sinr_2)/(1+OS_sinr_E2)/(1+OS_sinr_E1);
            if temp>maxOS
                maxOS=temp;
                OSIndR=indR;
               
            end
            
            temp=(1+SS_sinr_1)*(1+SS_sinr_2)/(1+SS_sinr_E2)/(1+SS_sinr_E1);
            if temp>maxSS
                maxSS=temp;
                SSIndR=indR;
                
            end
            
            
           
            temp=(1+sinr_S1S2)*(1+sinr_S2S1)/(1+sinr_S1E)/(1+sinr_S2E);
            if temp>maxOMS
                maxOMS=temp;
                OMSIndR=indR;
                OMSIndJ1=indJ1;
                OMSIndJ2=indJ2;
            end
            
            temp1=[(1+sinr_S1S2)/(1+sinr_S1E),(1+sinr_S2S1)/(1+sinr_S2E)];
            temp2=min(temp1);
            if temp2>maxOMM
                maxOMM=temp2;
                OMMIndR=indR;
                OMMIndJ1=indJ1;
                OMMIndJ2=indJ2;
            end
            
            
            temp=(1+E_sinr_S1S2)*(1+E_sinr_S2S1)/(1+E_sinr_S1E)/(1+E_sinr_S2E);
            if temp>maxSMS
                maxSMS=temp;
                SMSIndR=indR;
                SMSIndJ1=indJ1;
                SMSIndJ2=indJ2;
            end
            
            temp1=[(1+E_sinr_S1S2)/(1+E_sinr_S1E),(1+E_sinr_S2S1)/(1+E_sinr_S2E)];
            temp2=min(temp1);
            if temp2>maxSMM
                maxSMM=temp2;
                SMMIndR=indR;
                SMMIndJ1=indJ1;
                SMMIndJ2=indJ2;
            end
            
            temp=(1+OSKJ_sinr_S1S2)*(1+OSKJ_sinr_S2S1)/(1+OSKJ_sinr_S1E)/(1+OSKJ_sinr_S2E);
            if temp>maxOSKJ
                maxOSKJ=temp;
                OSKJIndR=indR;
                OSKJIndJ1=indJ1;
                OSKJIndJ2=indJ2;
            end
            
            temp=(1+sinr_S1S2)*(1+sinr_S2S1)/(1+sinr_S1E)/(1+sinr_S2E);
            temp3=(1+OS_sinr_1)*(1+OS_sinr_2)/(1+OS_sinr_E2)/(1+OS_sinr_E1);
            if temp>temp3                
                if temp>maxOW
                maxOW=temp;
                OWIndR=indR;
                OWIndJ1=indJ1;
                OWIndJ2=indJ2;
                OW_flag=1;
                end
            else               
                if temp3>maxOW
                maxOW=temp3;
                OWIndR=indR;
                OWIndJ1=indJ1;
                OWIndJ2=indJ2;
                OW_flag=0;
                end                
            end
            
            temp=(1+E_sinr_S1S2)*(1+E_sinr_S2S1)/(1+E_sinr_S1E)/(1+E_sinr_S2E);
            temp3=(1+SS_sinr_1)*(1+SS_sinr_2)/(1+SS_sinr_E2)/(1+SS_sinr_E1);
            if temp>temp3                
                if temp>maxSW
                maxSW=temp;
                SWIndR=indR;
                SWIndJ1=indJ1;
                SWIndJ2=indJ2;
                SW_flag=1;
                end
            else               
                if temp3>maxSW
                maxSW=temp3;
                SWIndR=indR;
                SWIndJ1=indJ1;
                SWIndJ2=indJ2;
                SW_flag=0;
                end                
            end
                       
            end
        end
    end
    
    %====================================================
    
    %CS

    
    Alpha2=PS./(1+SigmaRS1(CSIndR)*PS*f_RS1(indf)+SigmaRS2(CSIndR)*PS*f_RS2(indf));    
    
    GamaS1S2=Alpha2.*PS.*SigmaS1R(CSIndR)*SigmaRS2(CSIndR).*f_S1R(indf).*f_RS2(indf);
    GamaS2S1=Alpha2.*PS.*SigmaS2R(CSIndR)*SigmaRS1(CSIndR).*f_S2R(indf).*f_RS1(indf);
    GamaRS1=Alpha2.*SigmaRS1(CSIndR).*f_RS1(indf);
    GamaRS2=Alpha2.*SigmaRS2(CSIndR).*f_RS2(indf);
    
    SINR_S1S2=GamaS1S2./(GamaRS2+1);
    SINR_S2S1=GamaS2S1./(GamaRS1+1);
    
    GamaS1E=PS*SigmaS1E.*f_S1E(indf);
    GamaS2E=PS*SigmaS2E.*f_S2E(indf);
    GamaS1RE=Alpha2.*PS*SigmaS1R(CSIndR)*SigmaRE(CSIndR).*f_S1R(indf).*f_RE(indf);
    GamaS2RE=Alpha2.*PS*SigmaS2R(CSIndR)*SigmaRE(CSIndR).*f_S2R(indf).*f_RE(indf);
    GamaRE=Alpha2.*SigmaRE(CSIndR).*f_RE(indf);
    
    SINR_S1E=GamaS1E./(GamaS2E+1)+GamaS1RE./(GamaS2RE+GamaRE+1);
    SINR_S2E=GamaS2E./(GamaS1E+1)+GamaS2RE./(GamaS1RE+GamaRE+1);
    
    CS_Cs1(indf)=0.5*log2(1+SINR_S2S1)-0.5*log2(1+SINR_S2E);
    CS_Cs2(indf)=0.5*log2(1+SINR_S1S2)-0.5*log2(1+SINR_S1E);
    JudgeCs=CS_Cs1(indf)>0;
    CS_Cs1(indf)=CS_Cs1(indf)*JudgeCs;
    JudgeCs=CS_Cs2(indf)>0;
    CS_Cs2(indf)=CS_Cs2(indf)*JudgeCs;
    
    CS_Cs(indf)=CS_Cs1(indf)+CS_Cs2(indf);
    
    
    %====================================================
    
    %OS

    
    Alpha2=PS./(1+SigmaRS1(OSIndR)*PS*f_RS1(indf)+SigmaRS2(OSIndR)*PS*f_RS2(indf));    
    
    GamaS1S2=Alpha2.*PS.*SigmaS1R(OSIndR)*SigmaRS2(OSIndR).*f_S1R(indf).*f_RS2(indf);
    GamaS2S1=Alpha2.*PS.*SigmaS2R(OSIndR)*SigmaRS1(OSIndR).*f_S2R(indf).*f_RS1(indf);
    GamaRS1=Alpha2.*SigmaRS1(OSIndR).*f_RS1(indf);
    GamaRS2=Alpha2.*SigmaRS2(OSIndR).*f_RS2(indf);
    
    SINR_S1S2=GamaS1S2./(GamaRS2+1);
    SINR_S2S1=GamaS2S1./(GamaRS1+1);
    
    GamaS1E=PS*SigmaS1E.*f_S1E(indf);
    GamaS2E=PS*SigmaS2E.*f_S2E(indf);
    GamaS1RE=Alpha2.*PS*SigmaS1R(OSIndR)*SigmaRE(OSIndR).*f_S1R(indf).*f_RE(indf);
    GamaS2RE=Alpha2.*PS*SigmaS2R(OSIndR)*SigmaRE(OSIndR).*f_S2R(indf).*f_RE(indf);
    GamaRE=Alpha2.*SigmaRE(OSIndR).*f_RE(indf);
    
    SINR_S1E=GamaS1E./(GamaS2E+1)+GamaS1RE./(GamaS2RE+GamaRE+1);
    SINR_S2E=GamaS2E./(GamaS1E+1)+GamaS2RE./(GamaS1RE+GamaRE+1);
    
    OS_Cs1(indf)=0.5*log2(1+SINR_S2S1)-0.5*log2(1+SINR_S2E);
    OS_Cs2(indf)=0.5*log2(1+SINR_S1S2)-0.5*log2(1+SINR_S1E);
    JudgeCs=OS_Cs1(indf)>0;
    OS_Cs1(indf)=OS_Cs1(indf)*JudgeCs;
    JudgeCs=OS_Cs2(indf)>0;
    OS_Cs2(indf)=OS_Cs2(indf)*JudgeCs;
    
    OS_Cs(indf)=OS_Cs1(indf)+OS_Cs2(indf);  
    %====================================================
    
    %SS

    
    Alpha2=PS./(1+SigmaRS1(SSIndR)*PS*f_RS1(indf)+SigmaRS2(SSIndR)*PS*f_RS2(indf));    
    
    GamaS1S2=Alpha2.*PS.*SigmaS1R(SSIndR)*SigmaRS2(SSIndR).*f_S1R(indf).*f_RS2(indf);
    GamaS2S1=Alpha2.*PS.*SigmaS2R(SSIndR)*SigmaRS1(SSIndR).*f_S2R(indf).*f_RS1(indf);
    GamaRS1=Alpha2.*SigmaRS1(SSIndR).*f_RS1(indf);
    GamaRS2=Alpha2.*SigmaRS2(SSIndR).*f_RS2(indf);
    
    SINR_S1S2=GamaS1S2./(GamaRS2+1);
    SINR_S2S1=GamaS2S1./(GamaRS1+1);
    
    GamaS1E=PS*SigmaS1E.*f_S1E(indf);
    GamaS2E=PS*SigmaS2E.*f_S2E(indf);
    GamaS1RE=Alpha2.*PS*SigmaS1R(SSIndR)*SigmaRE(SSIndR).*f_S1R(indf).*f_RE(indf);
    GamaS2RE=Alpha2.*PS*SigmaS2R(SSIndR)*SigmaRE(SSIndR).*f_S2R(indf).*f_RE(indf);
    GamaRE=Alpha2.*SigmaRE(SSIndR).*f_RE(indf);
    
    SINR_S1E=GamaS1E./(GamaS2E+1)+GamaS1RE./(GamaS2RE+GamaRE+1);
    SINR_S2E=GamaS2E./(GamaS1E+1)+GamaS2RE./(GamaS1RE+GamaRE+1);
    
    SS_Cs1(indf)=0.5*log2(1+SINR_S2S1)-0.5*log2(1+SINR_S2E);
    SS_Cs2(indf)=0.5*log2(1+SINR_S1S2)-0.5*log2(1+SINR_S1E);
    JudgeCs=SS_Cs1(indf)>0;
    SS_Cs1(indf)=SS_Cs1(indf)*JudgeCs;
    JudgeCs=SS_Cs2(indf)>0;
    SS_Cs2(indf)=SS_Cs2(indf)*JudgeCs;
    
    SS_Cs(indf)=SS_Cs1(indf)+SS_Cs2(indf);
    %====================================================
    
    %OMS

    DJ1R=abs(XJ1(OMSIndJ1)-XR(OMSIndR));
    SigmaJ1R=DJ1R^(-3);
    Alpha2=PS./(1+SigmaRS1(OMSIndR)*PS*f_RS1(indf)+SigmaRS2(OMSIndR)*PS*f_RS2(indf)+SigmaJ1R*PJ*f_J1R(indf));    
    
    GamaS1S2=Alpha2.*PS.*SigmaS1R(OMSIndR)*SigmaRS2(OMSIndR).*f_S1R(indf).*f_RS2(indf);
    GamaS2S1=Alpha2.*PS.*SigmaS2R(OMSIndR)*SigmaRS1(OMSIndR).*f_S2R(indf).*f_RS1(indf);
    GamaJ1S1=Alpha2.*PJ*SigmaJ1R*SigmaRS1(OMSIndR).*f_J1R(indf).*f_RS1(indf);
    GamaJ1S2=Alpha2.*PJ*SigmaJ1R*SigmaRS2(OMSIndR).*f_J1R(indf).*f_RS2(indf);
    GamaJ2S1=PJ*SigmaJ2S1(OMSIndJ2).*f_J2S1(indf);
    GamaJ2S2=PJ*SigmaJ2S2(OMSIndJ2).*f_J2S2(indf);    
    GamaRS1=Alpha2.*SigmaRS1(OMSIndR).*f_RS1(indf);
    GamaRS2=Alpha2.*SigmaRS2(OMSIndR).*f_RS2(indf);
    
    
    
    SINR_S1S2=GamaS1S2./(GamaJ1S2+GamaJ2S2+GamaRS2+1);
    SINR_S2S1=GamaS2S1./(GamaJ1S1+GamaJ2S1+GamaRS1+1);
    
    GamaS1E=PS*SigmaS1E.*f_S1E(indf);
    GamaS2E=PS*SigmaS2E.*f_S2E(indf);
    GamaJ1E=PJ*SigmaJ1E(OMSIndJ1).*f_J1E(indf);
    GamaJ2E=PJ*SigmaJ2E(OMSIndJ2).*f_J2E(indf);
    GamaS1RE=Alpha2.*PS*SigmaS1R(OMSIndR)*SigmaRE(OMSIndR).*f_S1R(indf).*f_RE(indf);
    GamaS2RE=Alpha2.*PS*SigmaS2R(OMSIndR)*SigmaRE(OMSIndR).*f_S2R(indf).*f_RE(indf);
    GamaJ1RE=Alpha2.*PJ*SigmaJ1R*SigmaRE(OMSIndR).*f_J1R(indf).*f_RE(indf);    
    GamaRE=Alpha2.*SigmaRE(OMSIndR).*f_RE(indf);
    
    SINR_S1E=GamaS1E./(GamaS2E+GamaJ1E+1)+GamaS1RE./(GamaS2RE+GamaJ1RE+GamaJ2E+GamaRE+1);
    SINR_S2E=GamaS2E./(GamaS1E+GamaJ1E+1)+GamaS2RE./(GamaS1RE+GamaJ1RE+GamaJ2E+GamaRE+1);
    
    OMS_Cs1(indf)=0.5*log2(1+SINR_S2S1)-0.5*log2(1+SINR_S2E);
    OMS_Cs2(indf)=0.5*log2(1+SINR_S1S2)-0.5*log2(1+SINR_S1E);
    JudgeCs=OMS_Cs1(indf)>0;
    OMS_Cs1(indf)=OMS_Cs1(indf)*JudgeCs;
    JudgeCs=OMS_Cs2(indf)>0;
    OMS_Cs2(indf)=OMS_Cs2(indf)*JudgeCs;
    
    OMS_Cs(indf)=OMS_Cs1(indf)+OMS_Cs2(indf);
    %=====================================================================
    
    %OMM
    
    DJ1R=abs(XJ1(OMMIndJ1)-XR(OMMIndR));
    SigmaJ1R=DJ1R^(-3);
    Alpha2=PS./(1+SigmaRS1(OMMIndR)*PS*f_RS1(indf)+SigmaRS2(OMMIndR)*PS*f_RS2(indf)+SigmaJ1R*PJ*f_J1R(indf));    
    
    GamaS1S2=Alpha2.*PS.*SigmaS1R(OMMIndR)*SigmaRS2(OMMIndR).*f_S1R(indf).*f_RS2(indf);
    GamaS2S1=Alpha2.*PS.*SigmaS2R(OMMIndR)*SigmaRS1(OMMIndR).*f_S2R(indf).*f_RS1(indf);
    GamaJ1S1=Alpha2.*PJ*SigmaJ1R*SigmaRS1(OMMIndR).*f_J1R(indf).*f_RS1(indf);
    GamaJ1S2=Alpha2.*PJ*SigmaJ1R*SigmaRS2(OMMIndR).*f_J1R(indf).*f_RS2(indf);
    GamaJ2S1=PJ*SigmaJ2S1(OMMIndJ2).*f_J2S1(indf);
    GamaJ2S2=PJ*SigmaJ2S2(OMMIndJ2).*f_J2S2(indf);
    GamaRS1=Alpha2.*SigmaRS1(OMMIndR).*f_RS1(indf);
    GamaRS2=Alpha2.*SigmaRS2(OMMIndR).*f_RS2(indf);
    
    
    
    SINR_S1S2=GamaS1S2./(GamaJ1S2+GamaJ2S2+GamaRS2+1);
    SINR_S2S1=GamaS2S1./(GamaJ1S1+GamaJ2S1+GamaRS1+1);
    
    GamaS1E=PS*SigmaS1E.*f_S1E(indf);
    GamaS2E=PS*SigmaS2E.*f_S2E(indf);
    GamaJ1E=PJ*SigmaJ1E(OMMIndJ1).*f_J1E(indf);
    GamaJ2E=PJ*SigmaJ2E(OMMIndJ2).*f_J2E(indf);
    GamaS1RE=Alpha2.*PS*SigmaS1R(OMMIndR)*SigmaRE(OMMIndR).*f_S1R(indf).*f_RE(indf);
    GamaS2RE=Alpha2.*PS*SigmaS2R(OMMIndR)*SigmaRE(OMMIndR).*f_S2R(indf).*f_RE(indf);
    GamaJ1RE=Alpha2.*PJ*SigmaJ1R*SigmaRE(OMMIndR)*f_J1R(indf).*f_RE(indf);    
    GamaRE=Alpha2.*SigmaRE(OMMIndR).*f_RE(indf);
    
    SINR_S1E=GamaS1E./(GamaS2E+GamaJ1E+1)+GamaS1RE./(GamaS2RE+GamaJ1RE+GamaJ2E+GamaRE+1);
    SINR_S2E=GamaS2E./(GamaS1E+GamaJ1E+1)+GamaS2RE./(GamaS1RE+GamaJ1RE+GamaJ2E+GamaRE+1);
    
    OMM_Cs1(indf)=0.5*log2(1+SINR_S2S1)-0.5*log2(1+SINR_S2E);
    OMM_Cs2(indf)=0.5*log2(1+SINR_S1S2)-0.5*log2(1+SINR_S1E);
    JudgeCs=OMM_Cs1(indf)>0;
    OMM_Cs1(indf)=OMM_Cs1(indf)*JudgeCs;
    JudgeCs=OMM_Cs2(indf)>0;
    OMM_Cs2(indf)=OMM_Cs2(indf)*JudgeCs;
        
    OMM_Cs(indf)=OMM_Cs1(indf)+OMM_Cs2(indf);
    %====================================================
    
    %SMS

    DJ1R=abs(XJ1(SMSIndJ1)-XR(SMSIndR));
    SigmaJ1R=DJ1R^(-3);
    Alpha2=PS./(1+SigmaRS1(SMSIndR)*PS*f_RS1(indf)+SigmaRS2(SMSIndR)*PS*f_RS2(indf)+SigmaJ1R*PJ*f_J1R(indf));    
    
    GamaS1S2=Alpha2.*PS.*SigmaS1R(SMSIndR)*SigmaRS2(SMSIndR).*f_S1R(indf).*f_RS2(indf);
    GamaS2S1=Alpha2.*PS.*SigmaS2R(SMSIndR)*SigmaRS1(SMSIndR).*f_S2R(indf).*f_RS1(indf);
    GamaJ1S1=Alpha2.*PJ*SigmaJ1R*SigmaRS1(SMSIndR).*f_J1R(indf).*f_RS1(indf);
    GamaJ1S2=Alpha2.*PJ*SigmaJ1R*SigmaRS2(SMSIndR).*f_J1R(indf).*f_RS2(indf);
    GamaJ2S1=PJ*SigmaJ2S1(SMSIndJ2).*f_J2S1(indf);
    GamaJ2S2=PJ*SigmaJ2S2(SMSIndJ2).*f_J2S2(indf);
    GamaRS1=Alpha2.*SigmaRS1(SMSIndR).*f_RS1(indf);
    GamaRS2=Alpha2.*SigmaRS2(SMSIndR).*f_RS2(indf);
    
    
    
    SINR_S1S2=GamaS1S2./(GamaJ1S2+GamaJ2S2+GamaRS2+1);
    SINR_S2S1=GamaS2S1./(GamaJ1S1+GamaJ2S1+GamaRS1+1);
    
    GamaS1E=PS*SigmaS1E*f_S1E(indf);
    GamaS2E=PS*SigmaS2E*f_S2E(indf);
    GamaJ1E=PJ*SigmaJ1E(SMSIndJ1)*f_J1E(indf);
    GamaJ2E=PJ*SigmaJ2E(SMSIndJ2)*f_J2E(indf);
    GamaS1RE=Alpha2.*PS*SigmaS1R(SMSIndR)*SigmaRE(SMSIndR).*f_S1R(indf).*f_RE(indf);
    GamaS2RE=Alpha2.*PS*SigmaS2R(SMSIndR)*SigmaRE(SMSIndR).*f_S2R(indf).*f_RE(indf);
    GamaJ1RE=Alpha2.*PJ*SigmaJ1R*SigmaRE(SMSIndR)*f_J1R(indf).*f_RE(indf);    
    GamaRE=Alpha2.*SigmaRE(SMSIndR).*f_RE(indf);
    
    SINR_S1E=GamaS1E./(GamaS2E+GamaJ1E+1)+GamaS1RE./(GamaS2RE+GamaJ1RE+GamaJ2E+GamaRE+1);
    SINR_S2E=GamaS2E./(GamaS1E+GamaJ1E+1)+GamaS2RE./(GamaS1RE+GamaJ1RE+GamaJ2E+GamaRE+1);
    
    SMS_Cs1(indf)=0.5*log2(1+SINR_S2S1)-0.5*log2(1+SINR_S2E);
    SMS_Cs2(indf)=0.5*log2(1+SINR_S1S2)-0.5*log2(1+SINR_S1E);
    JudgeCs=SMS_Cs1(indf)>0;
    SMS_Cs1(indf)=SMS_Cs1(indf)*JudgeCs;
    JudgeCs=SMS_Cs2(indf)>0;
    SMS_Cs2(indf)=SMS_Cs2(indf)*JudgeCs;
        
    SMS_Cs(indf)=SMS_Cs1(indf)+SMS_Cs2(indf);
   
    %=====================================================================
    
    %SMM
    
    DJ1R=abs(XJ1(SMMIndJ1)-XR(SMMIndR));
    SigmaJ1R=DJ1R^(-3);
    Alpha2=PS./(1+SigmaRS1(SMMIndR)*PS*f_RS1(indf)+SigmaRS2(SMMIndR)*PS*f_RS2(indf)+SigmaJ1R*PJ*f_J1R(indf));    
    
    GamaS1S2=Alpha2.*PS.*SigmaS1R(SMMIndR)*SigmaRS2(SMMIndR).*f_S1R(indf).*f_RS2(indf);
    GamaS2S1=Alpha2.*PS.*SigmaS2R(SMMIndR)*SigmaRS1(SMMIndR).*f_S2R(indf).*f_RS1(indf);
    GamaJ1S1=Alpha2.*PJ*SigmaJ1R*SigmaRS1(SMMIndR).*f_J1R(indf).*f_RS1(indf);
    GamaJ1S2=Alpha2.*PJ*SigmaJ1R*SigmaRS2(SMMIndR).*f_J1R(indf).*f_RS2(indf);
    GamaJ2S1=PJ*SigmaJ2S1(SMMIndJ2).*f_J2S1(indf);
    GamaJ2S2=PJ*SigmaJ2S2(SMMIndJ2).*f_J2S2(indf);
    GamaRS1=Alpha2.*SigmaRS1(SMMIndR).*f_RS1(indf);
    GamaRS2=Alpha2.*SigmaRS2(SMMIndR).*f_RS2(indf);
    
    
    
    SINR_S1S2=GamaS1S2./(GamaJ1S2+GamaJ2S2+GamaRS2+1);
    SINR_S2S1=GamaS2S1./(GamaJ1S1+GamaJ2S1+GamaRS1+1);
    
    GamaS1E=PS*SigmaS1E*f_S1E(indf);
    GamaS2E=PS*SigmaS2E*f_S2E(indf);
    GamaJ1E=PJ*SigmaJ1E(SMMIndJ1)*f_J1E(indf);
    GamaJ2E=PJ*SigmaJ2E(SMMIndJ2)*f_J2E(indf);
    GamaS1RE=Alpha2.*PS*SigmaS1R(SMMIndR)*SigmaRE(SMMIndR).*f_S1R(indf).*f_RE(indf);
    GamaS2RE=Alpha2.*PS*SigmaS2R(SMMIndR)*SigmaRE(SMMIndR).*f_S2R(indf).*f_RE(indf);
    GamaJ1RE=Alpha2.*PJ*SigmaJ1R*SigmaRE(SMMIndR)*f_J1R(indf).*f_RE(indf);      
    GamaRE=Alpha2.*SigmaRE(SMMIndR).*f_RE(indf);
    
    SINR_S1E=GamaS1E./(GamaS2E+GamaJ1E+1)+GamaS1RE./(GamaS2RE+GamaJ1RE+GamaJ2E+GamaRE+1);
    SINR_S2E=GamaS2E./(GamaS1E+GamaJ1E+1)+GamaS2RE./(GamaS1RE+GamaJ1RE+GamaJ2E+GamaRE+1);
    
    SMM_Cs1(indf)=0.5*log2(1+SINR_S2S1)-0.5*log2(1+SINR_S2E);
    SMM_Cs2(indf)=0.5*log2(1+SINR_S1S2)-0.5*log2(1+SINR_S1E);
    JudgeCs=SMM_Cs1(indf)>0;
    SMM_Cs1(indf)=SMM_Cs1(indf)*JudgeCs;
    JudgeCs=SMM_Cs2(indf)>0;
    SMM_Cs2(indf)=SMM_Cs2(indf)*JudgeCs;
        
    SMM_Cs(indf)=SMM_Cs1(indf)+SMM_Cs2(indf);
    %=====================================================================
    
    %OSKJ
    
    DJ1R=abs(XJ1(OSKJIndJ1)-XR(OSKJIndR));
    SigmaJ1R=DJ1R^(-3);
    Alpha2=PS./(1+SigmaRS1(OSKJIndR)*PS*f_RS1(indf)+SigmaRS2(OSKJIndR)*PS*f_RS2(indf)+SigmaJ1R*PJ*f_J1R(indf));    
    
    GamaS1S2=Alpha2.*PS.*SigmaS1R(OSKJIndR)*SigmaRS2(OSKJIndR).*f_S1R(indf).*f_RS2(indf);
    GamaS2S1=Alpha2.*PS.*SigmaS2R(OSKJIndR)*SigmaRS1(OSKJIndR).*f_S2R(indf).*f_RS1(indf);
   
    GamaRS1=Alpha2.*SigmaRS1(OSKJIndR).*f_RS1(indf);
    GamaRS2=Alpha2.*SigmaRS2(OSKJIndR).*f_RS2(indf);
    
    
    
    SINR_S1S2=GamaS1S2./(GamaRS2+1);
    SINR_S2S1=GamaS2S1./(GamaRS1+1);
    
    GamaS1E=PS*SigmaS1E.*f_S1E(indf);
    GamaS2E=PS*SigmaS2E.*f_S2E(indf);
    GamaJ1E=PJ*SigmaJ1E(OSKJIndJ1).*f_J1E(indf);
    GamaJ2E=PJ*SigmaJ2E(OSKJIndJ2).*f_J2E(indf);
    GamaS1RE=Alpha2.*PS*SigmaS1R(OSKJIndR)*SigmaRE(OSKJIndR).*f_S1R(indf).*f_RE(indf);
    GamaS2RE=Alpha2.*PS*SigmaS2R(OSKJIndR)*SigmaRE(OSKJIndR).*f_S2R(indf).*f_RE(indf);
    GamaJ1RE=Alpha2.*PJ*SigmaJ1R*SigmaRE(OSKJIndR).*f_J1R(indf).*f_RE(indf);    
    GamaRE=Alpha2.*SigmaRE(OSKJIndR).*f_RE(indf);
    
    SINR_S1E=GamaS1E./(GamaS2E+GamaJ1E+1)+GamaS1RE./(GamaS2RE+GamaJ1RE+GamaJ2E+GamaRE+1);
    SINR_S2E=GamaS2E./(GamaS1E+GamaJ1E+1)+GamaS2RE./(GamaS1RE+GamaJ1RE+GamaJ2E+GamaRE+1);
    
    OSKJ_Cs1(indf)=0.5*log2(1+SINR_S2S1)-0.5*log2(1+SINR_S2E);
    OSKJ_Cs2(indf)=0.5*log2(1+SINR_S1S2)-0.5*log2(1+SINR_S1E);
    JudgeCs=OSKJ_Cs1(indf)>0;
    OSKJ_Cs1(indf)=OSKJ_Cs1(indf)*JudgeCs;
    JudgeCs=OSKJ_Cs2(indf)>0;
    OSKJ_Cs2(indf)=OSKJ_Cs2(indf)*JudgeCs;
        
    OSKJ_Cs(indf)=OSKJ_Cs1(indf)+OSKJ_Cs2(indf);
    %====================================================
    
    %OW
    
    DJ1R=abs(XJ1(OWIndJ1)-XR(OWIndR));
    SigmaJ1R=DJ1R^(-3);
    Alpha2=PS./(1+SigmaRS1(OWIndR)*PS*f_RS1(indf)+SigmaRS2(OWIndR)*PS*f_RS2(indf)+SigmaJ1R*PJ*f_J1R(indf));    
    
    if OW_flag==1
        GamaS1S2=Alpha2.*PS.*SigmaS1R(OWIndR)*SigmaRS2(OWIndR).*f_S1R(indf).*f_RS2(indf);
        GamaS2S1=Alpha2.*PS.*SigmaS2R(OWIndR)*SigmaRS1(OWIndR).*f_S2R(indf).*f_RS1(indf);
        GamaJ1S1=Alpha2.*PJ*SigmaJ1R*SigmaRS1(OWIndR).*f_J1R(indf).*f_RS1(indf);
        GamaJ1S2=Alpha2.*PJ*SigmaJ1R*SigmaRS2(OWIndR).*f_J1R(indf).*f_RS2(indf);
        GamaJ2S1=PJ*SigmaJ2S1(OWIndJ2).*f_J2S1(indf);
        GamaJ2S2=PJ*SigmaJ2S2(OWIndJ2).*f_J2S2(indf);
        GamaRS1=Alpha2.*SigmaRS1(OWIndR).*f_RS1(indf);
        GamaRS2=Alpha2.*SigmaRS2(OWIndR).*f_RS2(indf);
    
        SINR_S1S2=GamaS1S2./(GamaJ1S2+GamaJ2S2+GamaRS2+1);
        SINR_S2S1=GamaS2S1./(GamaJ1S1+GamaJ2S1+GamaRS1+1);
    
        GamaS1E=PS*SigmaS1E.*f_S1E(indf);
        GamaS2E=PS*SigmaS2E.*f_S2E(indf);
        GamaJ1E=PJ*SigmaJ1E(OWIndJ1).*f_J1E(indf);
        GamaJ2E=PJ*SigmaJ2E(OWIndJ2).*f_J2E(indf);
        GamaS1RE=Alpha2.*PS*SigmaS1R(OWIndR)*SigmaRE(OWIndR).*f_S1R(indf).*f_RE(indf);
        GamaS2RE=Alpha2.*PS*SigmaS2R(OWIndR)*SigmaRE(OWIndR).*f_S2R(indf).*f_RE(indf);
        GamaJ1RE=Alpha2.*PJ*SigmaJ1R*SigmaRE(OWIndR).*f_J1R(indf).*f_RE(indf);    
        GamaRE=Alpha2.*SigmaRE(OWIndR).*f_RE(indf);
    
        SINR_S1E=GamaS1E./(GamaS2E+GamaJ1E+1)+GamaS1RE./(GamaS2RE+GamaJ1RE+GamaJ2E+GamaRE+1);
        SINR_S2E=GamaS2E./(GamaS1E+GamaJ1E+1)+GamaS2RE./(GamaS1RE+GamaJ1RE+GamaJ2E+GamaRE+1);
    
        OW_Cs1(indf)=0.5*log2(1+SINR_S2S1)-0.5*log2(1+SINR_S2E);
        OW_Cs2(indf)=0.5*log2(1+SINR_S1S2)-0.5*log2(1+SINR_S1E);
        JudgeCs=OW_Cs1(indf)>0;
        OW_Cs1(indf)=OW_Cs1(indf)*JudgeCs;
        JudgeCs=OW_Cs2(indf)>0;
        OW_Cs2(indf)=OW_Cs2(indf)*JudgeCs;
    else
        GamaS1S2=Alpha2.*PS.*SigmaS1R(OWIndR)*SigmaRS2(OWIndR).*f_S1R(indf).*f_RS2(indf);
        GamaS2S1=Alpha2.*PS.*SigmaS2R(OWIndR)*SigmaRS1(OWIndR).*f_S2R(indf).*f_RS1(indf);        
        GamaRS1=Alpha2.*SigmaRS1(OWIndR).*f_RS1(indf);
        GamaRS2=Alpha2.*SigmaRS2(OWIndR).*f_RS2(indf);
      
        GamaS1E=PS*SigmaS1E.*f_S1E(indf);
        GamaS2E=PS*SigmaS2E.*f_S2E(indf);
        GamaS1RE=Alpha2.*PS*SigmaS1R(OWIndR)*SigmaRE(OWIndR).*f_S1R(indf).*f_RE(indf);
        GamaS2RE=Alpha2.*PS*SigmaS2R(OWIndR)*SigmaRE(OWIndR).*f_S2R(indf).*f_RE(indf);
        GamaRE=Alpha2.*SigmaRE(OWIndR).*f_RE(indf);
    
        SINR_S2S1=GamaS2S1/GamaRS1;
        SINR_S1S2=GamaS1S2/GamaRS2;
        SINR_S1E=GamaS1E/GamaS2E+GamaS1RE/(GamaS2RE+GamaRE);
        SINR_S2E=GamaS2E/GamaS1E+GamaS2RE/(GamaS1RE+GamaRE);
           
        OW_Cs1(indf)=0.5*log2(1+SINR_S2S1)-0.5*log2(1+SINR_S2E);
        OW_Cs2(indf)=0.5*log2(1+SINR_S1S2)-0.5*log2(1+SINR_S1E);
        JudgeCs=OW_Cs1(indf)>0;
        OW_Cs1(indf)=OW_Cs1(indf)*JudgeCs;
        JudgeCs=OW_Cs2(indf)>0;
        OW_Cs2(indf)=OW_Cs2(indf)*JudgeCs;
    end
        
    OW_Cs(indf)=OW_Cs1(indf)+OW_Cs2(indf);
    %====================================================
    %SW
    
    DJ1R=abs(XJ1(SWIndJ1)-XR(SWIndR));
    SigmaJ1R=DJ1R^(-3);
    Alpha2=PS./(1+SigmaRS1(SWIndR)*PS*f_RS1(indf)+SigmaRS2(SWIndR)*PS*f_RS2(indf)+SigmaJ1R*PJ*f_J1R(indf));    
    
    if SW_flag==1
        GamaS1S2=Alpha2.*PS.*SigmaS1R(SWIndR)*SigmaRS2(SWIndR).*f_S1R(indf).*f_RS2(indf);
        GamaS2S1=Alpha2.*PS.*SigmaS2R(SWIndR)*SigmaRS1(SWIndR).*f_S2R(indf).*f_RS1(indf);
        GamaJ1S1=Alpha2.*PJ*SigmaJ1R*SigmaRS1(SWIndR).*f_RS1(indf).*f_J1R(indf);
        GamaJ1S2=Alpha2.*PJ*SigmaJ1R*SigmaRS2(SWIndR).*f_RS2(indf).*f_J1R(indf);
        GamaJ2S1=PJ*SigmaJ2S1(SWIndJ2).*f_J2S1(indf);
        GamaJ2S2=PJ*SigmaJ2S2(SWIndJ2).*f_J2S2(indf);    
        GamaRS1=Alpha2.*SigmaRS1(SWIndR).*f_RS1(indf);
        GamaRS2=Alpha2.*SigmaRS2(SWIndR).*f_RS2(indf);
    
        SINR_S1S2=GamaS1S2./(GamaJ1S2+GamaJ2S2+GamaRS2+1);
        SINR_S2S1=GamaS2S1./(GamaJ1S1+GamaJ2S1+GamaRS1+1);
    
        GamaS1E=PS*SigmaS1E.*f_S1E(indf);
        GamaS2E=PS*SigmaS2E.*f_S2E(indf);
        GamaJ1E=PJ*SigmaJ1E(SWIndJ1).*f_J1E(indf);
        GamaJ2E=PJ*SigmaJ2E(SWIndJ2).*f_J2E(indf);
        GamaS1RE=Alpha2.*PS*SigmaS1R(SWIndR)*SigmaRE(SWIndR).*f_S1R(indf).*f_RE(indf);
        GamaS2RE=Alpha2.*PS*SigmaS2R(SWIndR)*SigmaRE(SWIndR).*f_S2R(indf).*f_RE(indf);
        GamaJ1RE=Alpha2.*PJ*SigmaJ1R*SigmaRE(SWIndR).*f_J1R(indf).*f_RE(indf);    
        GamaRE=Alpha2.*SigmaRE(SWIndR).*f_RE(indf);
    
        SINR_S1E=GamaS1E./(GamaS2E+GamaJ1E+1)+GamaS1RE./(GamaS2RE+GamaJ1RE+GamaJ2E+GamaRE+1);
        SINR_S2E=GamaS2E./(GamaS1E+GamaJ1E+1)+GamaS2RE./(GamaS1RE+GamaJ1RE+GamaJ2E+GamaRE+1);
    
        SW_Cs1(indf)=0.5*log2(1+SINR_S2S1)-0.5*log2(1+SINR_S2E);
        SW_Cs2(indf)=0.5*log2(1+SINR_S1S2)-0.5*log2(1+SINR_S1E);
        JudgeCs=SW_Cs1(indf)>0;
        SW_Cs1(indf)=SW_Cs1(indf)*JudgeCs;
        JudgeCs=SW_Cs2(indf)>0;
        SW_Cs2(indf)=SW_Cs2(indf)*JudgeCs;
    else
        GamaS1S2=Alpha2.*PS.*SigmaS1R(SWIndR)*SigmaRS2(SWIndR).*f_S1R(indf).*f_RS2(indf);
        GamaS2S1=Alpha2.*PS.*SigmaS2R(SWIndR)*SigmaRS1(SWIndR).*f_S2R(indf).*f_RS1(indf);        
        GamaRS1=Alpha2.*SigmaRS1(SWIndR).*f_RS1(indf);
        GamaRS2=Alpha2.*SigmaRS2(SWIndR).*f_RS2(indf);
      
        GamaS1E=PS*SigmaS1E.*f_S1E(indf);
        GamaS2E=PS*SigmaS2E.*f_S2E(indf);
        GamaS1RE=Alpha2.*PS*SigmaS1R(SWIndR)*SigmaRE(SWIndR).*f_S1R(indf).*f_RE(indf);
        GamaS2RE=Alpha2.*PS*SigmaS2R(SWIndR)*SigmaRE(SWIndR).*f_S2R(indf).*f_RE(indf);
        GamaRE=Alpha2.*SigmaRE(SWIndR).*f_RE(indf);
    
        SINR_S2S1=GamaS2S1/GamaRS1;
        SINR_S1S2=GamaS1S2/GamaRS2;
        SINR_S1E=GamaS1E/GamaS2E+GamaS1RE/(GamaS2RE+GamaRE);
        SINR_S2E=GamaS2E/GamaS1E+GamaS2RE/(GamaS1RE+GamaRE);
           
        SW_Cs1(indf)=0.5*log2(1+SINR_S2S1)-0.5*log2(1+SINR_S2E);
        SW_Cs2(indf)=0.5*log2(1+SINR_S1S2)-0.5*log2(1+SINR_S1E);
        JudgeCs=SW_Cs1(indf)>0;
        SW_Cs1(indf)=SW_Cs1(indf)*JudgeCs;
        JudgeCs=SW_Cs2(indf)>0;
        SW_Cs2(indf)=SW_Cs2(indf)*JudgeCs;
    end
        
    SW_Cs(indf)=SW_Cs1(indf)+SW_Cs2(indf);
    %====================================================
    
end
    T_SMS_Cs(testloop)=mean(SMS_Cs);
    T_OMS_Cs(testloop)=mean(OMS_Cs);
    T_SMM_Cs(testloop)=mean(SMM_Cs);
    T_OMM_Cs(testloop)=mean(OMM_Cs);
    T_SS_Cs(testloop)=mean(SS_Cs);
    T_CS_Cs(testloop)=mean(CS_Cs);
    T_OS_Cs(testloop)=mean(OS_Cs);
    T_OW_Cs(testloop)=mean(OW_Cs);
    T_SW_Cs(testloop)=mean(SW_Cs);
    T_OSKJ_Cs(testloop)=mean(OSKJ_Cs);
    
    

end
     E_SMS_Cs(m+1)=mean(T_SMS_Cs);
     E_OMS_Cs(m+1)=mean(T_OMS_Cs);
     E_SMM_Cs(m+1)=mean(T_SMM_Cs);
     E_OMM_Cs(m+1)=mean(T_OMM_Cs);
     E_SS_Cs(m+1)=mean(T_SS_Cs);
     E_CS_Cs(m+1)=mean(T_CS_Cs);
     E_OS_Cs(m+1)=mean(T_OS_Cs);
     E_OW_Cs(m+1)=mean(T_OW_Cs);
     E_SW_Cs(m+1)=mean(T_SW_Cs);
     E_OSKJ_Cs(m+1)=mean(T_OSKJ_Cs);
    
end

A_OS_Cs(PowerNum)=0;
A_OMS_Cs(PowerNum)=0;

for m=1:PowerNum
    A_OS_Cs(m)=E_OS_Cs(PowerNum)-(PowerNum-m)*TestStep*0.3322;
    A_OMS_Cs(m)=E_OMS_Cs(PowerNum);
    
end
 


x=0:TestStep:(PowerNum-1)*TestStep;

figure(2);
plot(x,E_CS_Cs,'y->');

hold on;
plot(x,E_OS_Cs,'m-<');

hold on;
plot(x,A_OS_Cs,'m--');

hold on;
plot(x,E_SS_Cs,'k-v');

hold on;
plot(x,E_OMS_Cs,'r-d');

hold on;
plot(x,A_OMS_Cs,'r--');

hold on;
plot(x,E_OMM_Cs,'b-s');

hold on;
plot(x,E_SMS_Cs,'c-x');

hold on;
plot(x,E_SMM_Cs,'g-p');

hold on;
plot(x,E_OW_Cs,'b-^');

hold on;
plot(x,E_SW_Cs,'r-o');

hold on;
plot(x,E_OSKJ_Cs,'g-*');



legend('CS','OS','OS(Asym. Aprox.)','SS','OMS','OMS(Asym. Aprox.)','OMM','SMS','SMM','OW','SW','OSKJ')
grid on;
box on;
