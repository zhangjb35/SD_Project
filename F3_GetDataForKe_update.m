function F3_GetDataForKe_update(S1_SessType,sbjname,S1_TrialNo,S1_RandomOrder,S1_difficulty,S1_rightorwrong,S1_PredictMark,S3_TrialNo,S3_RandomOrder,S3_rightorwrong,S1_lownumber,S1_highernumber, S1_GameRT,S1_PableRT,S3_GameRT)
%%

n=length(S1_TrialNo)
m=length(S3_rightorwrong)

for i = 1:m
    if strncmp(S3_rightorwrong{i},sprintf('rightchoice'),4) == 1
        S3_Right01Code(i,1)=1;%1:right
    elseif strncmp(S3_rightorwrong{i},sprintf('wrongchoice'),4) == 1
        S3_Right01Code(i,1)=0;%0:wrong
    else
        S3_Right01Code(i,1)=9999;
    end
    
    if S3_GameRT(i)>0
        S3_RT(i,1)= S3_GameRT(i);
    else
        S3_RT(i,1)= 9999;
    end    
    
end

for i = 1:n
    
    if strncmp(S1_rightorwrong{i},sprintf('rightchoice'),4) == 1
        S1_Right01Code(i,1)=1;%1:right
    elseif strncmp(S1_rightorwrong{i},sprintf('wrongchoice'),4) == 1
        S1_Right01Code(i,1)=0;%0:wrong
    else
        S1_Right01Code(i,1)=9999;
    end
    
    if S1_PredictMark(i) == 1
        S1_Able01Code(i,1)=1;%1:able
    elseif S1_PredictMark(i) == 2
        S1_Able01Code(i,1)=0;%0:not able
    else
        S1_Able01Code(i,1)=9999;
    end
    sbjID(i,1)=str2num(sbjname);
    
    row=find(S3_RandomOrder==S1_RandomOrder(i));
    S3S1_Right01Code(i,1)=S3_Right01Code(row);
    S3S1_RT(i,1)=S3_RT(row);
    clear row;
    
    if  S1_Right01Code(i,1)==1 & S3S1_Right01Code(i,1)==0
            S1RightS3Wrong(i,1)=1; % 1: S1:Right & S3:Wrong
    else 
            S1RightS3Wrong(i,1)=0; % 1: S1:Right & S3:Right
    end
    
    if S1_GameRT(i)>0
        S1_RT(i,1)= S1_GameRT(i);
    else
        S1_RT(i,1)= 9999;
    end
    
    if  S1_PableRT(i)>0
        S1_PredRT(i,1)= S1_PableRT(i);
    else
        S1_PredRT(i,1)= 9999;
    end
        
    
end
a=[S1_TrialNo S1_RandomOrder];
aa=sortrows(a,2);
b=[S3_TrialNo S3_RandomOrder S3_GameRT];
bb=sortrows(b,2);
c=[aa bb];
cc=sortrows(c,1);
S3S1_TrialNo=cc(:,3);
S3S1_RandomOrder=cc(:,4);
% S3S1_RightRT=cc(:,5);



Info=[sbjID,S1_TrialNo,S1_RandomOrder,S1_difficulty,S1_Right01Code,S1_Able01Code,S3S1_Right01Code,S1RightS3Wrong, S3S1_TrialNo,S3S1_RandomOrder S1_lownumber,S1_highernumber, S1_RT, S1_PredRT, S3S1_RT];
savename=[sbjname,'_data_ForKe'];
save(savename,'Info');



%%