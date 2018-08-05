% compute sample entropy of FC time series using the function 'SampEn'
clear
clc
% Path settings
load('E:\ts_nor.mat')
save_path = ...
    'E:\SampEn_nor.mat';
% Parameter settings
m = 2;
r = 0.2;
nFC = 4005;
% compute SampEn
SampEn_DFC = [];
for subi = 1:size(rec_ts,3)
    display(['Processing the ',num2str(subi),'th subject'])
    SampEn_DFC_t = [];
    for i = 1:nFC
        val = zSampEn(rec_ts(:,i,subi),m,r);
        SampEn_DFC_t = [SampEn_DFC_t,val];
    end
    SampEn_DFC = [SampEn_DFC;SampEn_DFC_t];
end
save(save_path,'SampEn_DFC');