function A2_BehDataERP_Group_SDExp(varargin)


%%
Inputdir=['.'];
if nargin ==0
    scanslist=dir([Inputdir,'\*_ANS*.mat']);
    for k = 1:length(scanslist)
        namefile{k}=[Inputdir,'\',scanslist(k).name]; 
    end
else
    namefile{1}=varargin{1};
end

if nargin ==0
    scanslist2=dir([Inputdir,'\*_NS*.mat']);
    for k = 1:length(scanslist2)
        namefile2{k}=[Inputdir,'\',scanslist2(k).name]; 
    end
else
    namefile2{1}=varargin{1};
end

[~, s] = size(namefile2);
%%
RightAbleWrong_Num(1,:)={'sbjname' 'All_RAW' 'Control_RAW' 'Middle_RAW' 'Hard_RAW'  'All_RAR' 'Control_RAR' 'Middle_RAR' 'Hard_RAR' 'All_RNW' 'Control_RNW' 'Middle_RNW' 'Hard_RNW' 'All_RNR' 'Control_RNR' 'Middle_RNR' 'Hard_RNR'};

for i = 1:s

    sbjpath = strsplit(namefile2{i},'\');
    sbjname = strtok(sbjpath{2},'_');
    load(namefile2{i});
    RightAbleWrong_Num(i+1,1)={sbjname};
    RightAbleWrong_Num(i+1,2)=sbjinfo_Prediction_S3(6,2);
    RightAbleWrong_Num(i+1,3)=sbjinfo_Prediction_S3(6,3);
    RightAbleWrong_Num(i+1,4)=sbjinfo_Prediction_S3(6,4);    
    RightAbleWrong_Num(i+1,5)=sbjinfo_Prediction_S3(6,5);
    
    RightAbleWrong_Num(i+1,6)=sbjinfo_Prediction_S3(7,2);
    RightAbleWrong_Num(i+1,7)=sbjinfo_Prediction_S3(7,3);
    RightAbleWrong_Num(i+1,8)=sbjinfo_Prediction_S3(7,4);
    RightAbleWrong_Num(i+1,9)=sbjinfo_Prediction_S3(7,5); 
    
    RightAbleWrong_Num(i+1,10)=sbjinfo_Prediction_S3(8,2);
    RightAbleWrong_Num(i+1,11)=sbjinfo_Prediction_S3(8,3);
    RightAbleWrong_Num(i+1,12)=sbjinfo_Prediction_S3(8,4);
    RightAbleWrong_Num(i+1,13)=sbjinfo_Prediction_S3(8,5);  
    
    RightAbleWrong_Num(i+1,14)=sbjinfo_Prediction_S3(9,2);
    RightAbleWrong_Num(i+1,15)=sbjinfo_Prediction_S3(9,3);
    RightAbleWrong_Num(i+1,16)=sbjinfo_Prediction_S3(9,4);
    RightAbleWrong_Num(i+1,17)=sbjinfo_Prediction_S3(9,5);  

end
    %%
RightAbleWrong_rate_RightAble(1,:)={'sbjname' 'All' 'Control' 'Middle' 'Hard' };

for i = 1:s

    sbjpath = strsplit(namefile2{i},'\');
    sbjname = strtok(sbjpath{2},'_');
    load(namefile2{i});
    RightAbleWrong_rate_RightAble(i+1,1)={sbjname};
    RightAbleWrong_rate_RightAble(i+1,2)={round(cell2mat(sbjinfo_Prediction_S3(6,2))/cell2mat(sbjinfo_Prediction_S3(5,2))*100)};
    RightAbleWrong_rate_RightAble(i+1,3)={round(cell2mat(sbjinfo_Prediction_S3(6,3))/cell2mat(sbjinfo_Prediction_S3(5,3))*100)};
    RightAbleWrong_rate_RightAble(i+1,4)={round(cell2mat(sbjinfo_Prediction_S3(6,4))/cell2mat(sbjinfo_Prediction_S3(5,4))*100)};
    RightAbleWrong_rate_RightAble(i+1,5)={round(cell2mat(sbjinfo_Prediction_S3(6,5))/cell2mat(sbjinfo_Prediction_S3(5,5))*100)};


end
%%
AllNum_Right_Able_Right(1,:)={'sbjname' 'All_S1Right' 'All_Able' 'All_S3Right'...   % 1 2 3 4                                        
                                         'Control_S1Right' 'Control_Able' 'Control_S3Right'...   %5 6 7                                           
                                         'Middle_S1Right' 'Middle_Able' 'Middle_S3Right'...  %8 9 10  
                                         'Hard_S1Right' 'Hard_Able' 'Hard_S3Right' ... %11 12 13 
                                         'AllSD' 'ControlSD' 'MiddleSD' 'HardSD' 'MiddleHardSD' ... %14 15 16 17 18 
                                         'AllDecept' 'ControlDecept' 'MiddleDecept' 'HardDecept' 'MiddleHardDecept' ... %19 20 21 22 23
                                         'AllBias' 'ControlBias' 'MiddleBias' 'HardBias' 'MiddleHardBias' ...  %24 25 26 27 28 
                                         'All_PredictAbleRT'  'ControlPredictAbleRT' 'MiddlePredictAbleRT' 'HardPredictAbleRT'... % 29 30 31 32
                                         'All_PredictNotAbleRT'  'ControlPredictNotAbleRT' 'MiddlePredictNotAbleRT' 'HardPredictNotAbleRT'... %33 34 35 36
                                         'All_S1RightRT' 'Control_S1RightRT'  'Middle_S1RightRT' 'Hard_S1RightRT'... % 37 38  39 40 
                                         'All_S1WrongRT' 'Control_S1WrongRT'  'Middle_S1WrongRT' 'Hard_S1WrongRT'...  %41 42 43 44
                                         'All_S3RightRT' 'Control_S3RightRT'  'Middle_S3RightRT' 'Hard_S3RightRT'...  % 45 46 47 48
                                         'All_S3WrongRT' 'Control_S3WrongRT'  'Middle_S3WrongRT' 'Hard_S3WrongRT'...   % 49 50 51 52
                                         'All_RightPredictAbleRT'  'Control_RightPredictAbleRT'  'Middle_RightPredictAbleRT'  'Hard_RightPredictAbleRT'...      % 53 54 55 56
                                         'All_RightPredictNotAbleRT'  'Control_RightPredictNotAbleRT'  'Middle_RightPredictNotAbleRT'  'Hard_RightPredictNotAbleRT'...      % 57 58 59 60
                                         'All_WrongPredictAbleRT'  'Control_WrongPredictAbleRT'  'Middle_WrongPredictAbleRT'  'Hard_WrongPredictAbleRT'...      % 61 62 63 64
                                         'All_WrongPredictNotAbleRT'  'Control_WrongPredictNotAbleRT'  'Middle_WrongPredictNotAbleRT'  'Hard_WrongPredictNotAbleRT'...    % 65 66 67 68
                                         'MHPredictAbleRT'  'MHPredictNotAbleRT'  'MH_S1RightRT'  'MH_S1WrongRT'  'MH_S3RightRT'  'MH_S3WrongRT'  ... % 69 70 71 72 73 74
                                         'MH_RightPredictAbleRT'     'MH_RightPredictNotAbleRT' 'MH_WrongPredictAbleRT' 'MH_WrongPredictNotAbleRT'...  % 75 76 77 78                                       
                                         'All_S1RT' 'Control_S1RT'  'Middle_S1RT' 'Hard_S1RT' 'MH_S1RT'... % 79 80  81 82 83
                                         'All_PredictRT'  'ControlPredictRT' 'MiddlePredictRT' 'HardPredictRT' 'MH_PredictRT' ...   % 84 85 86 87 88
                                         'All_S3RT' 'Control_S3RT'  'Middle_S3RT' 'Hard_S3RT' 'MH_S3RT'}; %  89 90 91 92 93
                                       
                                      

for i = 1:s

    sbjpath = strsplit(namefile2{i},'\');
    sbjname = strtok(sbjpath{2},'_');
    AllNum_Right_Able_Right(i+1,1)={sbjname};
    
    load(namefile{i});
    AllNum_Right_Able_Right(i+1,2)=sbjinfo_Prediction_S1(2,2);
    AllNum_Right_Able_Right(i+1,5)=sbjinfo_Prediction_S1(2,3);
    AllNum_Right_Able_Right(i+1,8)=sbjinfo_Prediction_S1(2,4);
    AllNum_Right_Able_Right(i+1,11)=sbjinfo_Prediction_S1(2,5);
    
    AllNum_Right_Able_Right(i+1,3)=sbjinfo_Prediction_S1(3,2); 
    AllNum_Right_Able_Right(i+1,6)=sbjinfo_Prediction_S1(3,3);
    AllNum_Right_Able_Right(i+1,9)=sbjinfo_Prediction_S1(3,4);
    AllNum_Right_Able_Right(i+1,12)=sbjinfo_Prediction_S1(3,5);
       
    AllNum_Right_Able_Right(i+1,29)=sbjinfo_Prediction_S1(6,2); 
    AllNum_Right_Able_Right(i+1,30)=sbjinfo_Prediction_S1(6,3);
    AllNum_Right_Able_Right(i+1,31)=sbjinfo_Prediction_S1(6,4);
    AllNum_Right_Able_Right(i+1,32)=sbjinfo_Prediction_S1(6,5);
    
    AllNum_Right_Able_Right(i+1,33)=sbjinfo_Prediction_S1(7,2); 
    AllNum_Right_Able_Right(i+1,34)=sbjinfo_Prediction_S1(7,3);
    AllNum_Right_Able_Right(i+1,35)=sbjinfo_Prediction_S1(7,4);
    AllNum_Right_Able_Right(i+1,36)=sbjinfo_Prediction_S1(7,5);
    
    AllNum_Right_Able_Right(i+1,37)=sbjinfo_Prediction_S1(8,2); 
    AllNum_Right_Able_Right(i+1,38)=sbjinfo_Prediction_S1(8,3);
    AllNum_Right_Able_Right(i+1,39)=sbjinfo_Prediction_S1(8,4);
    AllNum_Right_Able_Right(i+1,40)=sbjinfo_Prediction_S1(8,5);
       
    AllNum_Right_Able_Right(i+1,41)=sbjinfo_Prediction_S1(9,2); 
    AllNum_Right_Able_Right(i+1,42)=sbjinfo_Prediction_S1(9,3);
    AllNum_Right_Able_Right(i+1,43)=sbjinfo_Prediction_S1(9,4);
    AllNum_Right_Able_Right(i+1,44)=sbjinfo_Prediction_S1(9,5);
    
    
      AllNum_Right_Able_Right(i+1,53)=sbjinfo_Prediction_S1(10,2);
      AllNum_Right_Able_Right(i+1,54)=sbjinfo_Prediction_S1(10,3);
      AllNum_Right_Able_Right(i+1,55)=sbjinfo_Prediction_S1(10,4);
      AllNum_Right_Able_Right(i+1,56)=sbjinfo_Prediction_S1(10,5);
      
      AllNum_Right_Able_Right(i+1,57)=sbjinfo_Prediction_S1(11,2);
      AllNum_Right_Able_Right(i+1,58)=sbjinfo_Prediction_S1(11,3);
      AllNum_Right_Able_Right(i+1,59)=sbjinfo_Prediction_S1(11,4);
      AllNum_Right_Able_Right(i+1,60)=sbjinfo_Prediction_S1(11,5);
    
      AllNum_Right_Able_Right(i+1,61)=sbjinfo_Prediction_S1(12,2);
      AllNum_Right_Able_Right(i+1,62)=sbjinfo_Prediction_S1(12,3);
      AllNum_Right_Able_Right(i+1,63)=sbjinfo_Prediction_S1(12,4);
      AllNum_Right_Able_Right(i+1,64)=sbjinfo_Prediction_S1(12,5);
    
      AllNum_Right_Able_Right(i+1,65)=sbjinfo_Prediction_S1(13,2);
      AllNum_Right_Able_Right(i+1,66)=sbjinfo_Prediction_S1(13,3);
      AllNum_Right_Able_Right(i+1,67)=sbjinfo_Prediction_S1(13,4);
      AllNum_Right_Able_Right(i+1,68)=sbjinfo_Prediction_S1(13,5);
    
    %%%%
      AllNum_Right_Able_Right(i+1,69)=sbjinfo_Prediction_S1(6,6);
      AllNum_Right_Able_Right(i+1,70)=sbjinfo_Prediction_S1(7,6);
      AllNum_Right_Able_Right(i+1,71)=sbjinfo_Prediction_S1(8,6);
      AllNum_Right_Able_Right(i+1,72)=sbjinfo_Prediction_S1(9,6);
      
      AllNum_Right_Able_Right(i+1,75)=sbjinfo_Prediction_S1(10,6);
      AllNum_Right_Able_Right(i+1,76)=sbjinfo_Prediction_S1(11,6);
      AllNum_Right_Able_Right(i+1,77)=sbjinfo_Prediction_S1(12,6);
      AllNum_Right_Able_Right(i+1,78)=sbjinfo_Prediction_S1(13,6);
            
      AllNum_Right_Able_Right(i+1,79)=sbjinfo_Prediction_S1(14,2);
      AllNum_Right_Able_Right(i+1,80)=sbjinfo_Prediction_S1(14,3);
      AllNum_Right_Able_Right(i+1,81)=sbjinfo_Prediction_S1(14,4);
      AllNum_Right_Able_Right(i+1,82)=sbjinfo_Prediction_S1(14,5);
      AllNum_Right_Able_Right(i+1,83)=sbjinfo_Prediction_S1(14,6);
      
      AllNum_Right_Able_Right(i+1,84)=sbjinfo_Prediction_S1(15,2);
      AllNum_Right_Able_Right(i+1,85)=sbjinfo_Prediction_S1(15,3);
      AllNum_Right_Able_Right(i+1,86)=sbjinfo_Prediction_S1(15,4);
      AllNum_Right_Able_Right(i+1,87)=sbjinfo_Prediction_S1(15,5);
      AllNum_Right_Able_Right(i+1,88)=sbjinfo_Prediction_S1(15,6);
      
      
    
    load(namefile2{i}); 
    AllNum_Right_Able_Right(i+1,4)=sbjinfo_Prediction_S3(2,2);
    AllNum_Right_Able_Right(i+1,7)=sbjinfo_Prediction_S3(2,3);
    AllNum_Right_Able_Right(i+1,10)=sbjinfo_Prediction_S3(2,4); 
    AllNum_Right_Able_Right(i+1,13)=sbjinfo_Prediction_S3(2,5); 
    
    
    AllNum_Right_Able_Right(i+1,45)=sbjinfo_Prediction_S3(10,2);
    AllNum_Right_Able_Right(i+1,46)=sbjinfo_Prediction_S3(10,3);
    AllNum_Right_Able_Right(i+1,47)=sbjinfo_Prediction_S3(10,4); 
    AllNum_Right_Able_Right(i+1,48)=sbjinfo_Prediction_S3(10,5); 
    
    AllNum_Right_Able_Right(i+1,49)=sbjinfo_Prediction_S3(11,2);
    AllNum_Right_Able_Right(i+1,50)=sbjinfo_Prediction_S3(11,3);
    AllNum_Right_Able_Right(i+1,51)=sbjinfo_Prediction_S3(11,4); 
    AllNum_Right_Able_Right(i+1,52)=sbjinfo_Prediction_S3(11,5); 
    
    
    AllNum_Right_Able_Right(i+1,73)=sbjinfo_Prediction_S3(10,6); 
    AllNum_Right_Able_Right(i+1,74)=sbjinfo_Prediction_S3(11,6); 
    
    AllNum_Right_Able_Right(i+1,89)=sbjinfo_Prediction_S3(12,2);
    AllNum_Right_Able_Right(i+1,90)=sbjinfo_Prediction_S3(12,3);
    AllNum_Right_Able_Right(i+1,91)=sbjinfo_Prediction_S3(12,4); 
    AllNum_Right_Able_Right(i+1,92)=sbjinfo_Prediction_S3(12,5); 
    AllNum_Right_Able_Right(i+1,93)=sbjinfo_Prediction_S3(12,6); 
    
    
        a=cell2mat(AllNum_Right_Able_Right(i+1,2));
        b=cell2mat(AllNum_Right_Able_Right(i+1,4));
        p=cell2mat(AllNum_Right_Able_Right(i+1,3));      
        AllNum_Right_Able_Right(i+1,19)={(a-b)/(b)}; %deception
        AllNum_Right_Able_Right(i+1,24)={(p-b)/(b)}; %estimate bias
        
    if cell2mat(AllNum_Right_Able_Right(i+1,2)) > cell2mat(AllNum_Right_Able_Right(i+1,4))
         AllNum_Right_Able_Right(i+1,14)={(p-b)/(a-b)}; %self-deception
        a=0;b=0;p=0;
    else
        AllNum_Right_Able_Right(i+1,14)={99999999};
         
    end
    
        a=cell2mat(AllNum_Right_Able_Right(i+1,5));
        b=cell2mat(AllNum_Right_Able_Right(i+1,7));
        p=cell2mat(AllNum_Right_Able_Right(i+1,6));       
        AllNum_Right_Able_Right(i+1,20)={(a-b)/(b)}; %deception
        AllNum_Right_Able_Right(i+1,25)={(p-b)/(b)}; %estimate bias
        
    if cell2mat(AllNum_Right_Able_Right(i+1,5)) > cell2mat(AllNum_Right_Able_Right(i+1,7))
        AllNum_Right_Able_Right(i+1,15)={(p-b)/(a-b)};
        a=0;b=0;p=0;
    else
        AllNum_Right_Able_Right(i+1,15)={99999999};
   
    end
    
        a=cell2mat(AllNum_Right_Able_Right(i+1,8));
        b=cell2mat(AllNum_Right_Able_Right(i+1,10));
        p=cell2mat(AllNum_Right_Able_Right(i+1,9));      
        AllNum_Right_Able_Right(i+1,21)={(a-b)/(b)}; %deception
        AllNum_Right_Able_Right(i+1,26)={(p-b)/(b)}; %estimate bias 
        
    if cell2mat(AllNum_Right_Able_Right(i+1,8)) > cell2mat(AllNum_Right_Able_Right(i+1,10)) 
         AllNum_Right_Able_Right(i+1,16)={(p-b)/(a-b)};
        a=0;b=0;p=0;
    else
        AllNum_Right_Able_Right(i+1,16)={99999999};    
    end
    
        a=cell2mat(AllNum_Right_Able_Right(i+1,11));
        b=cell2mat(AllNum_Right_Able_Right(i+1,13));
        p=cell2mat(AllNum_Right_Able_Right(i+1,12));       
        AllNum_Right_Able_Right(i+1,22)={(a-b)/(b)}; %deception
        AllNum_Right_Able_Right(i+1,27)={(p-b)/(b)}; %estimate bias
        
    if cell2mat(AllNum_Right_Able_Right(i+1,11)) > cell2mat(AllNum_Right_Able_Right(i+1,13))
        AllNum_Right_Able_Right(i+1,17)={(p-b)/(a-b)};
        a=0;b=0;p=0;
    else
        AllNum_Right_Able_Right(i+1,17)={99999999};      
    end    
    
    
    a2=cell2mat(AllNum_Right_Able_Right(i+1,8))+cell2mat(AllNum_Right_Able_Right(i+1,11));
    b2=cell2mat(AllNum_Right_Able_Right(i+1,10))+cell2mat(AllNum_Right_Able_Right(i+1,13));
    p2=cell2mat(AllNum_Right_Able_Right(i+1,9))+cell2mat(AllNum_Right_Able_Right(i+1,12));  
    AllNum_Right_Able_Right(i+1,23)={(a2-b2)/(b2)};
    AllNum_Right_Able_Right(i+1,28)={(p2-b2)/(b2)};
        
    if a2 > b2
        AllNum_Right_Able_Right(i+1,18)={(p2-b2)/(a2-b2)};       
          a2=0;b2=0;p2=0;
    else
        AllNum_Right_Able_Right(i+1,18)={99999999};       
    end 

      
end

%%


savename=['GroupAna'];
save(savename,'RightAbleWrong_Num','RightAbleWrong_rate_RightAble', 'AllNum_Right_Able_Right'); %
%%



