% compute FC time series
clear
clc
% Path settings
load('E:\nor.mat');
aal_tc = nor;
save_path = 'E:\ts_nor.mat';
% Parameter settings
length_window = 21;
length_tc = size(aal_tc,1);
n_window = length_tc-length_window;
% compute FC time series
for subi = 1:size(aal_tc,3)
    subi
    DFC = [];
    for i = 1:n_window
        FC = corr(aal_tc(i:i+length_window,:,subi));
        DFC = [DFC;zmatrix_extract(FC)];
    end
    rec_ts(:,:,subi) = DFC;
end
save(save_path,'rec_ts');
