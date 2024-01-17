%% Load data
clear;
clc;
close all;
%% Specs (Can change with every file)

% Files for 02/04/2021 20 mM KCL (not oxygen free)
%root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210209\';
%root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210208\';
%root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210204\';
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210204\SpectravTime_PpcA_1.xlsx';
% samplename='SpectravTime_PpcA_1';
% start=duration('13:18:49');%End time of first applied voltage 
% final=duration('13:47:07');%End time of last applied voltage
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% V=[200 100 0 -100 -150 -200 -250 -300 -325 -350 -375 -400 -450 -500 -600];% Voltage points

% Files for 02/08/2021 no salt added on accident 
% 
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210208\210208_PpcA20mMKCl_Sparged.xlsx';
% samplename='210208_PpcA20mMKCl_Sparged';
% start=duration('12:14:06');%End time of first applied voltage 
% final=duration('12:42:35');%End time of last applied voltage
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% V=[200 100 0 -100 -150 -200 -250 -300 -325 -350 -375 -400 -450 -500 -600];% Voltage points

% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210208\210208_PpcA20mMKCLvTime.xlsx';
% samplename='210208_PpcA20mMKCLvTime';
% start=duration('11:06:36');%End time of first applied voltage 
% final=duration('11:35:15');%End time of last applied voltage
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% V=[200 100 0 -100 -150 -200 -250 -300 -325 -350 -375 -400 -450 -500 -600];% Voltage points

% Files for 02/09/2021 20 mM KCL 
%
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210209\210209_PpcA20mM_Cathodic.xlsx';
% samplename='210209_PpcA20mM_Cathodic';
% start=duration('10:57:58');%End time of first applied voltage 
% final=duration('11:26:07');%End time of last applied voltage
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% V=[200 100 0 -100 -150 -200 -250 -300 -325 -350 -375 -400 -450 -500 -600];% Voltage points

% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210209\210209_PpcA20mM_Anodic.xlsx';
% samplename='210209_PpcA20mM_Anodic';
% start=duration('11:29:11');%End time of first applied voltage 
% final=duration('11:57:36');%End time of last applied voltage
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% V=[200 100 0 -100 -150 -200 -250 -300 -325 -350 -375 -400 -450 -500 -600];% Voltage points

% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210209\210209_PpcA20mM_Anodic_Sparged.xlsx';
% samplename='210209_PpcA20mM_Anodic_Sparged';
% start=duration('13:14:47');%End time of first applied voltage 
% final=duration('13:42:56');%End time of last applied voltage
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% V=[200 100 0 -100 -150 -200 -250 -300 -325 -350 -375 -400 -450 -500 -600];% Voltage points

% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210209\210209_PpcA20mM_Cathodic_Sparged.xlsx';
% samplename='210209_PpcA20mM_Cathodic_Sparged';
% start=duration('12:40:32');%End time of first applied voltage 
% final=duration('13:06:41');%End time of last applied voltage
% V=[200 100 0 -100 -150 -200 -250 -300 -325 -350 -375 -400 -450 -500];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
%% OmcS 
% %Files for 08/03/2021 120s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210803\210803_OmcS_Anodic.xlsx';
% samplename='210803_OmcS_Anaero_Anodic';
% start=duration('15:08:07');%End time of first applied voltage 
% final=duration('15:36:17');%End time of last applied voltage
% V=[200 100 0 -100 -150 -200 -250 -300 -325 -350 -375 -400 -450 -500 -600];% Voltage points
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210803\';
% spacer=120;%Time held on each voltage point (s)
% 
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210803\210803_OmcS_Cathodic.xlsx';
% samplename='210803_OmcS_Anaero_Cathodic';
% start=duration('14:25:22');%End time of first applied voltage 
% final=duration('14:51:30');%End time of last applied voltage
% V=[200 100 0 -100 -150 -200 -250 -300 -325 -350 -400 -450 -500 -600];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210803\';
% spacer=120;%Time held on each voltage point (s)

