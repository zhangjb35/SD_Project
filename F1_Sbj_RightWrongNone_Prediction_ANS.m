function [S1,S1_RightAble]=F1_Sbj_RightWrongNone_Prediction_ANS(SessType,sbjname,m,RandomOrder,triggerresponsetime,CardPresentTime,CardResponseTime, PredictPresentTime,predictResponseTime,difficulty,predictmark,CorrectAns,CardResponse,GameRT,PableRT,rightorwrong, endTime)
%%
k=1;
r=0;
Right=zeros(m,1);Wrong=zeros(m,1);None=zeros(m,1);
Control=zeros(m,1);Middle=zeros(m,1);Hard=zeros(m,1);
PredictAble=zeros(m,1);PredictNotAble=zeros(m,1);PredictNone=zeros(m,1);
% PredictAbleRT=zeros(m,1);PredictNotAbleRT=zeros(m,1);PredictNoneAbleRT=zeros(m,1);
% m
%%

Right(strncmp(rightorwrong,sprintf('right'),5))=1;
Wrong(strncmp(rightorwrong,sprintf('wrong'),5))=1;
None(strncmp(rightorwrong,sprintf('None'),4))=1;

Control(difficulty==1)=1;
Middle(difficulty==2)=1;
Hard(difficulty==3)=1;

PredictAble(predictmark==1)=1;
PredictNotAble(predictmark==2)=1;
PredictNone((predictmark==6)|(predictmark==9))=1;

%% Money

ControlRight=Control.*Right;
MiddleRight=Middle.*Right;
HardRight=Hard.*Right;

ControlWrong=Control.*Wrong;
MiddleWrong=Middle.*Wrong;
HardWrong=Hard.*Wrong;

ControlNone=Control.*None;
MiddleNone=Middle.*None;
HardNone=Hard.*None;

%% Prediction
ControlPredictAble=Control.*PredictAble;
MiddlePredictAble=Middle.*PredictAble;
HardPredictAble=Hard.*PredictAble;

RightAble=Right.*PredictAble;
Control_RightAble=Control.*Right.*PredictAble;
Middle_RightAble=Middle.*Right.*PredictAble;
Hard_RightAble=Hard.*Right.*PredictAble;

RightNotAble=Right.*PredictNotAble;
Control_RightNotAble=Control.*Right.*PredictNotAble;
Middle_RightNotAble=Middle.*Right.*PredictNotAble;
Hard_RightNotAble=Hard.*Right.*PredictNotAble;

%% PredictRT
PableRT1=double(PableRT);
PredictRT=PableRT1;

AbleRT=PredictAble.*PableRT1;
NotAbleRT=PredictNotAble.*PableRT1;
% PredictNoneRT=PredictNone.*PableRT1;

ControlPredictRT=Control.*PableRT1;
MiddlePredictRT=Middle.*PableRT1;
HardPredictRT=Hard.*PableRT1;

PredictAbleRT=PredictAble.*PableRT1;
ControlPredictAbleRT=Control.*PredictAble.*PableRT1;
MiddlePredictAbleRT=Middle.*PredictAble.*PableRT1;
HardPredictAbleRT=Hard.*PredictAble.*PableRT1;

PredictNotAbleRT=PredictNotAble.*PableRT1;
ControlPredictNotAbleRT=Control.*PredictNotAble.*PableRT1;
MiddlePredictNotAbleRT=Middle.*PredictNotAble.*PableRT1;
HardPredictNotAbleRT=Hard.*PredictNotAble.*PableRT1;


RightPredictAbleRT=Right.*PredictAble.*PableRT1;
ControlRightPredictAbleRT=Right.*Control.*PredictAble.*PableRT1;
MiddleRightPredictAbleRT=Right.*Middle.*PredictAble.*PableRT1;
HardRightPredictAbleRT=Right.*Hard.*PredictAble.*PableRT1;

