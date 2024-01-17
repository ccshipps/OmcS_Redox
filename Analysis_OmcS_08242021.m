clear;
clc;
close all;
%%

% P(1)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210803\210803_OmcS_Anaero_Anodic.mat');
% P(2)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210803\210803_OmcS_Anaero_Cathodic.mat');
% P(3)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210805\210805_OmcS_Anaero_Anodic_5min.mat');%5min
% P(4)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210805\210805_OmcS_Anaero_Cathodic_5min.mat');%5min
% P(5)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210824\210824_OmcS_Anaero_Anodic.mat');
% P(6)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210824\210824_OmcS_Anaero_Cathodic.mat');
% P(7)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210824\210824_OmcS_Anaero_Anodic2.mat');
% P(8)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210824\210824_OmcS_Anaero_Cathodic2.mat');
% P(9)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210826\210826_OmcS_Anaero_Anodic.mat');
% P(10)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210826\210826_OmcS_Anaero_Cathodic.mat');
% P(11)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210830\210830_OmcS_Anaero_Anodic.mat');%possible O2 & mixed old sample
% P(12)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210830\210830_OmcS_Anaero_Cathodic.mat');%possible O2& mixed old sample
% P(13)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210830\210830_OmcS_Anaero_Anodic2.mat');%possible O2& mixed old sample
% P(14)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210830\210830_OmcS_Anaero_Cathodic2.mat');%possible O2& mixed old sample
% P(15)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210903\210903_OmcS_Anaero_Anodic.mat');%O2 in chamber
% P(16)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210903\210903_OmcS_Anaero_Cathodic.mat');%O2 in chamber
P(17)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210923\210923_OmcS_Anaero_Anodic.mat');
P(18)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210923\210923_OmcS_Anaero_Cathodic.mat');
% P(19)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210923\210923_OmcS_Anaero_Anodic2.mat');%60s
% P(20)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210923\210923_OmcS_Anaero_Cathodic2.mat');%60s
% P(21)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220126\220126_OmcS_Anodic.mat');%120s
% P(22)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220126\220126_OmcS_Cathodic.');%120s
P(23)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220207\220207_OmcS_Anodic.mat');%120
P(24)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220207\220207_OmcS_Cathodic.mat');%120
% P(25)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220309\220309_OmcS_Anodic.mat');%120
% P(26)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220309\220309_OmcS_Cathodic.mat');%120
% P(27)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220309\220309_OmcS_Anodic_45.mat');%120
% P(28)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220309\220309_OmcS_Cathodic_45.mat');%120
P(29)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220413\220413_OmcS_Anodic.mat');%120
P(30)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220413\220413_OmcS_Cathodic.mat');%120

M=xlsread('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210826\Matthew_Data.xlsx');
%% O2 vs N2
N=length(P);
anodic =[17 23 29];%
cathodic =[18 24 30];%
n2=length(P);
names=["Anodic","Cathodic","Ano 05","Cat 05","Ano 24","Cat 24","Ano 24-2","Cat 24-2","Ano 26","Cat 26","Ano 30","Cat 30","Ano 30-2","Cat 30-2","Ano 3","Cat 3","Ano 23","Cat 23","Ano60 23","Cat60 23","Ano 26","Cat 26","Ano 07", "Cat 07","Ano 09","Cat 09","Ano 09_45","Cat 09_45","Ano_13","Cat_13"];
midpoints=zeros(1,n2);
figure(1)
for i=anodic
    
    hold on
    plot(P(i).V./1000,P(i).normOx,'-o')
    fit=ezfit(P(i).V./1000,P(i).normOx,'f(x)=exp((x-v0)*k)/(1+exp((x-v0)*k));v0=-0.35;k=8.7831');
    %showfit(fit);
    midpoints(i)=fit.m(2);
end

xlabel('Voltage (V) vs. Ag/AgCl');
ylabel('Oxidized Fraction');

for i=cathodic
     hold on
     plot(P(i).V./1000,P(i).normOx,'-*')
     fit=ezfit(P(i).V./1000,P(i).normOx,'f(x)=exp((x-v0)*k)/(1+exp((x-v0)*k));v0=-0.35;k=8.7831');
     %showfit(fit);
     %     midpoints=[midpoints fit.m(2)];
     midpoints(i)=fit.m(2);
end
mean(midpoints)
legend([names(anodic) names(cathodic)],'Location','northwest');
xlabel('Voltage (V) vs. Ag/AgCl');
ylabel('Oxidized Fraction');


