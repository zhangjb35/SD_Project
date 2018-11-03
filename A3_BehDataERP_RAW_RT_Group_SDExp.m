function A3_BehDataERP_RAW_RT_Group_SDExp(varargin)


%%
Inputdir=['.'];
if nargin ==0
    scanslist=dir([Inputdir,'\*RAW_RT*.mat']);
    for k = 1:length(scanslist)
        namefile{k}=[Inputdir,'\',scanslist(k).name]; 
    end
else
    namefile{1}=varargin{1};
end

[~, s] = size(namefile);
%%
AllNum_RAW_RT(1,:)={'sbjname' 'All_RAW_Dec_RT' 'RAW_C_Dec_RT'  'RAW_M_Dec_RT' 'RAW_H_Dec_RT' 'RAW_MH_Dec_RT'...   % 1 2 3 4 5 6                                     
                              'All_RAR_Dec_RT' 'RAR_C_Dec_RT' 'RAR_M_Dec_RT' 'RAR_H_Dec_RT' 'RAR_MH_Dec_RT'...   %  7  8  9 10  11                                   
                              'All_RNAW_Dec_RT' 'RNAW_C_Dec_RT' 'RNAW_M_Dec_RT' 'RNAW_H_Dec_RT' 'RNAW_MH_Dec_RT'...   % 12 13 14 15  16                                
                              'All_RAW_Pre_RT' 'RAW_C_Pre_RT' 'RAW_M_Pre_RT' 'RAW_H_Pre_RT' 'RAW_MH_Pre_RT'...   %  17 18 19 20  21
                              'All_RAR_Pre_RT' 'RAR_C_Pre_RT' 'RAR_M_Pre_RT' 'RAR_H_Pre_RT' 'RAR_MH_Pre_RT'...   % 22 23 24 25  26
                              'All_RNAW_Pre_RT' 'RNAW_C_Pre_RT' 'RNAW_M_Pre_RT' 'RNAW_H_Pre_RT' 'RNAW_MH_Pre_RT'};   % 27 28 29 30 31
                          
 for i = 1:s

    sbjpath = strsplit(namefile{i},'\');
    sbjname = strtok(sbjpath{2},'_');
    AllNum_RAW_RT(i+1,1)={sbjname};
    
    load(namefile{i});
    AllNum_RAW_RT(i+1,2)= sbjinfo_RAW_RT(2,2);
    AllNum_RAW_RT(i+1,3)= sbjinfo_RAW_RT(2,3);
    AllNum_RAW_RT(i+1,4)= sbjinfo_RAW_RT(2,4);
    AllNum_RAW_RT(i+1,5)= sbjinfo_RAW_RT(2,5);
    AllNum_RAW_RT(i+1,6)= sbjinfo_RAW_RT(2,6);
    
    AllNum_RAW_RT(i+1,7)= sbjinfo_RAW_RT(3,2);
    AllNum_RAW_RT(i+1,8)= sbjinfo_RAW_RT(3,3);
    AllNum_RAW_RT(i+1,9)= sbjinfo_RAW_RT(3,4);
    AllNum_RAW_RT(i+1,10)= sbjinfo_RAW_RT(3,5);
    AllNum_RAW_RT(i+1,11)= sbjinfo_RAW_RT(3,6);
    
    
    AllNum_RAW_RT(i+1,12)= sbjinfo_RAW_RT(4,2);
    AllNum_RAW_RT(i+1,13)= sbjinfo_RAW_RT(4,3);
    AllNum_RAW_RT(i+1,14)= sbjinfo_RAW_RT(4,4);
    AllNum_RAW_RT(i+1,15)= sbjinfo_RAW_RT(4,5);
    AllNum_RAW_RT(i+1,16)= sbjinfo_RAW_RT(4,6);
    
    AllNum_RAW_RT(i+1,17)= sbjinfo_RAW_RT(5,2);
    AllNum_RAW_RT(i+1,18)= sbjinfo_RAW_RT(5,3);
    AllNum_RAW_RT(i+1,19)= sbjinfo_RAW_RT(5,4);
    AllNum_RAW_RT(i+1,20)= sbjinfo_RAW_RT(5,5);
    AllNum_RAW_RT(i+1,21)= sbjinfo_RAW_RT(5,6);
    
    AllNum_RAW_RT(i+1,22)= sbjinfo_RAW_RT(6,2);
    AllNum_RAW_RT(i+1,23)= sbjinfo_RAW_RT(6,3);
    AllNum_RAW_RT(i+1,24)= sbjinfo_RAW_RT(6,4);
    AllNum_RAW_RT(i+1,25)= sbjinfo_RAW_RT(6,5);
    AllNum_RAW_RT(i+1,26)= sbjinfo_RAW_RT(6,6);
    
    AllNum_RAW_RT(i+1,27)= sbjinfo_RAW_RT(7,2);
    AllNum_RAW_RT(i+1,28)= sbjinfo_RAW_RT(7,3);
    AllNum_RAW_RT(i+1,29)= sbjinfo_RAW_RT(7,4);
    AllNum_RAW_RT(i+1,30)= sbjinfo_RAW_RT(7,5);
    AllNum_RAW_RT(i+1,31)= sbjinfo_RAW_RT(7,6);
    
 end
 %%


savename=['GroupAna_RAW_RT'];
save(savename,'AllNum_RAW_RT'); %
%%
 