RightPredictNotAbleRT=Right.*PredictNotAble.*PableRT1;
ControlRightPredictNotAbleRT=Right.*Control.*PredictNotAble.*PableRT1;
MiddleRightPredictNotAbleRT=Right.*Middle.*PredictNotAble.*PableRT1;
HardRightPredictNotAbleRT=Right.*Hard.*PredictNotAble.*PableRT1;

WrongPredictAbleRT=Wrong.*PredictAble.*PableRT1;
ControlWrongPredictAbleRT=Wrong.*Control.*PredictAble.*PableRT1;
MiddleWrongPredictAbleRT=Wrong.*Middle.*PredictAble.*PableRT1;
HardWrongPredictAbleRT=Wrong.*Hard.*PredictAble.*PableRT1;

WrongPredictNotAbleRT=Wrong.*PredictNotAble.*PableRT1;
ControlWrongPredictNotAbleRT=Wrong.*Control.*PredictNotAble.*PableRT1;
MiddleWrongPredictNotAbleRT=Wrong.*Middle.*PredictNotAble.*PableRT1;
HardWrongPredictNotAbleRT=Wrong.*Hard.*PredictNotAble.*PableRT1;

MHPredictAbleRT=PredictAble.*PableRT1.*(Middle+Hard);
MHPredictNotAbleRT=PredictNotAble.*PableRT1.*(Middle+Hard);
MHRightPredictAbleRT=Right.*PredictAble.*PableRT1.*(Middle+Hard);
MHRightPredictNotAbleRT=Right.*PredictNotAble.*PableRT1.*(Middle+Hard);
MHWrongPredictAbleRT=Wrong.*PredictAble.*PableRT1.*(Middle+Hard);
MHWrongPredictNotAbleRT=Wrong.*PredictNotAble.*PableRT1.*(Middle+Hard);

%% Money RT
GameRT1=double(GameRT);
ControlRT=Control.*GameRT1;
MiddleRT=Middle.*GameRT1;
HardRT=Hard.*GameRT1;

All_S1RT=GameRT1;



RightRT=Right.*GameRT1;
WrongRT=Wrong.*GameRT1;
NoneRT=None.*GameRT1;

ControlRightRT=Control.*Right.*GameRT1;
MiddleRightRT=Middle.*Right.*GameRT1;
HardRightRT=Hard.*Right.*GameRT1;

ControlWrongRT=Control.*Wrong.*GameRT1;
MiddleWrongRT=Middle.*Wrong.*GameRT1;
HardWrongRT=Hard.*Wrong.*GameRT1;

ControlNoneRT=Control.*None.*GameRT1;
MiddleNoneRT=Middle.*None.*GameRT1;
HardNoneRT=Hard.*None.*GameRT1;

 %%
ControlCardPresentTime=Control.*double(CardPresentTime).*(Right+Wrong);
MiddleCardPresentTime=Middle.*double(CardPresentTime).*(Right+Wrong);
HardCardPresentTime=Hard.*double(CardPresentTime).*(Right+Wrong);
NRCardPresentTime=None.*double(CardPresentTime);

ControlPresentAS=ControlCardPresentTime(find(ControlCardPresentTime~=0));
MiddlePresentAS=MiddleCardPresentTime(find(MiddleCardPresentTime~=0));
HardPresentAS=HardCardPresentTime(find(HardCardPresentTime~=0));
NRCardPresentAS=NRCardPresentTime(find(NRCardPresentTime~=0));
endAS=endTime(115,1);
NRCardPresentAS=[NRCardPresentAS;[endAS]];
% NRCardPresentAS=double(NRCardPresentAS);
sot={ControlPresentAS MiddlePresentAS HardPresentAS NRCardPresentAS};
% CarPresent_sorts={ControlPresentAS MiddlePresentAS HardPresentAS NRCardPresentAS};
% sot={ControlPresentAS/2500 MiddlePresentAS/2500 HardPresentAS/2500 NRCardPresentAS/2500};
ControlRTAS=ControlRT(find(ControlRT~=0));
MiddleRTAS=MiddleRT(find(MiddleRT~=0));
HardRTAS=HardRT(find(HardRT~=0));
otherdurationA=NRCardPresentAS+5000;
otherduration=otherdurationA-NRCardPresentAS;
ASdurations={ControlRTAS MiddleRTAS HardRTAS otherduration}; 
%%
RightCardPresentTime=Right.*double(CardPresentTime);
WrongCardPresentTime=Wrong.*double(CardPresentTime);

