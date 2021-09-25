clear all
rootDIR         = '/data/netapp01/work/rebekah/copyof_YSAD1/1_HC/Group level/practice';

subjects = {'H005'
'H007'
'H012'
'H014'
'H016'
'H017'
'H018'
'H019'
'H020'
'H022'
'H024'
'H025'
'H030'
'H031'
'H033'
'H034'
'H038'
'H039'
'H042'
'H043'
'H044'
'H046'
'H047'
'H050'
'H051'
'H056'
'H057'
'H058'
'H060'
'H062'
'H063'
'H064'
'H066'
'H067'
'H068'
'H069'
'H071'
'H073'
'H078'
'H080'
'H081'
'H085'
'H088'
'H089'
'H093'
'H094'
'H095'
'H097'
'H098'
'H100'
'H101'
'H104'
'H108'
'H109'
'H111'
'H112'
'H116'
'H119'
'H121'
'H123'
'H124'
'H125'
'H126'
'H127'
'H128'
'H131'
'H136'
'H138'
'H139'
'H140'
'H141'
'H142'
'H145'
'H149'
'H150'
'H153'
'H155'
'H157'
'H159'
'H160'
'H162'
'H163'
'H164'
'H165'
'H168'
'H170'
'H171'
'H172'
'H175'
'H176'
'H177'
'H178'
'H179'
'H180'
'H183'
'H187'
'H188'
'H193'
'H197'
'H198'
'H201'
'H202'
'H206'
'H212'
};

fileID = fopen('bma_name.txt','a+');
fprintf(fileID, 'Participant');


fileID = fopen('self_MPFC_PCC.txt','a+');
fprintf(fileID,'self_MPFC_PCC');


fileID = fopen('self_PCC_MPFC.txt','a+');
fprintf(fileID, 'self_PCC_MPFC');


fileID = fopen('self_MPFC_lIPL.txt','a+');
fprintf(fileID, 'self_MPFC_lIPL');


fileID = fopen('self_lIPL_MPFC.txt','a+');
fprintf(fileID, 'self_lIPL_MPFC');


fileID = fopen('self_lIPL_PCC.txt','a+');
fprintf(fileID, 'self_lIPL_PCC');


fileID = fopen('self_PCC_lIPL.txt','a+');
fprintf(fileID, 'self_PCC_lIPL');


fileID = fopen('other_MPFC_PCC.txt','a+');
fprintf(fileID, 'other_MPFC_PCC');


fileID = fopen('other_PCC_MPFC.txt','a+');
fprintf(fileID, 'other_PCC_MPFC');


fileID = fopen('other_MPFC_lIPL.txt','a+');
fprintf(fileID, 'other_MPFC_lIPL');


fileID = fopen('other_lIPL_MPFC.txt','a+');
fprintf(fileID, 'other_lIPL_MPFC');

fileID = fopen('other_lIPL_PCC.txt','a+');
fprintf(fileID, 'other_lIPL_PCC');

fileID = fopen('other_PCC_lIPL.txt','a+');
fprintf(fileID, 'other_PCC_lIPL');


% make sure the scriptdir is in the path
addpath(rootDIR);
fprintf(' Yeah, take it away, Ernie! Fasten your safety belts, clench your buttocks! Its going be a bumpy ride!')

% Load .mats
load(fullfile('BMS.mat'));

% create a subject loop
for s = 1:length(subjects)
subject = subjects{s};

fileID = fopen('bma_name.txt','a+');
fprintf(fileID, '\n');
fprintf(fileID, subject);


fclose(fileID);

x = BMS.DCM.rfx.bma.mEps{1,s}.B(1,2,2);
fileID = fopen('self_MPFC_PCC.txt','a+');
fprintf(fileID, '\n');
fprintf(fileID, " %f ", x);


fclose(fileID);

x = BMS.DCM.rfx.bma.mEps{1,s}.B(2,1,2);
fileID = fopen('self_PCC_MPFC.txt','a+');
fprintf(fileID, '\n');
fprintf(fileID, " %f ", x);


fclose(fileID);

x = BMS.DCM.rfx.bma.mEps{1,s}.B(1,3,2);
fileID = fopen('self_MPFC_lIPL.txt','a+');
fprintf(fileID, '\n');
fprintf(fileID, " %f ", x);


fclose(fileID);

x = BMS.DCM.rfx.bma.mEps{1,s}.B(3,1,2);
fileID = fopen('self_lIPL_MPFC.txt','a+');
fprintf(fileID, '\n');
fprintf(fileID, " %f ", x);


fclose(fileID);

x = BMS.DCM.rfx.bma.mEps{1,s}.B(3,2,2);
fileID = fopen('self_lIPL_PCC.txt','a+');
fprintf(fileID, '\n');
fprintf(fileID, " %f ", x);


fclose(fileID);

x = BMS.DCM.rfx.bma.mEps{1,s}.B(2,3,2);
fileID = fopen('self_PCC_lIPL.txt','a+');
fprintf(fileID, '\n');
fprintf(fileID, " %f ", x);


fclose(fileID);

x = BMS.DCM.rfx.bma.mEps{1,s}.B(1,2,4);
fileID = fopen('other_MPFC_PCC.txt','a+');
fprintf(fileID, '\n');
fprintf(fileID, " %f ", x);


fclose(fileID);

x = BMS.DCM.rfx.bma.mEps{1,s}.B(2,1,4);
fileID = fopen('other_PCC_MPFC.txt','a+');
fprintf(fileID, '\n');
fprintf(fileID, " %f ", x);


fclose(fileID);

x = BMS.DCM.rfx.bma.mEps{1,s}.B(1,3,4);
fileID = fopen('other_MPFC_lIPL.txt','a+');
fprintf(fileID, '\n');
fprintf(fileID, " %f ", x);


fclose(fileID);

x = BMS.DCM.rfx.bma.mEps{1,s}.B(3,1,4); 
fileID = fopen('other_lIPL_MPFC.txt','a+');
fprintf(fileID, '\n');
fprintf(fileID, " %f ", x);


fclose(fileID);

x = BMS.DCM.rfx.bma.mEps{1,s}.B(3,2,4); 
fileID = fopen('other_lIPL_PCC.txt','a+');
fprintf(fileID, '\n');
fprintf(fileID, " %f ", x);


fclose(fileID);

x = BMS.DCM.rfx.bma.mEps{1,s}.B(2,3,4); 
fileID = fopen('other_PCC_lIPL.txt','a+');
fprintf(fileID, '\n');
fprintf(fileID, " %f ", x);


fclose(fileID);


end