%%
midpoints2=zeros(1,n2);
sixpoints1=[];
sixpoints2=[];
vlistmin=[];
vlistmax=[];
allyano=[];
allycat=[];
figure(2)
mrksz=7;
choicecurve=2;
choicefit=[];
choicedat=[];
choicenames=names([anodic(choicecurve) cathodic(choicecurve)]);
window=[];

for i=[anodic cathodic]
    even=~mod(i,2);
    if ~even
        y=flip(P(i).single);
        x=flip(P(i).V./1000);%V flipped in other program
        %color=[1 0 0];
        sym='--o';
    else
        y=P(i).single;
        x=P(i).V./1000;
        %color=[0 0 1];
        sym='--*';
    end
    %adjust to remove the -700 and -650 which can be off
    if i== 1 || i==2
        n=length(y);
        range=2:n;
        y=y(range);
        x=x(range);
    end
    
     if i== 3 || i==4
        n=length(y);
        range=1:n-1;
        y=y(range);
        x=x(range);
        
     end
      
    if i== 5 || i==6
        n=length(y);
        range=1:n-1;
        y=y(range);
        x=x(range);
        
    end
    
    if i== 7 || i==8
        n=length(y);
        range=1:n-1;
        y=y(range);
        x=x(range);
        
    end
    
    if i== 9 || i==10
        n=length(y);
        range=1:n-1;
        y=y(range);
        x=x(range);
    end
    
    if i== 11 || i==12
        n=length(y);
        range=1:n-1;
        y=y(range);
        x=x(range);
    end
    if i== 13 || i==14
        n=length(y);
        range=1:n-1;
        y=y(range);
        x=x(range);
    end
    if i== 15 || i==16
        n=length(y);
        range=1:n-1;
        y=y(range);
        x=x(range);
    end
    
     if i== 17 || i==18
        n=length(y);
        range=2:n-2;
        y=y(range);
        x=x(range);
        color=[0.4940 0.1840 0.5560];
     end
    
     if i== 19 || i==20
         n=length(y);
         range=2:n-2;
         y=y(range);
         x=x(range);
     end
     
      if i== 21 || i==22
         n=length(y);
         range=2:n-2;
         y=y(range);
         x=x(range);
     end
     
     if i== 23 || i==24
         n=length(y);
         range=2:n-2;
         y=y(range);
         x=x(range);
         color=[0.4660 0.6740 0.1880];
     end
     
     if i== 25 || i==26
         n=length(y);
         range=10:n;
         y=y(range);
         x=x(range);
         color='k';
     end
     
      if i== 27 || i==28
         n=length(y);
         range=1:n;
         y=y(range);
         x=x(range);
         color='k';
      end
      
      if i== 29 || i==30
          n=length(y);
          range=2:n-2;
          y=y(range);
          x=x(range);
          color='k';
      end
     
     [~,ida]=min(y);
     [~,idb]=max(y);
     y=y-y(ida);
     y=1-y./y(idb);
     
     vlistmax(i)=x(idb);
     vlistmin(i)=x(ida);
     
