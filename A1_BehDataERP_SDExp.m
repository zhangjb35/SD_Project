function A1_BehDataERP_SDExp(varargin)

%%
clc;
clear;
%%
Inputdir=['.'];
if nargin ==0
    scanslist=dir([Inputdir,'\*.txt']);
    for k = 1:length(scanslist)
        namefile{k}=[Inputdir,'\',scanslist(k).name]; 
    end
else
    namefile{1}=varargin{1};
end

[~, s] = size(namefile);

%%
for i = 1:s

    sbjpath = strsplit(namefile{i},'\');
    sbjname = strtok(sbjpath{2},'_');

%%
   %session 1
    fid=fopen(namefile{i});
        S1=textscan(fid, '%u%u', 'headerlines', 1);
    fclose(fid);   
      if strncmp(num2str(S1{1}),sprintf('1'),1) == 1
        S1_SessType='ANS';
    elseif strncmp(num2str(S1{1}),sprintf('2'),1) == 1
        S1_SessType='2';
      end
      

%%
         %session 3
    fid=fopen(namefile{i});
        S3=textscan(fid, '%u%u', 'headerlines', 243);
    fclose(fid);   
       if strncmp(num2str(S3{1}),sprintf('1'),1) == 1
        S3_SessType='ANS';
    elseif strncmp(num2str(S3{1}),sprintf('2'),1) == 1
        S3_SessType='2';
    elseif strncmp(num2str(S3{1}),sprintf('3'),1) == 1
        S3_SessType='NS';
%     elseif strncmp(num2str(S3{1}),sprintf('4'),1) == 1
%         S3_SessType='';
%     else
%         error('The session cannot be classified!');
       end   
  

%%
%session 1     

    fid=fopen(namefile{i});
    S1_Exp=textscan(fid,'%u%u%u%u%u%u%u%u%u%u%u%u%u%u%u%s%s%s%s%s%s%u%u%u%u%u%u%u%u%u%u%u%s%s%u%u%u%u%u%u%u%u%u%u%s%u%u%u%u%u%u%u%u%u%u%u%u%u%u%u%u%u%u',233,'headerlines',3);
    fclose(fid);
    S1_TrialNo=S1_Exp{1};
    S1_triggerresponsetime=S1_Exp{5};
    S1_DotCardpresentTIME=S1_Exp{22};
    S1_GameResponseTimePoint=S1_Exp{28};
    S1_predictpresentTIME=S1_Exp{35};
    S1_PableresponseTimePoint=S1_Exp{42};
    S1_RandomOrder=S1_Exp{7};
    S1_lownumber=S1_Exp{8};
    S1_highernumber=S1_Exp{9};     
    S1_difficulty=S1_Exp{11};
    S1_Answermark=S1_Exp{38};
    S1_predictmark=S1_Exp{39};    
    S1_CorrectAns=S1_Exp{25};
    S1_CardResponse=S1_Exp{26};
    S1_GameRT=S1_Exp{29};
    S1_PableRT=S1_Exp{43};    
    S1_rightorwrong=S1_Exp{45};
    S1_SDFixationST=S1_Exp{58};
    [m,~] = size(S1_TrialNo);  
    
    S1_CardPresentTime=S1_DotCardpresentTIME-S1_triggerresponsetime;
    S1_PredictPresentTime=S1_predictpresentTIME-S1_triggerresponsetime;
    S1_CardResponseTime=S1_GameResponseTimePoint-S1_triggerresponsetime;
    S1_PredictResponseTime=S1_PableresponseTimePoint-S1_triggerresponsetime;
    S1_endTime=S1_SDFixationST-S1_triggerresponsetime;
    
 
     [S1,S1_RightAble]=F1_Sbj_RightWrongNone_Prediction_ANS(S1_SessType,sbjname,m,S1_RandomOrder,S1_triggerresponsetime,S1_CardPresentTime,S1_CardResponseTime, S1_PredictPresentTime,S1_PredictResponseTime,S1_difficulty,S1_predictmark,S1_CorrectAns,S1_CardResponse,S1_GameRT,S1_PableRT,S1_rightorwrong,S1_endTime);   
   
     pp=[S1_RandomOrder S1_predictmark S1_Answermark];
     ppf=sortrows(pp,1);
     
    ee=[S1_RandomOrder  S1_TrialNo];
    eef=sortrows(ee,1);
  
     
  
% DotCardpresentTIME1=double(DotCardpresentTIME);
% triggerresponsetime1=double(triggerresponsetime);
% predictpresentTIME1=double(predictpresentTIME);
% GameResponseTimePoint1=double(GameResponseTimePoint);
% PableresponseTimePoint1=double(PableresponseTimePoint);



%%
% ControlCardPresentTime=Control.*CardPresentTime;
% MiddleCardPresentTime=Middle.*CardPresentTime;
% HardCardPresentTime=Hard.*CardPresentTime;

%%   
     
 %session 3
     [S3_TrialNo	S3_Instructiontime	S3_Insresponsetime	S3_triggertime	S3_triggerresponsetime	S3_Fixationtime...
         S3_RandomOrder	S3_lownumber	S3_highernumber	S3_correctanswer	S3_difficulty...	
         S3_CardRandom1	S3_CardRandom2	S3_CardRandom3	S3_CardRandom4	S3_Answercue	S3_cuedescription...
         S3_pictureCardRandom1	S3_pictureCardRandom2	S3_pictureCardRandom3	S3_pictureCardRandom4...
         S3_DotCardpresentTIME	S3_AnswerDotCardCode	S3_AnswerDotCardChoiceResultCode	S3_CorrectAns	S3_CardResponse...
         S3_DotCardandresultpresentTIME	S3_GameResponseTimePoint	S3_GameRT	S3_AnswermarkCodeUse...	
         S3_IntervalGameITI	S3_IntervalFixationST	S3_Feedback	S3_Ableliftorright	S3_predictpresentTIME...
         S3_PredictquestionCode	S3_PredictchoiceCode	S3_Answermark	S3_predictmark	S3_Pableorunable...
         S3_PablepredictresultpresentTIME	S3_PableresponseTimePoint	S3_PableRT	S3_Accuracy	S3_rightorwrong...
         S3_NrightchoicewithMoney_Mrr	S3_NwrongchoicewithMoney_Mf	S3_NcontrolrightwithMoney_Mee	S3_NmiddlerightwithMoney_Mmm	S3_NhardrightwithMoney_Mhh...
         S3_MAnswermark	S3_picturemark	S3_MPable	S3_MPunable	S3_MPredictjudge	S3_MCP	S3_MWP	S3_SDFixationST	S3_GameITI S3_rest	S3_restresponce	S3_fixzationpresent	S3_fixzationGameITI] = ...
        textread(namefile{i},'%u%u%u%u%u%u%u%u%u%u%u%u%u%u%u%s%s%s%s%s%s%u%u%u%u%u%u%u%u%u%u%u%s%s%u%u%u%u%u%u%u%u%u%u%s%u%u%u%u%u%u%u%u%u%u%u%u%u%u%u%u%u%u','headerlines',245);
   
    [m,~] = size(S3_TrialNo);
   
     dd=[S3_RandomOrder S3_TrialNo];
     ddf=sortrows(dd,1);
     aa=[ddf ppf];
     aaf=sortrows(aa,2);
   S3_predictmark = aaf(:,4);
   
   cc=[S3_RandomOrder S3_TrialNo S3_Answermark];
   ccf=sortrows(cc,1);
   ca=[ccf eef];
   caf=sortrows(ca,5);
   S3_Answermark_NS=caf(:,3);
   
   
    
    S3_CardPresentTime=S3_DotCardpresentTIME-S3_triggerresponsetime;
    S3_CardResponseTime=S3_GameResponseTimePoint-S3_triggerresponsetime;
    S3_endTime=S3_SDFixationST-S3_triggerresponsetime;
   
    F2_Sbj_RightWrongNone_Prediction_NANS(S1,S1_RightAble,S3_SessType,sbjname,m,S3_RandomOrder,S3_difficulty,S3_predictmark,S3_CorrectAns,S3_CardResponse,S3_GameRT,S3_rightorwrong,S3_CardPresentTime,S3_CardResponseTime);
  
%     F3_Sbj_RAW_RT(S1_SessType,sbjname,m,S1_RandomOrder,S1_triggerresponsetime,S1_CardPresentTime,S1_CardResponseTime, S1_PredictPresentTime,S1_PredictResponseTime,S1_difficulty,S1_predictmark,S1_CorrectAns,S1_CardResponse,S1_GameRT,S1_PableRT,S1_rightorwrong,S3_Answermark_NS, S1_endTime); 
%   F3_GetDataForKe(S1_SessType,sbjname,S1_TrialNo,S1_RandomOrder,S1_difficulty,S1_rightorwrong,S1_predictmark,S3_RandomOrder,S3_rightorwrong)

 F3_GetDataForKe_update(S1_SessType,sbjname,S1_TrialNo,S1_RandomOrder,S1_difficulty,S1_rightorwrong,S1_predictmark,S3_TrialNo,S3_RandomOrder,S3_rightorwrong,S1_lownumber,S1_highernumber, S1_GameRT,S1_PableRT,S3_GameRT)
end



%%