AblePredictPresentTime=PredictAble.*double(PredictPresentTime);
NotablePredictPresentTime=PredictNotAble.*double(PredictPresentTime);


%%
CardRight=Right.*double(CardPresentTime);
CardWrong=Wrong.*double(CardPresentTime);
CardNone=None.*double(CardPresentTime);
CardRightAS=CardRight(find(CardRight~=0));
CardWrongAS=CardWrong(find(CardWrong~=0));
CardNoneAS=CardNone(find(CardNone~=0));

% RW_AS_sot={CardRightAS CardWrongAS};
RW_AS_sot={CardRightAS/1000 CardWrongAS/1000};

RightRTAS=RightRT(find(RightRT~=0));
WrongRTAS=WrongRT(find(WrongRT~=0));
NoneRT=CardNoneAS+5000;
NoneRTAS=NoneRT-CardNoneAS;

% durationAS={RightRTAS WrongRTAS};
 durationAS={RightRTAS/1000 WrongRTAS/1000};
%%
% ControlPredictResponseTime=Control.*double(PredictResponseTime);
% MiddlePredictResponseTime=Middle.*double(PredictResponseTime);
% HardPredictResponseTime=Hard.*double(PredictResponseTime);

ControlPredictPresentTime=Control.*double(PredictPresentTime).*(PredictAble+PredictNotAble);
MiddlePredictPresentTime=Middle.*double(PredictPresentTime).*(PredictAble+PredictNotAble);
HardPredictPresentTime=Hard.*double(PredictPresentTime).*(PredictAble+PredictNotAble);
NRPredictPresentTime=PredictNone.*double(PredictPresentTime);

ControlPresentPredict=ControlPredictPresentTime(find(ControlPredictPresentTime>0));
MiddlePresentPredict=MiddlePredictPresentTime(find(MiddlePredictPresentTime>0));
HardPresentPredict=HardPredictPresentTime(find(HardPredictPresentTime>0));
NRPredictPresent=NRPredictPresentTime(find(NRPredictPresentTime>0));
NRPredictPresent=[NRPredictPresent;[endAS]];
Psot={ControlPresentPredict MiddlePresentPredict HardPresentPredict NRPredictPresent};

PControlPredictRT=ControlPredictRT(find(ControlPredictRT~=0));
PMiddlePredictRT=MiddlePredictRT(find(MiddlePredictRT~=0));
PHardPredictRT=HardPredictRT(find(HardPredictRT~=0));
PotherdurationA=NRPredictPresent+4000;
Potherduration=PotherdurationA-NRPredictPresent;
Pdurations={PControlPredictRT PMiddlePredictRT PHardPredictRT Potherduration};

% PredictPresent_sorts={ControlPresentPredict MiddlePresentPredict HardPresentPredict NRPredictPresent};
% Psot={ControlPresentPredict/2500 MiddlePresentPredict/2500 HardPresentPredict/2500 NRPredictPresent/2500};
%%
PAble=PredictAble.*double(PredictPresentTime);
PUnable=PredictNotAble.*double(PredictPresentTime);
PNone=PredictNone.*double(PredictPresentTime);
PAbleAS=PAble(find(PAble~=0));
PUnableAS=PUnable(find(PUnable~=0));
PNoneAS=PNone(find(PNone~=0));
otheronsets=[CardNoneAS;PNoneAS];
% P_AbleUnable_sot={PAbleAS PUnableAS otheronsets};
P_AbleUnable_sot={PAbleAS/1000 PUnableAS/1000 otheronsets/1000};