%     y=y-y(1);
%     y=1-y./y(end);
%     
   

    
    hold on
    plot(x,y,sym,'Color',color,'MarkerSize',mrksz,'MarkerFaceColor',color)
    
    fit=ezfit(x,y,'f(x)=exp((x-v0)*k)/(1+exp((x-v0)*k));v0=-0.35;k=8.7831');
    %fit=ezfit(x,y,'f(x)=exp((x-v0)*234)/(1+exp((x-v0)*234));v0=-0.35');
    %showfit(fit);
    %     midpoints2=[midpoints2 fit.m(2)];
    midpoints2(i)=fit.m(2);
    k(i)=fit.m(1);
    fit1=ezfit(x,y,'f(x)=(exp((x-v0)*39)/(1+exp((x-v0)*39))+(exp(39*(x-v1))/(exp(39*(x-v1))+1))+exp((x-v3)*39)/(1+exp((x-v3)*39))+(exp(39*(x-v4))/(exp(39*(x-v4))+1))+(exp(39*(x-v5))/(exp(39*(x-v5))+1))+(exp(39*(x-v6))/(exp(39*(x-v6))+1)))./6;v1=-0.3;v0=-0.3;v3=-0.3;v4=-0.3;v5=-0.3;v6=-0.3');
    ox='1-(6+5*exp((x-v1)*39)+4*exp((2*x-v1-v2)*39)+3*exp((3*x-v1-v2-v3)*39)+2*exp((4*x-v1-v2-v3-v4)*39)+exp((5*x-v1-v2-v3-v4-v5)*39))/(6*(1+exp((x-v1)*39)+exp((2*x-v1-v2)*39)+exp((3*x-v1-v2-v3)*39)+exp((4*x-v1-v2-v3-v4)*39)+exp((5*x-v1-v2-v3-v4-v5)*39)+exp((6*x-v1-v2-v3-v4-v5-v6)*39)));v1=-0.3;v2=-0.3;v3=-0.3;v4=-0.3;v5=-0.3;v6=-0.3';
    fit2=ezfit(x,y,ox);
    showfit(fit,'fitcolor',color);
  
    xlabel('Voltage (V) vs. Ag/AgCl');
    ylabel('Oxidized Fraction');

    vrange=-0.7:0.01:0;
    fitval=@(x,v0,v1,v3,v4,v5,v6) (exp((x-v0)*39)./(1+exp((x-v0)*39))+(exp(39*(x-v1))./(exp(39*(x-v1))+1))+exp((x-v3)*39)./(1+exp((x-v3)*39))+(exp(39*(x-v4))./(exp(39*(x-v4))+1))+(exp(39*(x-v5))./(exp(39*(x-v5))+1))+(exp(39*(x-v6))./(exp(39*(x-v6))+1)))./6;
    eval=fitval(vrange,fit1.m(1),fit1.m(2),fit1.m(3),fit1.m(4),fit1.m(5),fit1.m(6));
    [nope rnglow]=min(abs(eval-0.01));
    [nope rnghigh]=min(abs(eval-0.99));
    window=[window; vrange([rnglow rnghigh])];
    
    if i==anodic(choicecurve)
        choicefit.ano.sing=fit;
        choicefit.ano.indep=fit1;
        choicefit.ano.seq=fit2;
        choicedat.ano=[x',y'];
    elseif i==cathodic(choicecurve)
        choicefit.cat.sing=fit;
        choicefit.cat.indep=fit1;
        choicefit.cat.seq=fit2;
        choicedat.cat=[x',y'];

    end
     
     
     
    sixpoints1=[sixpoints1 transpose(fit1.m)];
    sixpoints2=[sixpoints2 transpose(fit2.m)];
    
    even=~mod(i,2);
    if ~even
        allyano=[allyano; y];
    else
        allycat=[allycat; y];
    end
    
    %legend([names(anodic(b)),'', names(cathodic(b)),''],'Location','northwest');
   
    
end
str={' * Cathodic',' o Anodic'};
annotation('textbox','String',str);
legend('off');
%% Report active window

activerange=mean(window)+0.2;



%% Save Best Curve for plotting

filenamechoice='OmcS_ChoiceCurve&Fit.mat';
save(filenamechoice,'choicedat','choicefit','choicenames');

%%
sixpoints1=sort(sixpoints1);
finalpoints1=sixpoints1+0.2;

sixpoints2=sort(sixpoints2);
finalpoints2=sixpoints2+0.2;
% 
% xlabel('Voltage (V) vs. Ag/AgCl');
% ylabel('Oxidized Fraction');
% legend([names(anodic) names(cathodic)],'Location','northwest');
figure(3)
plot(1:n2,midpoints,'*')
hold on
plot(1:n2,midpoints2,'o')

ymeanano=mean(allyano);
ysdano=std(allyano);

ymeancat=mean(allycat);
ysdcat=std(allycat);

figure(4)
plot(1:length(sixpoints1),sixpoints1,'or');
hold on;
plot(1:length(sixpoints2),sixpoints2,'*b');
%% Stats

