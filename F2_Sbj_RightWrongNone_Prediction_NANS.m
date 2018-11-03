function F2_Sbj_RightWrongNone_Prediction_NANS(S1,S1_RightAble,SessType,sbjname,m,RandomOrder,difficulty,predictmark,CorrectAns,CardResponse,GameRT,rightorwrong,CardPresentTime,CardResponseTime,endTime)
%%
k=1;
r=0;
Right=zeros(m,1);Wrong=zeros(m,1);None=zeros(m,1);
Control=zeros(m,1);Middle=zeros(m,1);Hard=zeros(m,1);
PredictAble=zeros(m,1);PredictNotAble=zeros(m,1);PredictNone=zeros(m,1);

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

%% right number
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

%% Money RT
GameRT1=double(GameRT);
S3RT=GameRT1;

ControlRT=Control.*GameRT1;
MiddleRT=Middle.*GameRT1;
HardRT=Hard.*GameRT1;

RightRT=Right.*GameRT1;
WrongRT=Wrong.*GameRT1;

ControlRightRT=Control.*Right.*GameRT1;
MiddleRightRT=Middle.*Right.*GameRT1;
HardRightRT=Hard.*Right.*GameRT1;

ControlWrongRT=Control.*Wrong.*GameRT1;
MiddleWrongRT=Middle.*Wrong.*GameRT1;
HardWrongRT=Hard.*Wrong.*GameRT1;

ControlNoneRT=Control.*None.*GameRT1;
MiddleNoneRT=Middle.*None.*GameRT1;
HardNoneRT=Hard.*None.*GameRT1;

%  %% sorts
% ControlCardPresentTime=Control.*double(CardPresentTime);
% MiddleCardPresentTime=Middle.*double(CardPresentTime);
% HardCardPresentTime=Hard.*double(CardPresentTime);
% NRCardPresentTime=None.*double(CardPresentTime);
% 
% ControlPresentNS=ControlCardPresentTime(find(ControlCardPresentTime~=0));
% MiddlePresentNS=MiddleCardPresentTime(find(MiddleCardPresentTime~=0));
% HardPresentNS=HardCardPresentTime(find(HardCardPresentTime~=0));
% NRCardPresentNS=NRCardPresentTime(find(NRCardPresentTime~=0));
% endNS=endTime(115,1);
% NRCardPresentNS=[NRCardPresentNS;[endNS]];
% CarPresent_sorts={ControlPresentNS MiddlePresentNS HardPresentNS NRCardPresentNS};
% sot={ControlPresentNS/2500 MiddlePresentNS/2500 HardPresentNS/2500 NRCardPresentNS/2500};
%%
sbjinfo_RightWrongNone_S3 = {'Condition','Num_ALL_Right','Num_ControlRight','Num_MidRight','Num_HardRight', ...
                         'Num_ALL_Wrong', 'Num_ControlWrong','Num_MidWrong','Num_HardWrong' ,...
                         'Num_ALL_None', 'Num_ControlNone','Num_MidNone','Num_HardNone';...
                'number' nnz(Right) nnz(ControlRight) nnz(MiddleRight) nnz(HardRight)...
                         nnz(Wrong)  nnz(ControlWrong) nnz(MiddleWrong) nnz(HardWrong)...
                         nnz(None) nnz(ControlNone)  nnz(MiddleNone) nnz(HardNone) };
                   
%%
%S1=[RandomOrder Right Wrong PredictAble Control Middle Hard];
[order,index]=sort(S1(:,1));
S1_Order=double(S1(index,:));

S3=[RandomOrder Right Wrong PredictAble Control Middle Hard PredictNotAble];
%       1        2     3      4          5       6        7     8
[order2,index2]=sort(S3(:,1));
S3_Order=S3(index2,:);

RightAbleWrong=S1_Order(:,2).*S3_Order(:,4).*S3_Order(:,3);
Control_RightAbleWrong=S3_Order(:,5).*S1_Order(:,2).*S3_Order(:,4).*S3_Order(:,3);
Middle_RightAbleWrong=S3_Order(:,6).*S1_Order(:,2).*S3_Order(:,4).*S3_Order(:,3);
Hard_RightAbleWrong=S3_Order(:,7).*S1_Order(:,2).*S3_Order(:,4).*S3_Order(:,3);

RightAbleRight=S1_Order(:,2).*S3_Order(:,4).*S3_Order(:,2);
Control_RightAbleRight=S3_Order(:,5).*S1_Order(:,2).*S3_Order(:,4).*S3_Order(:,2);
Middle_RightAbleRight=S3_Order(:,6).*S1_Order(:,2).*S3_Order(:,4).*S3_Order(:,2);
Hard_RightAbleRight=S3_Order(:,7).*S1_Order(:,2).*S3_Order(:,4).*S3_Order(:,2);

