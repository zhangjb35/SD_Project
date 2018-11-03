function A3_GetDataForKe_Group(varargin)

%%
clc;
clear;
%%
scanslist=dir(['.\*_data_ForKe.mat']);
Info_T=[];

for i = 1:length(scanslist)
    load(scanslist(i).name);
    Info_T=[Info_T;Info];
end

save('Data_ForKe_Group','Info_T');