meanind=mean(sixpoints1+0.2,2);
sdind=std(sixpoints1+0.2,0,2);
meanseq=mean(sixpoints2+0.2,2);
sdseq=std(sixpoints2+0.2,0,2);
%% Average Curves
figure()
shadedErrorBar(x+0.2,ymeanano,ysdano,'lineProps',{'*b'})
red='1-(6+5*exp((x-v1)*39)+4*exp((2*x-v1-v2)*39)+3*exp((3*x-v1-v2-v3)*39)+2*exp((4*x-v1-v2-v3-v4)*39)+exp((5*x-v1-v2-v3-v4-v5)*39))/(6*(1+exp((x-v1)*39)+exp((2*x-v1-v2)*39)+exp((3*x-v1-v2-v3)*39)+exp((4*x-v1-v2-v3-v4)*39)+exp((5*x-v1-v2-v3-v4-v5)*39)+exp((6*x-v1-v2-v3-v4-v5-v6)*39)));v1=-0.1;v2=-0.1;v3=-0.1;v4=-0.1;v5=-0.1;v6=-0.1';
fitano=ezfit(x+0.2,ymeanano,red);
showfit(fitano);
%showfit(fit);
hold on
%f=ezfit(x,ymeanano,'f(x)=(exp((x-v0)*39)/(1+exp((x-v0)*39))+(exp(39*(x-v1))/(exp(39*(x-v1))+1))+exp((x-v3)*39)/(1+exp((x-v3)*39))+(exp(39*(x-v4))/(exp(39*(x-v4))+1))+(exp(39*(x-v5))/(exp(39*(x-v5))+1))+(exp(39*(x-v6))/(exp(39*(x-v6))+1)))./6;v1=-0.3;v0=-0.3;v3=-0.3;v4=-0.3;v5=-0.3;v6=-0.3');
%showfit(f);
%figure()
hold on
shadedErrorBar(x+0.2,ymeancat,ysdcat,'lineProps',{'*r'})
fitcat=ezfit(x+0.2,ymeancat,red);
showfit(fitcat);
xlabel('Voltage (V) vs (SHE)');
ylabel('Oxidized Fraction');
% %%
% xE=mean(sixpoints+0.2,2);
% xC=flip(M(:,1));
% 
% xEsd=std(sixpoints+0.2,0,2)./sqrt(n2);
% xCsd=flip(M(:,2));
% 
% figure()
% for i=1:n2
%     hold on
%     circle(xE(i),xE(i),xEsd(i),[0,0,1,0.5])
%     hold on
%     circle(xC(i),xE(i),xCsd(i),[1,0,0,0.5])
%     
% end
% plot(xE,xE,'.')
% hold on
% plot(xC,xE,'o')
%% Bar graph with six potentials

% figure(); bar(1:6,mean(finalpoints2-0.2,2),'FaceColor','none')
% hold on; errorbar(1:6,mean(finalpoints2-0.2,2),std(finalpoints2-0.2,[],2),'Linestyle','none','Color','k')
%  hold on; plot(0:7,-0.33.*ones(1,8),':r','LineWidth',1)
% ylabel('Macroscopic Potential Fits (V) vs (Ag/AgCl)');
% xlim([0.5 6.5])
%% Sequential Model
% R=8.314;
% T=298;
% F=96485.33;
% c=F/(R*T);
% p0=1;
% p1=exp((x-v1)*c);
% p2=exp((2*x-v1-v2)*c);
% p3=exp((3*x-v1-v2-v3)*c);
% p4=exp((4*x-v1-v2-v3-v4)*c);
% p5=exp((5*x-v1-v2-v3-v4-v5)*c);
% p6=exp((6*x-v1-v2-v3-v4-v5-v6)*c);
% z=1+exp((x-v1)*c)+exp((2*x-v1-v2)*c)+exp((3*x-v1-v2-v3)*c)+exp((4*x-v1-v2-v3-v4)*c)+exp((5*x-v1-v2-v3-v4-v5)*c)+exp((6*x-v1-v2-v3-v4-v5-v6)*c);
%red='(6+5*exp((x-v1)*c)+4*exp((2*x-v1-v2)*c)+3*exp((3*x-v1-v2-v3)*c)+2*exp((4*x-v1-v2-v3-v4)*c)+exp((5*x-v1-v2-v3-v4-v5)*c))/(6*(1+exp((x-v1)*c)+exp((2*x-v1-v2)*c)+exp((3*x-v1-v2-v3)*c)+exp((4*x-v1-v2-v3-v4)*c)+exp((5*x-v1-v2-v3-v4-v5)*c)+exp((6*x-v1-v2-v3-v4-v5-v6)*c)))';

%independentnernst
ox2='f(x)=(exp((x-v0)*39)/(1+exp((x-v0)*39))+(exp(39*(x-v1))/(exp(39*(x-v1))+1))+exp((x-v3)*39)/(1+exp((x-v3)*39))+(exp(39*(x-v4))/(exp(39*(x-v4))+1))+(exp(39*(x-v5))/(exp(39*(x-v5))+1))+(exp(39*(x-v6))/(exp(39*(x-v6))+1)))./6;v1=-0.3;v0=-0.3;v3=-0.3;v4=-0.3;v5=-0.3;v6=-0.3';
singlefit='f(x)=exp((x-v0)*k)/(1+exp((x-v0)*k));v0=-0.35;k=8.7831';
%% Save Data Mat
filenamemat='OmcS_singlefit_specchem.mat';
save(filenamemat,'midpoints2');