RightNotAbleWrong=S1_Order(:,2).*S3_Order(:,8).*S3_Order(:,3);
Control_RightNotAbleWrong=S3_Order(:,5).*S1_Order(:,2).*S3_Order(:,8).*S3_Order(:,3);
Middle_RightNotAbleWrong=S3_Order(:,6).*S1_Order(:,2).*S3_Order(:,8).*S3_Order(:,3);
Hard_RightNotAbleWrong=S3_Order(:,7).*S1_Order(:,2).*S3_Order(:,8).*S3_Order(:,3);

RightNotAbleRight=S1_Order(:,2).*S3_Order(:,8).*S3_Order(:,2);
Control_RightNotAbleRight=S3_Order(:,5).*S1_Order(:,2).*S3_Order(:,8).*S3_Order(:,2);
Middle_RightNotAbleRight=S3_Order(:,6).*S1_Order(:,2).*S3_Order(:,8).*S3_Order(:,2);
Hard_RightNotAbleRight=S3_Order(:,7).*S1_Order(:,2).*S3_Order(:,8).*S3_Order(:,2);


sbjinfo_Prediction_S3 = {'Condition','Num_All', 'Num_Control','Num_Mid','Num_Hard','Num_MiddleHard'; ...
    'Right' nnz(Right) nnz(ControlRight) nnz(MiddleRight) nnz(HardRight)    nnz(MiddleRight+HardRight);...                          
    'PredictAble'  nnz(PredictAble) nnz(ControlPredictAble)  nnz(MiddlePredictAble) nnz(HardPredictAble) nnz(MiddlePredictAble+HardPredictAble);...
    'AbleRight'  nnz(RightAble) nnz(Control_RightAble)  nnz(Middle_RightAble) nnz(Hard_RightAble) nnz(Middle_RightAble+Hard_RightAble);...
    'RightAble'  S1_RightAble(1) S1_RightAble(2) S1_RightAble(3) S1_RightAble(4)  S1_RightAble(5);...
    'RightAbleWrong' nnz(RightAbleWrong) nnz(Control_RightAbleWrong)  nnz(Middle_RightAbleWrong) nnz(Hard_RightAbleWrong)   nnz(Middle_RightAbleWrong+Hard_RightAbleWrong);...
    'RightAbleRight' nnz(RightAbleRight) nnz(Control_RightAbleRight)  nnz(Middle_RightAbleRight) nnz(Hard_RightAbleRight)   nnz(Middle_RightAbleRight+Hard_RightAbleRight);...
    'RightNotAbleWrong' nnz(RightNotAbleWrong) nnz(Control_RightNotAbleWrong)  nnz(Middle_RightNotAbleWrong) nnz(Hard_RightNotAbleWrong)    nnz(Middle_RightNotAbleWrong+Hard_RightNotAbleWrong);...
    'RightNotAbleRight' nnz(RightNotAbleRight) nnz(Control_RightNotAbleRight)  nnz(Middle_RightNotAbleRight) nnz(Hard_RightNotAbleRight)    nnz(Middle_RightNotAbleRight+Hard_RightNotAbleRight);...
    'RightRT' sum(RightRT)/nnz(RightRT) sum(ControlRightRT)/nnz(ControlRightRT) sum(MiddleRightRT)/nnz(MiddleRightRT) sum(HardRightRT)/nnz(HardRightRT) sum(MiddleRightRT+HardRightRT)/nnz(MiddleRightRT+HardRightRT);...
    'WrongRT' sum(WrongRT)/nnz(WrongRT) sum(ControlWrongRT)/nnz(ControlWrongRT) sum(MiddleWrongRT)/nnz(MiddleWrongRT) sum(HardWrongRT)/nnz(HardWrongRT) sum(MiddleWrongRT+HardWrongRT)/nnz(MiddleWrongRT+HardWrongRT);...
    'S3RT'   sum(S3RT)/nnz(S3RT) sum(ControlRT)/nnz(ControlRT) sum(MiddleRT)/nnz(MiddleRT) sum(HardRT)/nnz(HardRT) sum(MiddleRT+HardRT)/nnz(MiddleRT+HardRT)};

   
    
savename=[sbjname,'_',SessType, '_AC'];
save(savename,'sbjinfo_RightWrongNone_S3','sbjinfo_Prediction_S3');
% savename=[sbjname,'_',SessType, '_sots'];
% save(savename,'sot');





%%