AbleRTP=AbleRT(find(AbleRT~=0));
NotAbleRTP=NotAbleRT(find(NotAbleRT~=0));

PredictNoneRT=PNoneAS+4000;
PredictNoneRTP=PredictNoneRT-PNoneAS;


otherduration=[NoneRTAS;PredictNoneRTP];
% durationP={AbleRTP NotAbleRTP otherduration};
durationP={AbleRTP/1000 NotAbleRTP/1000 otherduration/1000};

names = {'Right' 'Wrong' 'Able' 'Notable' 'Other'};
onsets={CardRightAS/1000 CardWrongAS/1000 PAbleAS/1000 PUnableAS/1000 otheronsets/1000};
durations={RightRTAS/1000 WrongRTAS/1000 AbleRTP/1000 NotAbleRTP/1000 otherduration/1000};
%%
sbjinfo_RightWrongNone_S1 = {'Condition','Num_ALL_Right','Num_ControlRight','Num_MidRight','Num_HardRight', ...
                         'Num_ALL_Wrong', 'Num_ControlWrong','Num_MidWrong','Num_HardWrong' ,...
                         'Num_ALL_None', 'Num_ControlNone','Num_MidNone','Num_HardNone';...
                'number' nnz(Right) nnz(ControlRight) nnz(MiddleRight) nnz(HardRight)...
                         nnz(Wrong)  nnz(ControlWrong) nnz(MiddleWrong) nnz(HardWrong)...
                         nnz(None) nnz(ControlNone)  nnz(MiddleNone) nnz(HardNone) };
