%% Load data
clear;
clc;
close all;
%% Specs (Can change with every file)

%Files for 03/21/2022
% 120s
filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220321\220321_Meds_Anodic.xlsx';
samplename='220321_Meds_Anodic';
start=duration('14:57:58');%End time of first applied voltage 
final=duration('15:38:11');%End time of last applied voltage 
V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
cat_ano=0;% Cathodic (1) or anodic (0) scanning
root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220321\';
spacer=120;%Time held on each voltage point (s)
%120s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220321\220321_Meds_Cathodic.xlsx';
% samplename='220321_Meds_Cathodic';
% start=duration('14:12:43');%End time of first applied voltage 
% final=duration('14:52:56');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220321\';
% spacer=120;%Time held on each voltage point (s)

N=length(V);


%% Read in file and assign data

% Read in table of spectra
opts=detectImportOptions(filename);
opts.DataRange='A6';
Data=readmatrix(filename,opts);
spectra=Data(:,2:end);
lambda=Data(:,1);

% Read in timestamps of saved spectra
opts.DataRange='5:5';
timestamps=readcell(filename,opts,'DatetimeType','text');
timestamps=timestamps(2:end);

% Convert timestamps to numbers that you can do math with
for i=1:length(timestamps)
    a=timestamps{i};
    timestamps{i}=a(end-7:end);
end
timestamps=duration(timestamps);

%% Specs
%The points signaling the start times and final end point of all voltages
%being applied (N+1)
%timepoints=final*ones(1,N)-flip(minutes(0:2:(N-1)*spacer));
timepoints=start*ones(1,N)+seconds(0:spacer+1:(N-1)*(spacer+1));
%%
%synch tells you the indices of the time points to get the spectra data
synch=zeros(1,N);
for i=1:N
    delta=abs(timestamps-timepoints(i));
    [val idx]=min(delta);
    synch(i)=idx;
end

% The direction of plotting the data points depends on whether the sample
% is anodic or cathodic

if ~cat_ano
    V=flip(V);
    %isbs=isbs_choice(2,:);
else 
    %isbs=isbs_choice(1,:);
end

%% Plot all collected curves
figure(1)
% ax=gca;
% ax.ColorOrder=[1 0 0; 0 0 1];
plot(lambda,spectra(:,:))
%xlim(isbs);
%ylim([0 0.1]);
xlim([300 700]);
xlabel('Wavelength (nm)');
ylabel('Absorbance');
ax=gca;
ax.ColorOrder=copper;
map=copper;
map=flip(map);
ax.ColorOrder=map;
xlim([360 600]);
ylim([0.02 1.05]);

%% Subtract baseline
if cat_ano==0
    idx=1;
else
    idx=length(synch);
end
    
range=[700 740];
baselam=lambda<range(2) & lambda>range(1);
base=mean(spectra(baselam,synch(idx)));
spectra=spectra-base;

%%
figure(3)
plot(lambda,spectra(:,synch),'Linewidth',2)


xlabel('Wavelength (nm)');
ylabel('Absorbance');
xlim([300 740]);
ylim([0 1]);


%%
spectra_final=spectra(:,synch);
save([root samplename  '.mat'],'spectra_final','start','final','spacer','cat_ano');