%% Write data to excel
n1=length(anodic);
%Data
dateform='dd-mmm-yyyy';
dates=datestr(now,dateform);
TA=["Voltage (V)","T1A","T2A","T3A","T4A"];
filename=[dates '_OmcS_SpecchemData.xlsx'];
writematrix(TA,filename,'Sheet',1,'Range','A1','WriteMode','overwritesheet');
writematrix(transpose(x+0.2),filename,'Sheet',1,'Range','A2');
writematrix(transpose(allyano),filename,'Sheet',1,'Range','B2');
TC=["Voltage (V)","T1C","T2C","T3C","T4C"];
writematrix(TC,filename,'Sheet',1,'Range','G1');
writematrix(transpose(x+0.2),filename,'Sheet',1,'Range','G2');
writematrix(transpose(allycat),filename,'Sheet',1,'Range','H2');
% 6 Sequential Electron Transfer
T=["Sequential Electron Transfer Model",["Fiteq="+string(ox)]];
writematrix(T,filename,'Sheet',1,'Range','A24');
T=["V1";"V2";"V3";"V4";"V5";"V6"];
writematrix(T,filename,'Sheet',1,'Range','A25');
writematrix(finalpoints2(:,1:n1),filename,'Sheet',1,'Range','B25');
writematrix(T,filename,'Sheet',1,'Range','G25');
writematrix(finalpoints2(:,n1+1:end),filename,'Sheet',1,'Range','H25');
writematrix(["Sequential Macroscopic Average (V)", "Standard Deviation (V)"],filename,'Sheet',2,'Range','B1','WriteMode','overwritesheet');
writematrix(T,filename,'Sheet',2,'Range','A2');
writematrix(meanseq,filename,'Sheet',2,'Range','B2');
writematrix(sdseq,filename,'Sheet',2,'Range','C2');
% 6 Independent Nernstians
T=["Independent Nernstians Model",["Fiteq="+string(ox2)]];
writematrix(T,filename,'Sheet',1,'Range','A32');
T=["V1";"V2";"V3";"V4";"V5";"V6"];
writematrix(T,filename,'Sheet',1,'Range','A33');
writematrix(finalpoints1(:,1:n1),filename,'Sheet',1,'Range','B33');
writematrix(T,filename,'Sheet',1,'Range','G33');
writematrix(finalpoints1(:,n1+1:end),filename,'Sheet',1,'Range','H33');
writematrix(["Independent Macroscopic Average (V)", "Standard Deviation (V)"],filename,'Sheet',2,'Range','F1');
writematrix(T,filename,'Sheet',2,'Range','E2');
writematrix(meanind,filename,'Sheet',2,'Range','F2');
writematrix(sdind,filename,'Sheet',2,'Range','G2');
%SingleFits
T=["Single Midpoint Potential",["Fiteq="+string(singlefit)]];
writematrix(T,filename,'Sheet',1,'Range','A40');
T=["Vapp Anodic"];
writematrix(T,filename,'Sheet',1,'Range','A41');
writematrix(midpoints2(anodic)+0.2,filename,'Sheet',1,'Range','B41');
T=["Vapp Cathodic"];
writematrix(T,filename,'Sheet',1,'Range','G41');
writematrix(midpoints2(cathodic)+0.2,filename,'Sheet',1,'Range','H41');

T=["Midpoint"];
writematrix(["Single Midpoint Average (V)", "Standard Deviation (V)"],filename,'Sheet',2,'Range','J1');
writematrix(T,filename,'Sheet',2,'Range','I2');
writematrix(mean([midpoints2(anodic) midpoints2(cathodic)]+0.2),filename,'Sheet',2,'Range','J2');
writematrix(std([midpoints2(anodic) midpoints2(cathodic)]+0.2),filename,'Sheet',2,'Range','K2');

%Ano-Cat fits
T=["Anodic Average Fit N="+string(n1),["Fiteq="+string(ox)]];
writematrix(T,filename,'Sheet',1,'Range','A43');
T=["V1";"V2";"V3";"V4";"V5";"V6"];
writematrix(T,filename,'Sheet',1,'Range','A44');
writematrix(transpose(fitano.m),filename,'Sheet',1,'Range','B44');
%Cathodic mean fits
T=["Cathodic Average Fit N="+string(n1),["Fiteq="+string(ox)]];
writematrix(T,filename,'Sheet',1,'Range','G43');
T=["V1";"V2";"V3";"V4";"V5";"V6"];
writematrix(T,filename,'Sheet',1,'Range','G44');
writematrix(transpose(fitcat.m),filename,'Sheet',1,'Range','H44');

% Active Potential Range
T=[" Average Active Window from Independent Fits (V)" " " "Standard Deviation (V)"];
writematrix(T,filename,'Sheet',2,'Range','M1');
writematrix(mean(window+0.2),filename,'Sheet',2,'Range','M2');
writematrix(std(window+0.2),filename,'Sheet',2,'Range','O2');