% % %   
sbjinfo_Prediction_S1 = {'Condition','Num_All','Num_Control','Num_Mid','Num_Hard','Num_MediumHard'; ...
    'Right' nnz(Right) nnz(ControlRight)  nnz(MiddleRight) nnz(HardRight)   nnz(MiddleRight+HardRight);...                          
    'PredictAble' nnz(PredictAble) nnz(ControlPredictAble)  nnz(MiddlePredictAble) nnz(HardPredictAble)  nnz(MiddlePredictAble+HardPredictAble);...
    'RightAble'  nnz(RightAble) nnz(Control_RightAble)  nnz(Middle_RightAble) nnz(Hard_RightAble)   nnz(Middle_RightAble+Hard_RightAble);...
    'RightNotAble'  nnz(RightNotAble) nnz(Control_RightNotAble)  nnz(Middle_RightNotAble) nnz(Hard_RightNotAble)    nnz(Middle_RightNotAble+Hard_RightNotAble);...
    'PredictAbleRT'  sum(PredictAbleRT)/nnz(PredictAbleRT) sum(ControlPredictAbleRT)/nnz(ControlPredictAbleRT)  sum(MiddlePredictAbleRT)/nnz(MiddlePredictAbleRT) sum(HardPredictAbleRT)/nnz(HardPredictAbleRT) sum(MHPredictAbleRT)/nnz(MHPredictAbleRT);...  
    'PredictNotAbleRT' sum(PredictNotAbleRT)/nnz(PredictNotAbleRT) sum(ControlPredictNotAbleRT)/nnz(ControlPredictNotAbleRT)  sum(MiddlePredictNotAbleRT)/nnz(MiddlePredictNotAbleRT) sum(HardPredictNotAbleRT)/nnz(HardPredictNotAbleRT)   sum(MHPredictNotAbleRT)/nnz(MHPredictNotAbleRT);...   
    'RightRT'  sum(RightRT)/nnz(RightRT) sum(ControlRightRT)/nnz(ControlRightRT) sum(MiddleRightRT)/nnz(MiddleRightRT) sum(HardRightRT)/nnz(HardRightRT)    sum(MiddleRightRT+HardRightRT)/nnz(MiddleRightRT+HardRightRT);...
    'WrongRT'  sum(WrongRT)/nnz(WrongRT) sum(ControlWrongRT)/nnz(ControlWrongRT) sum(MiddleWrongRT)/nnz(MiddleWrongRT) sum(HardWrongRT)/nnz(HardWrongRT)    sum(MiddleWrongRT+HardWrongRT)/nnz(MiddleWrongRT+HardWrongRT);...
    'RightPredictAbleRT' sum(RightPredictAbleRT)/nnz(RightPredictAbleRT) sum(ControlRightPredictAbleRT)/nnz(ControlRightPredictAbleRT) sum(MiddleRightPredictAbleRT)/nnz(MiddleRightPredictAbleRT) sum(HardRightPredictAbleRT)/nnz(HardRightPredictAbleRT)   sum(MHRightPredictAbleRT)/nnz(MHRightPredictAbleRT);...
    'RightPredictNotAbleRT' sum(RightPredictNotAbleRT)/nnz(RightPredictNotAbleRT) sum(ControlRightPredictNotAbleRT)/nnz(ControlRightPredictNotAbleRT) sum(MiddleRightPredictNotAbleRT)/nnz(MiddleRightPredictNotAbleRT) sum(HardRightPredictNotAbleRT)/nnz(HardRightPredictNotAbleRT)    sum(MHRightPredictNotAbleRT)/nnz(MHRightPredictNotAbleRT);...
    'WrongPredictAbleRT'  sum(WrongPredictAbleRT)/nnz(WrongPredictAbleRT) sum(ControlWrongPredictAbleRT)/nnz(ControlWrongPredictAbleRT) sum(MiddleWrongPredictAbleRT)/nnz(MiddleWrongPredictAbleRT) sum(HardWrongPredictAbleRT)/nnz(HardWrongPredictAbleRT)  sum(MHWrongPredictAbleRT)/nnz(MHWrongPredictAbleRT);...
    'WrongPredictNotAbleRT' sum(WrongPredictNotAbleRT)/nnz(WrongPredictNotAbleRT) sum(ControlWrongPredictNotAbleRT)/nnz(ControlWrongPredictNotAbleRT) sum(MiddleWrongPredictNotAbleRT)/nnz(MiddleWrongPredictNotAbleRT) sum(HardWrongPredictNotAbleRT)/nnz(HardWrongPredictNotAbleRT)   sum(MHWrongPredictNotAbleRT)/nnz(MHWrongPredictNotAbleRT);... 
    'S1RT'     sum(All_S1RT)/nnz(All_S1RT) sum(ControlRT)/nnz(ControlRT) sum(MiddleRT)/nnz(MiddleRT) sum(HardRT)/nnz(HardRT)    sum(MiddleRT+HardRT)/nnz(MiddleRT+HardRT);...
    'PredictRT'  sum(PredictRT)/nnz(PredictRT) sum(ControlPredictRT)/nnz(ControlPredictRT)  sum(MiddlePredictRT)/nnz(MiddlePredictRT) sum(HardPredictRT)/nnz(HardPredictRT) sum(MiddlePredictRT+HardPredictRT)/nnz(MiddlePredictRT+HardPredictRT) }; 
     



S1 = [RandomOrder Right Wrong PredictAble Control Middle Hard];
S1_RightAble=[nnz(RightAble) nnz(Control_RightAble) nnz(Middle_RightAble) nnz(Hard_RightAble) nnz(Middle_RightAble+Hard_RightAble)];

savename=[sbjname,'_',SessType, '_AC'];
save(savename,'sbjinfo_RightWrongNone_S1','sbjinfo_Prediction_S1');

% savename=[sbjname,'_RightWrong_AbleNotable_Other'];
% save(savename,'names','onsets','durations');
% 
% clear('names','onsets','durations');


%%