% Files for 08/05/2021
%%300s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210805\210805_OmcS_Cathodic.xlsx';
% samplename='210805_OmcS_Anaero_Cathodic_5min';
% start=duration('11:36:12');%End time of first applied voltage (time in file plus sampling time)
% final=duration('13:11:24');%End time of last applied voltage
% V=[ 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210805\';
% spacer=300;%Time held on each voltage point (s)
%%300s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210805\210805_OmcS_Anodic.xlsx';
% samplename='210805_OmcS_Anaero_Anodic_5min';
% start=duration('14:57:31');%End time of first applied voltage 
% final=duration('16:32:45');%End time of last applied voltage
% V=[ 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210805\';
% spacer=300;%Time held on each voltage point (s)

% Files for 08/24/2021
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210824\210824_OmcS_Anodic.xlsx';
% samplename='210824_OmcS_Anaero_Anodic';
% start=duration('11:22:27');%End time of first applied voltage 
% final=duration('12:02:41');%End time of last applied voltage
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210824\';
% spacer=120;%Time held on each voltage point (s)

% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210824\210824_OmcS_Cathodic.xlsx';
% samplename='210824_OmcS_Anaero_Cathodic';
% start=duration('10:34:35');%End time of first applied voltage 
% final=duration('11:14:49');%End time of last applied voltage '11:14:49'
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210824\';
% spacer=120;%Time held on each voltage point (s)


% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210824\210824_OmcS_Cathodic2.xlsx';
% samplename='210824_OmcS_Anaero_Cathodic2';
% start=duration('15:00:58');%End time of first applied voltage 
% final=duration('15:41:13');%End time of last applied voltage '11:14:49'
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210824\';
% spacer=120;%Time held on each voltage point (s)

% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210824\210824_OmcS_Anodic2.xlsx';
% samplename='210824_OmcS_Anaero_Anodic2';
% start=duration('15:50:13');%End time of first applied voltage 
% final=duration('16:30:27');%End time of last applied voltage '11:14:49'
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210824\';
% spacer=120;%Time held on each voltage point (s)

%Files for 08/26/2021
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210826\210826_OmcS_Anodic.xlsx';
% samplename='210826_OmcS_Anaero_Anodic';
% start=duration('12:15:29');%End time of first applied voltage 
% final=duration('12:55:43');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210826\';
% spacer=120;%Time held on each voltage point (s)
% 
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210826\210826_OmcS_Cathodic.xlsx';
% samplename='210826_OmcS_Anaero_Cathodic';
% start=duration('11:29:54');%End time of first applied voltage 
% final=duration('12:10:07');%End time of last applied voltage '11:14:49'
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210826\';
% spacer=120;%Time held on each voltage point (s)


%Files for 08/30/2021
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210830\210830_Anodic.xlsx';
% samplename='210830_OmcS_Anaero_Anodic';
% start=duration('12:52:46');%End time of first applied voltage 
% final=duration('13:32:59');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210830\';
% spacer=120;%Time held on each voltage point (s)
% 
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210830\210830_Cathodic.xlsx';
% samplename='210830_OmcS_Anaero_Cathodic';
% start=duration('12:06:11');%End time of first applied voltage 
% final=duration('12:46:24');%End time of last applied voltage '11:14:49'
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210830\';
% spacer=120;%Time held on each voltage point (s)
% 
%60s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210830\210830_Anodic2.xlsx';
% samplename='210830_OmcS_Anaero_Anodic2';
% start=duration('14:18:19');%End time of first applied voltage 
% final=duration('14:38:33');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210830\';
% spacer=60;%Time held on each voltage point (s)
%60s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210830\210830_Cathodic2.xlsx';
% samplename='210830_OmcS_Anaero_Cathodic2';
% start=duration('13:53:08');%End time of first applied voltage 
% final=duration('14:13:21');%End time of last applied voltage '11:14:49'
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210830\';
% spacer=60;%Time held on each voltage point (s)

%Files for 09/03/2021
% BAD FILES DON'T USE
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210903\210903_Anodic.xlsx';
% samplename='210903_OmcS_Anaero_Anodic';
% start=duration('12:09:01');%End time of first applied voltage 
% final=duration('12:49:15');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210903\';
% spacer=120;%Time held on each voltage point (s)

% BAD FILES DON'T USE
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210903\210903_Cathodic.xlsx';
% samplename='210903_OmcS_Anaero_Cathodic';
% start=duration('11:23:30');%End time of first applied voltage 
% final=duration('12:03:44');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210903\';
% spacer=120;%Time held on each voltage point (s)

%Files for 09/22/2021

% BAD FILES DON'T USE
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210922\210922_OmcSAnaero_Anoodic.xlsx';
% samplename='210922_OmcS_Anaero_Anodic';
% start=duration('12:14:18');%End time of first applied voltage 
% final=duration('12:54:33');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210922\';
% spacer=120;%Time held on each voltage point (s)

% BAD FILES DON'T USE
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210922\210922_OmcSAnaero_Cathodic.xlsx';
% samplename='210922_OmcS_Anaero_Cathodic';
% start=duration('11:22:40');%End time of first applied voltage 
% final=duration('12:02:55');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210922\';
% spacer=120;%Time held on each voltage point (s)
% 
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210922\210922_OmcSAnaero_Cathodic2.xlsx';
% samplename='210922_OmcS_Anaero_Cathodic2';
% start=duration('13:51:34');%End time of first applied voltage 
% final=duration('14:31:18');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210922\';
% spacer=120;%Time held on each voltage point (s)
%60s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210922\210922_OmcSAnaero_Cathodic3.xlsx';
% samplename='210922_OmcS_Anaero_Cathodic3';
% start=duration('14:56:16');%End time of first applied voltage 
% final=duration('15:16:29');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210922\';
% spacer=60;%Time held on each voltage point (s)

%Files for 09/23/2021
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210923\210923_OmcS_Cathodic.xlsx';
% samplename='210923_OmcS_Anaero_Cathodic';
% start=duration('12:28:48');%End time of first applied voltage 
% final=duration('13:09:02');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210923\';
% spacer=120;%Time held on each voltage point (s)
% basesub=0;

% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210923\210923_OmcS_Anodic.xlsx';
% samplename='210923_OmcS_Anaero_Anodic';
% start=duration('14:00:40');%End time of first applied voltage 
% final=duration('14:40:53');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210923\';
% spacer=120;%Time held on each voltage point (s)
% basesub=0;
% %60s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210923\210923_OmcS_Anodic60.xlsx';
% samplename='210923_OmcS_Anaero_Anodic2';
% start=duration('15:41:07');%End time of first applied voltage 
% final=duration('16:01:21');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210923\';
% spacer=60;%Time held on each voltage point (s)
% 60s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210923\210923_OmcS_Cathodic60.xlsx';
% samplename='210923_OmcS_Anaero_Cathodic2';
% start=duration('16:06:18');%End time of first applied voltage 
% final=duration('16:26:31');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\210923\';
% spacer=60;%Time held on each voltage point (s)

%Files for 01/26/2022 
%120s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220126\220126_OmcS_Anodic.xlsx';
% samplename='220126_OmcS_Anodic';
% start=duration('14:30:44');%End time of first applied voltage 
% final=duration('15:10:57');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220126\';
% spacer=120;%Time held on each voltage point (s)
%120s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220126\220126_OmcS_Cathodic.xlsx';
% samplename='220126_OmcS_Cathodic';
% start=duration('13:43:03');%End time of first applied voltage 
% final=duration('14:23:17');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220126\';
% spacer=120;%Time held on each voltage point (s)

%Files for 02/07/22
%120s
filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220207\220207_OmcS_Anodic1.xlsx';
samplename='220207_OmcS_Anodic';
start=duration('15:05:25');%End time of first applied voltage 
final=duration('15:45:38');%End time of last applied voltage 
V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
cat_ano=0;% Cathodic (1) or anodic (0) scanning
root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220207\';
spacer=120;%Time held on each voltage point (s)
basesub=0;
%120s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220207\220207_OmcS_Cathodic1.xlsx';
% samplename='220207_OmcS_Cathodic';
% start=duration('14:18:07');%End time of first applied voltage 
% final=duration('14:56:20');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220207\';
% spacer=120;%Time held on each voltage point (s)
% basesub=0;

%File for 03/09/22
%120s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220309\220309_OmcS_Anodic2.xlsx';
% samplename='220309_OmcS_Anodic';
% start=duration('14:27:31');%End time of first applied voltage 
% final=duration('15:07:44');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220309\';
% spacer=120;%Time held on each voltage point (s)
% basesub=0;
% %120s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220309\220309_OmcS_Cathodic2.xlsx';
% samplename='220309_OmcS_Cathodic';
% start=duration('12:12:16');%End time of first applied voltage 
% final=duration('12:52:30');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220309\';
% spacer=120;%Time held on each voltage point (s)
% basesub=1;
% AT 45uM concentration
%120s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220309\220309_OmcS_Anodic3.xlsx';
% samplename='220309_OmcS_Anodic_45';
% start=duration('16:42:27');%End time of first applied voltage 
% final=duration('17:22:40');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220309\';
% spacer=120;%Time held on each voltage point (s)
% % %120s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220309\220309_OmcS_Cathodic3.xlsx';
% samplename='220309_OmcS_Cathodic_45';
% start=duration('15:34:18');%End time of first applied voltage 
% final=duration('16:14:32');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220309\';
% spacer=120;%Time held on each voltage point (s)

%Files for 03/21/2022
%120s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220321\220321_Meds_Anodic.xlsx';
% samplename='220321_Meds_Anodic';
% start=duration('14:57:58');%End time of first applied voltage 
% final=duration('15:38:11');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220321\';
% spacer=120;%Time held on each voltage point (s)
% basesub=1;
%120s
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220321\220321_Meds_Cathodic.xlsx';
% samplename='220321_Meds_Cathodic';
% start=duration('14:12:43');%End time of first applied voltage 
% final=duration('14:52:56');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220321\';
% spacer=120;%Time held on each voltage point (s)
% basesub=1;

% Files for 04/13/2022
%60uM concentration
%120
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220413\220413_OmcS_Anodic.xlsx';
% samplename='220413_OmcS_Anodic';
% start=duration('15:33:57');%End time of first applied voltage 
% final=duration('16:14:11');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=0;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220413\';
% spacer=120;%Time held on each voltage point (s)
% basesub=0;
%120
% filename='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220413\220413_OmcS_Cathodic.xlsx';
% samplename='220413_OmcS_Cathodic';
% start=duration('14:49:24');%End time of first applied voltage 
% final=duration('15:29:38');%End time of last applied voltage 
% V=[ 100 0 -100 -150 -200 -225 -250 -275 -300 -325 -350 -375 -400 -425 -450 -475 -500 -550 -600 -650 -700];% Voltage points
% cat_ano=1;% Cathodic (1) or anodic (0) scanning
% root='C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220413\';
% spacer=120;%Time held on each voltage point (s)
% basesub=0;


med_data(1)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220321\220321_Meds_Anodic.mat');
med_data(2)=load('C:\Users\kitka\Documents\Yale\Malvankar Lab\UV-Vis\220321\220321_Meds_Cathodic.mat');

isbs_choice=[543 562;545 559];%isosbestic points in wavelength (nm) Qian et al. Biochema& Biophysica 2011
N=length(V);
mxavg=1;%number of time points to average over for the integration points (plotted in blue)

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







%% 
% Subtract out background (from baseline shifts) before analysis
range=[740 745];
baselam=lambda<range(2) & lambda>range(1);
base=mean(spectra(baselam,:));
spectra=spectra-base;
% base=mean(spectra(1850:1950,:));
% spectra=spectra-base;

%%
spectrasynch=[];
if basesub==1
    if cat_ano==1 %Cathodic
        spectrasynch=subtractmeds(lambda,spectra,med_data(2).spectra_final,synch,cat_ano);
    else % Anodic
        spectrasynch=subtractmeds(lambda,spectra,med_data(1).spectra_final,synch,cat_ano);
    end
    
else
    spectrasynch=spectra(:,synch);
end
    
figure(1)
ax=gca;
ax.ColorOrder=[1 0 0; 0 0 1];
plot(lambda,spectrasynch(:,end),'b')
hold on
plot(lambda,spectrasynch(:,1),'r')
hold on
plot(lambda,med_data(2).spectra_final(:,1),'--r')
hold on
plot(lambda,med_data(2).spectra_final(:,end),'--b')
%xlim(isbs);
%ylim([0 0.1]);
xlim([300 700]);
xlabel('Wavelength (nm)');
ylabel('Absorbance');
% ax=gca;
% ax.ColorOrder=copper;
% map=copper;
% map=flip(map);
% ax.ColorOrder=map;
xlim([360 600]);
ylim([0.02 1.05]);
%% Calculate line between isosbestic points for each spectrum

%old isosbestic points
% isbs=[541 559];
% dif=lambda-isbs;
% [~, index]=min(abs(dif));
% x1=index(1);
% x2=index(2);

isos=findisos(lambda,spectra,cat_ano);
isos=findisos(lambda,spectrasynch,cat_ano);
isbs=lambda(isos);
x1=isos(1);
x2=isos(2);

y1=spectrasynch(x1,:);
y2=spectrasynch(x2,:);
m=(y2-y1)/(lambda(x2)-lambda(x1));
y=m.*(lambda-lambda(x1))+y1;

figure(1)
hold on
plot(lambda(x1:x2),y(x1:x2,:),'Color',[0.1 0.1 0.1])
xlabel('Wavelength (nm)');
ylabel('Absorbance');
%ylim([0.045 0.065]);
xlim([isbs(1)-10 isbs(2)+10]);

%% Calculate area under alpha peak using synched voltage points
%area=trapz(spectra(x1:x2,:)-y(x1:x2,:));
% vpts=zeros(1,length(timestamps));
% vpts(synch)=1;
% vpts=logical(vpts);
% single=area(vpts);

single=trapz(spectrasynch(x1:x2,:)-y(x1:x2,:));

vrange=zeros(1,length(timestamps));
for i=0:mxavg
    vrange(synch-i)=1; 
end
vrange=logical(vrange);
%multi=area(vrange);

%%
%multi=reshape(multi,[mxavg+1,N]);


%avg=mean(multi);
%sd=std(multi);

%%
if cat_ano==1
    %first point is oxidized last is reduced
    Ox=single-single(end);
    Red=single(1)-single;
%     Ox_m=(avg-avg(end));
%     Red_m=(avg(1)-avg);
%     Ox_sd_m=sqrt(sd.^2+sd(end).^2);
else
    %first point is reduced last is oxidized
    Ox=single-single(1);
    Red=single(end)-single;
%     Ox_m=(avg-avg(1));
%     Red_m=(avg(end)-avg);
%     Ox_sd_m=sqrt(sd.^2+sd(1).^2);
end


%%
figure(3)
plot(lambda,spectrasynch(:,:),'Linewidth',2)
%plot(lambda,spectra(:,[end]),'Linewidth',2)
%xlim(isbs);
%ylim([0 0.1]);
xlim([300 700]);
xlabel('Wavelength (nm)');
ylabel('Absorbance');
hold on
plot(lambda(x1:x2),y(x1:x2,end))
xlabel('Wavelength (nm)');
ylabel('Absorbance');
%ylim([0.045 0.065]);
xlim([isbs(1)-5 isbs(2)+5]);
ylim([0.08 0.2]);
%ax=gca;
%ax.ColorOrder=map(synch,:);
%%
%%frac=abs(Ox./Red);
% %idx=frac==Inf;
% idx=frac==Inf | frac==0;
% idx=~idx;
% figure()
% plot(log(frac(idx)),V(idx)./1000,'*')
% ylabel('Voltage (V) vs Ag/AgCl');
% xlabel('Ox/Red');
%%
% figure()
% plot(V(idx),frac(idx),'o')
if cat_ano==1
    max_norm=1;
else
    max_norm=N;
end
% normOx=abs(Ox./Ox(max_norm));
% normOx_m=abs(Ox_m./Ox_m(max_norm));
normOx=Ox./Ox(max_norm);
% normOx_m=Ox_m./Ox_m(max_norm);
% normOx_m_sd=sqrt((Ox_sd_m./Ox_m).^2+(Ox_sd_m(max_norm)./Ox_m(max_norm)).^2);
figure()
plot(V./1000,normOx,'or')
xlabel('Voltage (V) vs Ag/AgCl');
ylabel('Oxidized Fraction');
% hold on
% plot(V./1000,normOx_m,'*b')
% hold on 
% errorbar(V./1000,normOx_m,normOx_m_sd)
%%
%Single heme fit
fit=ezfit(V./1000,normOx,'f(x)=exp((x-v0)*k)/(1+exp((x-v0)*k));v0=-0.35;k=8.7831');
showfit(fit);

% f=ezfit(V./1000,normOx_m,'f(x)=(exp((x-v0)*39)/(1+exp((x-v0)*39))+(exp(39*(x-v1))/(exp(39*(x-v1))+1))+exp((x-v3)*39)/(1+exp((x-v3)*39)))./3;v1=-0.3;v0=-0.3;v3=-0.3');
% showfit(f)

%OmcS fit 6 hemes
f=ezfit(V./1000,normOx,'f(x)=(exp((x-v0)*39)/(1+exp((x-v0)*39))+(exp(39*(x-v1))/(exp(39*(x-v1))+1))+exp((x-v3)*39)/(1+exp((x-v3)*39))+(exp(39*(x-v4))/(exp(39*(x-v4))+1))+(exp(39*(x-v5))/(exp(39*(x-v5))+1))+(exp(39*(x-v6))/(exp(39*(x-v6))+1)))./6;v1=-0.3;v0=-0.3;v3=-0.3;v4=-0.3;v5=-0.3;v6=-0.3');
%showfit(f)

% eq='f(x)=((1/3)*(1/(exp(-39*(x-v1))+1)+1/(exp(-39*(x-v2))+1)+1/(exp(-39*(x-v3))+1));v1 = -0.3; v2 = -0.3; v3 = -0.3';
% fit=ezfit(V./1000,normOx,eq);
% showfit(fit);


 %%
R=8.3;
n=1;
F=96485.309;
T=298;
K=(n*F)/(R*T);
% v0=0.205;
% oxf=@(v) exp((v-v0).*k)./(1+exp((v-v0).*k));
% figure()
% 
% plot(V,oxf(V./1000))

% hold on
% % figure()
% x=-0.6:.01:0.2;
% y0=K*((x-(-0.3))/15);
% plot(x,exp(y0)./(1+exp(y0)))

%%
% x=-0.6:.01:0.2;
% v0=-0.296;
% k=K;
% v1=-0.2;
% v3=-0.1;
% eq=(exp((x-v0)*k)./(1+exp((x-v0).*k))+(exp(k.*(x-v1))./(exp(k.*(x-v1))+1))+exp((x-v3)*k)./(1+exp((x-v3).*k)))./3;
% 
% plot(x,eq)
% 
% f=ezfit(x,eq,'f(x)=(exp((x-v0)*k)/(1+exp((x-v0)*k))+(exp(k*(x-v1))/(exp(k*(x-v1))+1))+exp((x-v3)*k)/(1+exp((x-v3)*k)))./3;v1=-0.2;v0=-0.296;v3=-0.3;k=39');
% showfit(f)

%%

% save([root samplename  '.mat'],'V','normOx_m','Ox_m','single','start','final','spacer','cat_ano','isbs');
save([root samplename  '.mat'],'V','normOx','Ox','single','start','final','spacer','cat_ano','isbs');
save([root samplename '_spectra'  '.mat'],'lambda','spectrasynch');