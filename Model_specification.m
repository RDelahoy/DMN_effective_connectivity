   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DYNAMIC CAUSAL MODELLING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


load(fullfile(data_path,'SPM.mat'));

load(fullfile(data_path,'VOI_MPFC_1.mat'),'xY');
DCM.xY(1) = xY;
load(fullfile(data_path,'VOI_PCC_1.mat'),'xY');
DCM.xY(2) = xY;
load(fullfile(data_path,'VOI_left IPL_1.mat'),'xY');
DCM.xY(3) = xY;


DCM.n = length(DCM.xY);      % number of regions
DCM.v = length(DCM.xY(1).u); % number of time points

% Time series
%

DCM.Y.dt  = SPM.xY.RT;
DCM.Y.X0  = DCM.xY(1).X0;
for i = 1:DCM.n
    DCM.Y.y(:,i)  = DCM.xY(i).u;
    DCM.Y.name{i} = DCM.xY(i).name;
end

DCM.Y.Q    = spm_Ce(ones(1,DCM.n)*DCM.v);

% Experimental inputs

DCM.U.dt   =  SPM.Sess.U(1).dt;
DCM.U.name = [SPM.Sess.U.name];
DCM.U.u    = [SPM.Sess.U(1).u(33:end,1) ...
              SPM.Sess.U(2).u(33:end,1) ...
              SPM.Sess.U(3).u(33:end,1) ...
              SPM.Sess.U(4).u(33:end,1) ...
              SPM.Sess.U(5).u(33:end,1)];

DCM.delays = repmat(SPM.xY.RT/2,DCM.n,1);
DCM.TE     = 0.035;

DCM.options.nonlinear  = 1;
DCM.options.two_state  = 0;
DCM.options.stochastic = 0;
DCM.options.centre    = 0;
DCM.options.induced    = 0;

% SPECIFICATION DCM 1 - "1x1"
%-------------------------------------------------------------------------
DCM.a = [1,1,1; 1,1,1; 1,1,1];
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,3,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,3,4)= 1;  
DCM.c = [0 0 0 0 0; 1 1 0 1 0; 0 0 0 0 0];
DCM.d = zeros(3,3,0);

save(fullfile(data_path,'DCM_model_1_1x1.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_2_2x2.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_3_3x3.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; 

save(fullfile(data_path,'DCM_model_4_4x4.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_5_5x5.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_6_6x6.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_7_7x7.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_8_8x8.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_9_9x9.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_10_10x10.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;
save(fullfile(data_path,'DCM_model_11_11x11.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_12_12x12.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_13_13x13.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_14_14x14.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_15_15x15.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5);

save(fullfile(data_path,'DCM_model_16_16x16.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_17_17x17.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_18_18x18.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_19_19x19.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_20_20x20.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_21_21x21.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_22_22x22.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_23_23x23.mat'),'DCM');

% SPECIFICATION DCM 1 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_24_24x24.mat'),'DCM');

% SPECIFICATION DCM 2 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1;  DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,3,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1;  

save(fullfile(data_path,'DCM_model_25_1x2.mat'),'DCM');

% SPECIFICATION DCM 2 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1;  DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,3,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_26_1x3.mat'),'DCM');

% SPECIFICATION DCM 2 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1;DCM.b(2,3,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; 

save(fullfile(data_path,'DCM_model_27_1x4.mat'),'DCM');

% SPECIFICATION DCM 2 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_28_1x5.mat'),'DCM');

% SPECIFICATION DCM 2 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_29_1x6.mat'),'DCM');

% SPECIFICATION DCM 2 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_30_1x7.mat'),'DCM');

% SPECIFICATION DCM 2 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_31_1x8.mat'),'DCM');

% SPECIFICATION DCM 2 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_32_1x9.mat'),'DCM');
% SPECIFICATION DCM 2 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_33_1x10.mat'),'DCM');

% SPECIFICATION DCM 2 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_34_1x11.mat'),'DCM');

% SPECIFICATION DCM 2 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_35_1x12.mat'),'DCM');

% SPECIFICATION DCM 2 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_36_1x13.mat'),'DCM');

% SPECIFICATION DCM 2 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_37_1x14.mat'),'DCM');

% SPECIFICATION DCM 2 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_38_1x15.mat'),'DCM');

% SPECIFICATION DCM 2 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1;

save(fullfile(data_path,'DCM_model_39_1x16.mat'),'DCM');

% SPECIFICATION DCM 2 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_40_1x17.mat'),'DCM');

% SPECIFICATION DCM 2 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1;DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_41_1x18.mat'),'DCM');

% SPECIFICATION DCM 2 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_42_1x19.mat'),'DCM');

% SPECIFICATION DCM 2 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_43_1x20.mat'),'DCM');

% SPECIFICATION DCM 2 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_44_1x21.mat'),'DCM');

% SPECIFICATION DCM 2 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_45_1x22.mat'),'DCM');

% SPECIFICATION DCM 2 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_46_1x23.mat'),'DCM');

% SPECIFICATION DCM 2 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_47_1x24.mat'),'DCM');

% SPECIFICATION DCM 3 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_48_2x1.mat'),'DCM');

% SPECIFICATION DCM 3 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_49_2x3.mat'),'DCM');

% SPECIFICATION DCM 3 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; 

save(fullfile(data_path,'DCM_model_50_2x4.mat'),'DCM');

% SPECIFICATION DCM 3 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_51_2x5.mat'),'DCM');

% SPECIFICATION DCM 3 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_52_2x6.mat'),'DCM');

% SPECIFICATION DCM 3 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_53_2x7.mat'),'DCM');

% SPECIFICATION DCM 3 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_54_2x8.mat'),'DCM');

% SPECIFICATION DCM 3 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_55_2x9.mat'),'DCM');

% SPECIFICATION DCM 3 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_56_2x10.mat'),'DCM');

% SPECIFICATION DCM 3 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_57_2x11.mat'),'DCM');

% SPECIFICATION DCM 3 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_58_2x12.mat'),'DCM');

% SPECIFICATION DCM 3 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_59_2x13.mat'),'DCM');

% SPECIFICATION DCM 3 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_60_2x14.mat'),'DCM');

% SPECIFICATION DCM 3 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_61_2x15.mat'),'DCM');

% SPECIFICATION DCM 3 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1;

save(fullfile(data_path,'DCM_model_62_2x16.mat'),'DCM');

% SPECIFICATION DCM 3 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_63_2x17.mat'),'DCM');

% SPECIFICATION DCM 3 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_64_2x18.mat'),'DCM');

% SPECIFICATION DCM 3 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_65_2x19.mat'),'DCM');

% SPECIFICATION DCM 3 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_66_2x20.mat'),'DCM');

% SPECIFICATION DCM 3 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_67_2x21.mat'),'DCM');

% SPECIFICATION DCM 3 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_68_2x22.mat'),'DCM');

% SPECIFICATION DCM 3 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_69_2x23.mat'),'DCM');

% SPECIFICATION DCM 3 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_70_2x24.mat'),'DCM');

% SPECIFICATION DCM 4 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(1,3,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_71_3x1.mat'),'DCM');

% SPECIFICATION DCM 4 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_72_3x2.mat'),'DCM');

% SPECIFICATION DCM 4 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; 

save(fullfile(data_path,'DCM_model_73_3x4.mat'),'DCM');

% SPECIFICATION DCM 4 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_74_3x5.mat'),'DCM');

% SPECIFICATION DCM 4 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_75_3x6.mat'),'DCM');

% SPECIFICATION DCM 4 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_76_3x7.mat'),'DCM');

% SPECIFICATION DCM 4 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_77_3x8.mat'),'DCM');

% SPECIFICATION DCM 4 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_78_3x9.mat'),'DCM');

% SPECIFICATION DCM 4 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_79_3x10.mat'),'DCM');

% SPECIFICATION DCM 4 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_80_3x11.mat'),'DCM');

% SPECIFICATION DCM 4 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_81_3x12.mat'),'DCM');

% SPECIFICATION DCM 4 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_82_3x13.mat'),'DCM');

% SPECIFICATION DCM 4 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_83_3x14.mat'),'DCM');

% SPECIFICATION DCM 4 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_84_3x15.mat'),'DCM');

% SPECIFICATION DCM 4 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1;

save(fullfile(data_path,'DCM_model_85_3x16.mat'),'DCM');

% SPECIFICATION DCM 4 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_86_3x17.mat'),'DCM');

% SPECIFICATION DCM 4 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_87_3x18.mat'),'DCM');

% SPECIFICATION DCM 4 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_88_3x19.mat'),'DCM');

% SPECIFICATION DCM 4 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_89_3x20.mat'),'DCM');

% SPECIFICATION DCM 4 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_90_3x21.mat'),'DCM');

% SPECIFICATION DCM 4 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_91_3x22.mat'),'DCM');

% SPECIFICATION DCM 4 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_92_3x23.mat'),'DCM');

% SPECIFICATION DCM 4 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_93_3x24.mat'),'DCM');

% SPECIFICATION DCM 5 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_94_4x1.mat'),'DCM');

% SPECIFICATION DCM 5 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_95_4x2.mat'),'DCM');

% SPECIFICATION DCM 5 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_96_4x3.mat'),'DCM');

% SPECIFICATION DCM 5 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_97_4x5.mat'),'DCM');

% SPECIFICATION DCM 5 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_98_4x6.mat'),'DCM');

% SPECIFICATION DCM 5 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_99_4x7.mat'),'DCM');

% SPECIFICATION DCM 5 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_100_4x8.mat'),'DCM');

% SPECIFICATION DCM 5 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_101_4x9.mat'),'DCM');

% SPECIFICATION DCM 5 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_102_4x10.mat'),'DCM');

% SPECIFICATION DCM 5 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_103_4x11.mat'),'DCM');

% SPECIFICATION DCM 5 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_104_4x12.mat'),'DCM');

% SPECIFICATION DCM 5 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_105_4x13.mat'),'DCM');

% SPECIFICATION DCM 5 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_106_4x14.mat'),'DCM');

% SPECIFICATION DCM 5 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_107_4x15.mat'),'DCM');

% SPECIFICATION DCM 5 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1;

save(fullfile(data_path,'DCM_model_108_4x16.mat'),'DCM');

% SPECIFICATION DCM 5 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_109_4x17.mat'),'DCM');

% SPECIFICATION DCM 5 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_110_4x18.mat'),'DCM');

% SPECIFICATION DCM 5 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_110_4x19.mat'),'DCM');

% SPECIFICATION DCM 5 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_111_4x20.mat'),'DCM');

% SPECIFICATION DCM 5 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_112_4x21.mat'),'DCM');

% SPECIFICATION DCM 5 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_113_4x22.mat'),'DCM');

% SPECIFICATION DCM 5 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_114_4x23.mat'),'DCM');

% SPECIFICATION DCM 5 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_115_4x24.mat'),'DCM');

% SPECIFICATION DCM 6 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(1,3,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_116_5x1.mat'),'DCM');

% SPECIFICATION DCM 6 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_117_5x2.mat'),'DCM');

% SPECIFICATION DCM 6 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_118_5x3.mat'),'DCM');

% SPECIFICATION DCM 6 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_119_5x4.mat'),'DCM');

% SPECIFICATION DCM 6 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_120_5x6.mat'),'DCM');

% SPECIFICATION DCM 6 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_121_5x7.mat'),'DCM');

% SPECIFICATION DCM 6 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_122_5x8.mat'),'DCM');

% SPECIFICATION DCM 6 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_123_5x9.mat'),'DCM');

% SPECIFICATION DCM 6 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_124_5x10.mat'),'DCM');

% SPECIFICATION DCM 6 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_125_5x11.mat'),'DCM');

% SPECIFICATION DCM 6 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_126_5x12.mat'),'DCM');

% SPECIFICATION DCM 6 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_127_5x13.mat'),'DCM');

% SPECIFICATION DCM 6 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_128_5x14.mat'),'DCM');

% SPECIFICATION DCM 6 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_129_5x15.mat'),'DCM');

% SPECIFICATION DCM 6 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1;

save(fullfile(data_path,'DCM_model_130_5x16.mat'),'DCM');

% SPECIFICATION DCM 6 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_131_5x17.mat'),'DCM');

% SPECIFICATION DCM 6 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_132_5x18.mat'),'DCM');

% SPECIFICATION DCM 6 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_133_5x19.mat'),'DCM');

% SPECIFICATION DCM 6 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_134_5x20.mat'),'DCM');

% SPECIFICATION DCM 6 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_135_5x21.mat'),'DCM');

% SPECIFICATION DCM 6 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_136_5x22.mat'),'DCM');

% SPECIFICATION DCM 6 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_137_5x23.mat'),'DCM');

% SPECIFICATION DCM 6 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_138_5x24.mat'),'DCM');

% SPECIFICATION DCM 7 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_139_6x1.mat'),'DCM');

% SPECIFICATION DCM 7 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_140_6x2.mat'),'DCM');

% SPECIFICATION DCM 7 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_141_6x3.mat'),'DCM');

% SPECIFICATION DCM 7 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 
save(fullfile(data_path,'DCM_model_142_6x4.mat'),'DCM');

% SPECIFICATION DCM 7 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_143_6x5.mat'),'DCM');

% SPECIFICATION DCM 7 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_144_6x7.mat'),'DCM');

% SPECIFICATION DCM 7 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_145_6x8.mat'),'DCM');

% SPECIFICATION DCM 7 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_146_6x9.mat'),'DCM');

% SPECIFICATION DCM 7 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_147_6x10.mat'),'DCM');

% SPECIFICATION DCM 7 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_148_6x11.mat'),'DCM');

% SPECIFICATION DCM 7 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_149_6x12.mat'),'DCM');

% SPECIFICATION DCM 7 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_150_6x13.mat'),'DCM');

% SPECIFICATION DCM 7 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_151_6x14.mat'),'DCM');

% SPECIFICATION DCM 7 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_152_6x15.mat'),'DCM');

% SPECIFICATION DCM 7 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1;

save(fullfile(data_path,'DCM_model_153_6x16.mat'),'DCM');

% SPECIFICATION DCM 7 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_154_6x17.mat'),'DCM');

% SPECIFICATION DCM 7 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_155_6x18.mat'),'DCM');

% SPECIFICATION DCM 7 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_156_6x19.mat'),'DCM');

% SPECIFICATION DCM 7 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_157_6x20.mat'),'DCM');

% SPECIFICATION DCM 7 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_158_6x21.mat'),'DCM');

% SPECIFICATION DCM 7 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_159_6x22.mat'),'DCM');

% SPECIFICATION DCM 7 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_160_6x23.mat'),'DCM');

% SPECIFICATION DCM 7 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_161_6x24.mat'),'DCM');

% SPECIFICATION DCM 8 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_162_7x1.mat'),'DCM');

% SPECIFICATION DCM 8 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_163_7x2.mat'),'DCM');

% SPECIFICATION DCM 8 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_164_7x3.mat'),'DCM');

% SPECIFICATION DCM 8 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 
save(fullfile(data_path,'DCM_model_165_7x4.mat'),'DCM');

% SPECIFICATION DCM 8 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_166_7x5.mat'),'DCM');

% SPECIFICATION DCM 8 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_167_7x6.mat'),'DCM');

% SPECIFICATION DCM 8- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_168_7x8.mat'),'DCM');

% SPECIFICATION DCM 8- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_169_7x9.mat'),'DCM');

% SPECIFICATION DCM 8- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_170_7x10.mat'),'DCM');

% SPECIFICATION DCM 8- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_171_7x11.mat'),'DCM');

% SPECIFICATION DCM 8- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_172_7x12.mat'),'DCM');

% SPECIFICATION DCM 8- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_173_7x13.mat'),'DCM');

% SPECIFICATION DCM 8- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_174_7x14.mat'),'DCM');

% SPECIFICATION DCM 8- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_175_7x15.mat'),'DCM');

% SPECIFICATION DCM 8- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1;

save(fullfile(data_path,'DCM_model_176_7x16.mat'),'DCM');

% SPECIFICATION DCM 8 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_177_7x17.mat'),'DCM');

% SPECIFICATION DCM 8 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_178_7x18.mat'),'DCM');

% SPECIFICATION DCM 8 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_179_7x19.mat'),'DCM');

% SPECIFICATION DCM 8 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_180_7x20.mat'),'DCM');

% SPECIFICATION DCM 8 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_181_7x21.mat'),'DCM');

% SPECIFICATION DCM 8 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_182_7x22.mat'),'DCM');

% SPECIFICATION DCM 8 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_183_7x23.mat'),'DCM');

% SPECIFICATION DCM 8 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_184_7x24.mat'),'DCM');

% SPECIFICATION DCM 9 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_185_8x1.mat'),'DCM');

% SPECIFICATION DCM 9 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_186_8x2.mat'),'DCM');

% SPECIFICATION DCM 9 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_187_8x3.mat'),'DCM');

% SPECIFICATION DCM 9 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 
save(fullfile(data_path,'DCM_model_188_8x4.mat'),'DCM');

% SPECIFICATION DCM 9 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_189_8x5.mat'),'DCM');

% SPECIFICATION DCM 9 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_190_8x6.mat'),'DCM');

% SPECIFICATION DCM 9- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_191_8x7.mat'),'DCM');

% SPECIFICATION DCM 9- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_192_8x9.mat'),'DCM');

% SPECIFICATION DCM 9- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_193_8x10.mat'),'DCM');

% SPECIFICATION DCM 9- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_194_8x11.mat'),'DCM');

% SPECIFICATION DCM 9- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_195_8x12.mat'),'DCM');

% SPECIFICATION DCM 9- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_196_8x13.mat'),'DCM');

% SPECIFICATION DCM 9- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_197_8x14.mat'),'DCM');

% SPECIFICATION DCM 9- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_198_8x15.mat'),'DCM');

% SPECIFICATION DCM 9- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1;

save(fullfile(data_path,'DCM_model_199_8x16.mat'),'DCM');

% SPECIFICATION DCM 9 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_200_8x17.mat'),'DCM');

% SPECIFICATION DCM 9 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_201_8x18.mat'),'DCM');

% SPECIFICATION DCM 9 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_202_8x19.mat'),'DCM');

% SPECIFICATION DCM 9 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_203_8x20.mat'),'DCM');

% SPECIFICATION DCM 9 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_204_8x21.mat'),'DCM');

% SPECIFICATION DCM 9 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_205_8x22.mat'),'DCM');

% SPECIFICATION DCM 9 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_206_8x23.mat'),'DCM');

% SPECIFICATION DCM 9 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_207_8x24.mat'),'DCM'); 

% SPECIFICATION DCM 10 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(1,3,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_208_9x1.mat'),'DCM');

% SPECIFICATION DCM 10 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_209_9x2.mat'),'DCM');

% SPECIFICATION DCM 10 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_210_9x3.mat'),'DCM');

% SPECIFICATION DCM 10 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 
save(fullfile(data_path,'DCM_model_211_9x4.mat'),'DCM');

% SPECIFICATION DCM 10 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_212_9x5.mat'),'DCM');

% SPECIFICATION DCM 10 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_213_9x6.mat'),'DCM');

% SPECIFICATION DCM 10- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_214_9x7.mat'),'DCM');

% SPECIFICATION DCM 10- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_215_9x8.mat'),'DCM');

% SPECIFICATION DCM 10- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_216_9x10.mat'),'DCM');

% SPECIFICATION DCM 10- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_217_9x11.mat'),'DCM');

% SPECIFICATION DCM 10- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_218_9x12.mat'),'DCM');

% SPECIFICATION DCM 10- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_219_9x13.mat'),'DCM');

% SPECIFICATION DCM 10- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_220_9x14.mat'),'DCM');

% SPECIFICATION DCM 10- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_221_9x15.mat'),'DCM');

% SPECIFICATION DCM 10- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1;

save(fullfile(data_path,'DCM_model_222_9x16.mat'),'DCM');

% SPECIFICATION DCM 10 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_223_9x17.mat'),'DCM');

% SPECIFICATION DCM 10 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_224_9x18.mat'),'DCM');

% SPECIFICATION DCM 10 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_225_9x19.mat'),'DCM');

% SPECIFICATION DCM 10 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_226_9x20.mat'),'DCM');

% SPECIFICATION DCM 10 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_227_9x21.mat'),'DCM');

% SPECIFICATION DCM 10 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_228_9x22.mat'),'DCM');

% SPECIFICATION DCM 10 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_229_9x23.mat'),'DCM');

% SPECIFICATION DCM 10 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_230_9x24.mat'),'DCM'); 

% SPECIFICATION DCM 11 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_231_10x1.mat'),'DCM');

% SPECIFICATION DCM 11 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_232_10x2.mat'),'DCM');

% SPECIFICATION DCM 11 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_233_10x3.mat'),'DCM');

% SPECIFICATION DCM 11 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 
save(fullfile(data_path,'DCM_model_234_10x4.mat'),'DCM');

% SPECIFICATION DCM 11 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_235_10x5.mat'),'DCM');

% SPECIFICATION DCM 11 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_236_10x6.mat'),'DCM');

% SPECIFICATION DCM 11- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_237_10x7.mat'),'DCM');

% SPECIFICATION DCM 11- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_238_10x8.mat'),'DCM');

% SPECIFICATION DCM 11- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_239_10x9.mat'),'DCM');

% SPECIFICATION DCM 11- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_240_10x11.mat'),'DCM');

% SPECIFICATION DCM 11- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_241_10x12.mat'),'DCM');

% SPECIFICATION DCM 11- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_242_10x13.mat'),'DCM');

% SPECIFICATION DCM 11- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_243_10x14.mat'),'DCM');

% SPECIFICATION DCM 11- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_244_10x15.mat'),'DCM');

% SPECIFICATION DCM 11- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1;

save(fullfile(data_path,'DCM_model_245_10x16.mat'),'DCM');

% SPECIFICATION DCM 11 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_246_10x17.mat'),'DCM');

% SPECIFICATION DCM 11 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_247_10x18.mat'),'DCM');

% SPECIFICATION DCM 11 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_249_10x19.mat'),'DCM');

% SPECIFICATION DCM 11 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_250_10x20.mat'),'DCM');

% SPECIFICATION DCM 11 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_251_10x21.mat'),'DCM');

% SPECIFICATION DCM 11 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_252_10x22.mat'),'DCM');

% SPECIFICATION DCM 11 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_253_10x23.mat'),'DCM');

% SPECIFICATION DCM 11 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_254_10x24.mat'),'DCM'); 

% SPECIFICATION DCM 12 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_255_11x1.mat'),'DCM');

% SPECIFICATION DCM 12 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_256_11x2.mat'),'DCM');

% SPECIFICATION DCM 12 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_257_11x3.mat'),'DCM');

% SPECIFICATION DCM 12 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 
save(fullfile(data_path,'DCM_model_258_11x4.mat'),'DCM');

% SPECIFICATION DCM 12 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_259_11x5.mat'),'DCM');

% SPECIFICATION DCM 12 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_260_11x6.mat'),'DCM');

% SPECIFICATION DCM 12- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_261_11x7.mat'),'DCM');

% SPECIFICATION DCM 12- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_262_11x8.mat'),'DCM');

% SPECIFICATION DCM 12- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_263_11x9.mat'),'DCM');

% SPECIFICATION DCM 12- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_264_11x10.mat'),'DCM');

% SPECIFICATION DCM 12- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_265_11x12.mat'),'DCM');

% SPECIFICATION DCM 12- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_266_11x13.mat'),'DCM');

% SPECIFICATION DCM 12- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_267_11x14.mat'),'DCM');

% SPECIFICATION DCM 12- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_268_11x15.mat'),'DCM');

% SPECIFICATION DCM 12- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1;

save(fullfile(data_path,'DCM_model_269_11x16.mat'),'DCM');

% SPECIFICATION DCM 12 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_270_11x17.mat'),'DCM');

% SPECIFICATION DCM 12 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_271_11x18.mat'),'DCM');

% SPECIFICATION DCM 12 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_272_11x19.mat'),'DCM');

% SPECIFICATION DCM 12 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_273_11x20.mat'),'DCM');

% SPECIFICATION DCM 12 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_274_11x21.mat'),'DCM');

% SPECIFICATION DCM 12 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_275_11x22.mat'),'DCM');

% SPECIFICATION DCM 12 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_276_11x23.mat'),'DCM');

% SPECIFICATION DCM 12 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_277_11x24.mat'),'DCM'); 

% SPECIFICATION DCM 13 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_278_12x1.mat'),'DCM');

% SPECIFICATION DCM 13 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_279_12x2.mat'),'DCM');

% SPECIFICATION DCM 13 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_280_12x3.mat'),'DCM');

% SPECIFICATION DCM 13 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 
save(fullfile(data_path,'DCM_model_281_12x4.mat'),'DCM');

% SPECIFICATION DCM 13 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_282_12x5.mat'),'DCM');

% SPECIFICATION DCM 13 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_283_12x6.mat'),'DCM');

% SPECIFICATION DCM 13- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_284_12x7.mat'),'DCM');

% SPECIFICATION DCM 13- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_285_12x8.mat'),'DCM');

% SPECIFICATION DCM 13- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_286_12x9.mat'),'DCM');

% SPECIFICATION DCM 13- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_287_12x10.mat'),'DCM');

% SPECIFICATION DCM 13- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_288_12x11.mat'),'DCM');

% SPECIFICATION DCM 13- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_289_12x13.mat'),'DCM');

% SPECIFICATION DCM 13- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_290_12x14.mat'),'DCM');

% SPECIFICATION DCM 13- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_291_12x15.mat'),'DCM');

% SPECIFICATION DCM 13- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1;

save(fullfile(data_path,'DCM_model_292_12x16.mat'),'DCM');

% SPECIFICATION DCM 13 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_293_12x17.mat'),'DCM');

% SPECIFICATION DCM 13 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_294_12x18.mat'),'DCM');

% SPECIFICATION DCM 13 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_295_12x19.mat'),'DCM');

% SPECIFICATION DCM 13 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_296_12x20.mat'),'DCM');

% SPECIFICATION DCM 13 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_297_12x21.mat'),'DCM');

% SPECIFICATION DCM 13 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_298_12x22.mat'),'DCM');

% SPECIFICATION DCM 13 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_299_12x23.mat'),'DCM');

% SPECIFICATION DCM 13 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_300_12x24.mat'),'DCM'); 

% SPECIFICATION DCM 14 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_301_13x1.mat'),'DCM');

% SPECIFICATION DCM 14 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_302_13x2.mat'),'DCM');

% SPECIFICATION DCM 14 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_303_13x3.mat'),'DCM');

% SPECIFICATION DCM 14 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 
save(fullfile(data_path,'DCM_model_304_13x4.mat'),'DCM');

% SPECIFICATION DCM 14 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_305_13x5.mat'),'DCM');

% SPECIFICATION DCM 14- "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_306_13x6.mat'),'DCM');

% SPECIFICATION DCM 14- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_307_13x7.mat'),'DCM');

% SPECIFICATION DCM 14- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_308_13x8.mat'),'DCM');

% SPECIFICATION DCM 14- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_309_13x9.mat'),'DCM');

% SPECIFICATION DCM 14- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_310_13x10.mat'),'DCM');

% SPECIFICATION DCM 14- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_311_13x11.mat'),'DCM');

% SPECIFICATION DCM 14- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_312_13x12.mat'),'DCM');

% SPECIFICATION DCM 14- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_313_13x14.mat'),'DCM');

% SPECIFICATION DCM 14- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_314_13x15.mat'),'DCM');

% SPECIFICATION DCM 14- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1;

save(fullfile(data_path,'DCM_model_315_13x16.mat'),'DCM');

% SPECIFICATION DCM 14 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_316_13x17.mat'),'DCM');

% SPECIFICATION DCM 14 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_317_13x18.mat'),'DCM');

% SPECIFICATION DCM 14 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_318_13x19.mat'),'DCM');

% SPECIFICATION DCM 14 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_319_13x20.mat'),'DCM');

% SPECIFICATION DCM 14 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_320_13x21.mat'),'DCM');

% SPECIFICATION DCM 14 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_321_13x22.mat'),'DCM');

% SPECIFICATION DCM 14 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_322_13x23.mat'),'DCM');

% SPECIFICATION DCM 14 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_323_13x24.mat'),'DCM');

% SPECIFICATION DCM 15 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_324_14x1.mat'),'DCM');

% SPECIFICATION DCM 15 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_325_14x2.mat'),'DCM');

% SPECIFICATION DCM 15 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_326_14x3.mat'),'DCM');

% SPECIFICATION DCM 15 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 
save(fullfile(data_path,'DCM_model_327_14x4.mat'),'DCM');

% SPECIFICATION DCM 15 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_328_14x5.mat'),'DCM');

% SPECIFICATION DCM 15 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_329_14x6.mat'),'DCM');

% SPECIFICATION DCM 15- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_330_14x7.mat'),'DCM');

% SPECIFICATION DCM 15- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_331_14x8.mat'),'DCM');

% SPECIFICATION DCM 15- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_332_14x9.mat'),'DCM');

% SPECIFICATION DCM 15- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_334_14x10.mat'),'DCM');

% SPECIFICATION DCM 15- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_335_14x11.mat'),'DCM');

% SPECIFICATION DCM 15- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_336_14x12.mat'),'DCM');

% SPECIFICATION DCM 15- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_337_14x13.mat'),'DCM');

% SPECIFICATION DCM 15- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_338_14x15.mat'),'DCM');

% SPECIFICATION DCM 15- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1;

save(fullfile(data_path,'DCM_model_339_14x16.mat'),'DCM');

% SPECIFICATION DCM 15 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_340_14x17.mat'),'DCM');

% SPECIFICATION DCM 15 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_341_14x18.mat'),'DCM');

% SPECIFICATION DCM 15 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_342_14x19.mat'),'DCM');

% SPECIFICATION DCM 15 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_343_14x20.mat'),'DCM');

% SPECIFICATION DCM 15 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_344_14x21.mat'),'DCM');

% SPECIFICATION DCM 15 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_345_14x22.mat'),'DCM');

% SPECIFICATION DCM 15 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_346_14x23.mat'),'DCM');

% SPECIFICATION DCM 15 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_347_14x24.mat'),'DCM');

% SPECIFICATION DCM 16 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_348_15x1.mat'),'DCM');

% SPECIFICATION DCM 16 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_349_15x2.mat'),'DCM');

% SPECIFICATION DCM 16 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_350_15x3.mat'),'DCM');

% SPECIFICATION DCM 16 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 
save(fullfile(data_path,'DCM_model_351_15x4.mat'),'DCM');

% SPECIFICATION DCM 16 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_352_15x5.mat'),'DCM');

% SPECIFICATION DCM 16 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_353_15x6.mat'),'DCM');

% SPECIFICATION DCM 16- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_354_15x7.mat'),'DCM');

% SPECIFICATION DCM 16- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_355_15x8.mat'),'DCM');

% SPECIFICATION DCM 16- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_356_15x9.mat'),'DCM');

% SPECIFICATION DCM 16- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_357_15x10.mat'),'DCM');

% SPECIFICATION DCM 16- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_358_15x11.mat'),'DCM');

% SPECIFICATION DCM 16- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_359_15x12.mat'),'DCM');

% SPECIFICATION DCM 16- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_360_15x13.mat'),'DCM');

% SPECIFICATION DCM 16- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_361_15x14.mat'),'DCM');

% SPECIFICATION DCM 16- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1;

save(fullfile(data_path,'DCM_model_362_15x16.mat'),'DCM');

% SPECIFICATION DCM 16 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_363_15x17.mat'),'DCM');

% SPECIFICATION DCM 16 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_364_15x18.mat'),'DCM');

% SPECIFICATION DCM 16 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_365_15x19.mat'),'DCM');

% SPECIFICATION DCM 16 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_366_15x20.mat'),'DCM');

% SPECIFICATION DCM 16 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_367_15x21.mat'),'DCM');

% SPECIFICATION DCM 16 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_368_15x22.mat'),'DCM');

% SPECIFICATION DCM 16 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_369_15x23.mat'),'DCM');

% SPECIFICATION DCM 16 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_370_15x24.mat'),'DCM');

% SPECIFICATION DCM 17 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5);   DCM.b(2,1,4)= 1; DCM.b(1,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_371_16x1.mat'),'DCM');

% SPECIFICATION DCM 17 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5);   DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_372_16x2.mat'),'DCM');

% SPECIFICATION DCM 17 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5);   DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_373_16x3.mat'),'DCM');

% SPECIFICATION DCM 17 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5);   DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 
save(fullfile(data_path,'DCM_model_374_16x4.mat'),'DCM');

% SPECIFICATION DCM 17 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5);   DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_375_16x5.mat'),'DCM');

% SPECIFICATION DCM 17 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_376_16x6.mat'),'DCM');

% SPECIFICATION DCM 17- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5);  DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_377_16x7.mat'),'DCM');

% SPECIFICATION DCM 17- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5);  DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_378_16x8.mat'),'DCM');

% SPECIFICATION DCM 17- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_379_16x9.mat'),'DCM');

% SPECIFICATION DCM 17- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5);  DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_380_16x10.mat'),'DCM');

% SPECIFICATION DCM 17- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5);  DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_381_16x11.mat'),'DCM');

% SPECIFICATION DCM 17- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5);  DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_382_16x12.mat'),'DCM');

% SPECIFICATION DCM 17- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5);  DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_383_16x13.mat'),'DCM');

% SPECIFICATION DCM 17- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5);  DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_384_16x14.mat'),'DCM');

% SPECIFICATION DCM 17- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_385_16x15.mat'),'DCM');

% SPECIFICATION DCM 17 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_386_16x17.mat'),'DCM');

% SPECIFICATION DCM 17 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_387_16x18.mat'),'DCM');

% SPECIFICATION DCM 17 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_388_16x19.mat'),'DCM');

% SPECIFICATION DCM 17 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_389_16x20.mat'),'DCM');

% SPECIFICATION DCM 17 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_390_16x21.mat'),'DCM');

% SPECIFICATION DCM 17 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_391_16x22.mat'),'DCM');

% SPECIFICATION DCM 17 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_392_16x23.mat'),'DCM');

% SPECIFICATION DCM 17 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_393_16x24.mat'),'DCM');

% SPECIFICATION DCM 18 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5);  DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_394_17x1.mat'),'DCM');

% SPECIFICATION DCM 18 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5);  DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_395_17x2.mat'),'DCM');

% SPECIFICATION DCM 18 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1;  DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_396_17x3.mat'),'DCM');

% SPECIFICATION DCM 18 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1;  DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 
save(fullfile(data_path,'DCM_model_397_17x4.mat'),'DCM');

% SPECIFICATION DCM 18 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1;  DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_398_17x5.mat'),'DCM');

% SPECIFICATION DCM 18 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_399_17x6.mat'),'DCM');

% SPECIFICATION DCM 18- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_400_17x7.mat'),'DCM');

% SPECIFICATION DCM 18- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_401_17x8.mat'),'DCM');

% SPECIFICATION DCM 18- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_402_17x9.mat'),'DCM');

% SPECIFICATION DCM 18- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_403_17x10.mat'),'DCM');

% SPECIFICATION DCM 18- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_404_17x11.mat'),'DCM');

% SPECIFICATION DCM 18- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_405_17x12.mat'),'DCM');

% SPECIFICATION DCM 18- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_406_17x13.mat'),'DCM');

% SPECIFICATION DCM 18- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_407_17x14.mat'),'DCM');

% SPECIFICATION DCM 18- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_408_17x15.mat'),'DCM');

%SPECIFICATION DCM 18- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1;

save(fullfile(data_path,'DCM_model_409_17x16.mat'),'DCM');

% SPECIFICATION DCM 18 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_410_17x18.mat'),'DCM');

% SPECIFICATION DCM 18 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_411_17x19.mat'),'DCM');

% SPECIFICATION DCM 18 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_412_17x20.mat'),'DCM');

% SPECIFICATION DCM 18 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_413_17x21.mat'),'DCM');

% SPECIFICATION DCM 18 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_414_17x22.mat'),'DCM');

% SPECIFICATION DCM 18 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_415_17x23.mat'),'DCM');

% SPECIFICATION DCM 18 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(3,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_416_17x24.mat'),'DCM');

% SPECIFICATION DCM 19 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_417_18x1.mat'),'DCM');

% SPECIFICATION DCM 18 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_418_18x2.mat'),'DCM');

% SPECIFICATION DCM 19 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1;  DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_419_18x3.mat'),'DCM');

% SPECIFICATION DCM 19 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1;  DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_420_18x4.mat'),'DCM');

% SPECIFICATION DCM 19 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1;  DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_421_18x5.mat'),'DCM');

% SPECIFICATION DCM 19 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_422_18x6.mat'),'DCM');

% SPECIFICATION DCM 19- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_423_18x7.mat'),'DCM');

% SPECIFICATION DCM 19- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_424_18x8.mat'),'DCM');

% SPECIFICATION DCM 19- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_425_18x9.mat'),'DCM');

% SPECIFICATION DCM 19- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_426_18x10.mat'),'DCM');

% SPECIFICATION DCM 19- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_427_18x11.mat'),'DCM');

% SPECIFICATION DCM 19- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_428_18x12.mat'),'DCM');

% SPECIFICATION DCM 19- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_429_18x13.mat'),'DCM');

% SPECIFICATION DCM 19- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_430_18x14.mat'),'DCM');

% SPECIFICATION DCM 19- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_431_18x15.mat'),'DCM');

% SPECIFICATION DCM 19- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1;

save(fullfile(data_path,'DCM_model_432_18x16.mat'),'DCM');

% SPECIFICATION DCM 19 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_433_18x17.mat'),'DCM');

% SPECIFICATION DCM 19 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_434_18x19.mat'),'DCM');

% SPECIFICATION DCM 19 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_435_18x20.mat'),'DCM');

% SPECIFICATION DCM 19 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_436_18x21.mat'),'DCM');

% SPECIFICATION DCM 19 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_437_18x22.mat'),'DCM');

% SPECIFICATION DCM 19 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_438_18x23.mat'),'DCM');

% SPECIFICATION DCM 19 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_439_18x24.mat'),'DCM');

% SPECIFICATION DCM 20 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_440_19x1.mat'),'DCM');

% SPECIFICATION DCM 20 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_441_19x2.mat'),'DCM');

% SPECIFICATION DCM 20 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1;  DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_442_19x3.mat'),'DCM');

% SPECIFICATION DCM 20 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1;  DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_443_19x4.mat'),'DCM');

% SPECIFICATION DCM 20 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1;  DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_444_19x5.mat'),'DCM');

% SPECIFICATION DCM 20 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_445_19x6.mat'),'DCM');

% SPECIFICATION DCM 20- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_446_19x7.mat'),'DCM');

% SPECIFICATION DCM 20- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_447_19x8.mat'),'DCM');

% SPECIFICATION DCM 20- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_448_19x9.mat'),'DCM');

% SPECIFICATION DCM 20- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_449_19x10.mat'),'DCM');

% SPECIFICATION DCM 20- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_450_19x11.mat'),'DCM');

% SPECIFICATION DCM 20- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_451_19x12.mat'),'DCM');

% SPECIFICATION DCM 20- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_452_19x13.mat'),'DCM');

% SPECIFICATION DCM 20- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_453_19x14.mat'),'DCM');

% SPECIFICATION DCM 20- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_454_19x15.mat'),'DCM');

% SPECIFICATION DCM 20- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1;

save(fullfile(data_path,'DCM_model_455_19x16.mat'),'DCM');

% SPECIFICATION DCM 20 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_456_19x17.mat'),'DCM');

% SPECIFICATION DCM 20 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_457_19x18.mat'),'DCM');

% SPECIFICATION DCM 20 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_458_19x20.mat'),'DCM');

% SPECIFICATION DCM 20 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_459_19x21.mat'),'DCM');

% SPECIFICATION DCM 20 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_460_19x22.mat'),'DCM');

% SPECIFICATION DCM 20 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_461_19x23.mat'),'DCM');

% SPECIFICATION DCM 20 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_462_19x24.mat'),'DCM');

% SPECIFICATION DCM 21 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_463_20x1.mat'),'DCM');

% SPECIFICATION DCM 21 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_464_20x2.mat'),'DCM');

% SPECIFICATION DCM 21 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1;  DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_465_20x3.mat'),'DCM');

% SPECIFICATION DCM 21 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1;  DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_466_20x4.mat'),'DCM');

% SPECIFICATION DCM 21 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1;  DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_467_20x5.mat'),'DCM');

% SPECIFICATION DCM 21 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_468_20x6.mat'),'DCM');

% SPECIFICATION DCM 21- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_469_20x7.mat'),'DCM');

% SPECIFICATION DCM 21- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_470_20x8.mat'),'DCM');

% SPECIFICATION DCM 21- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_471_20x9.mat'),'DCM');

% SPECIFICATION DCM 21- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_472_20x10.mat'),'DCM');

% SPECIFICATION DCM 21- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_473_20x11.mat'),'DCM');

% SPECIFICATION DCM 21- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_474_20x12.mat'),'DCM');

% SPECIFICATION DCM 21- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_475_20x13.mat'),'DCM');

% SPECIFICATION DCM 21- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_476_20x14.mat'),'DCM');

% SPECIFICATION DCM 21- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_477_20x15.mat'),'DCM');

% SPECIFICATION DCM 21- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1;

save(fullfile(data_path,'DCM_model_478_20x16.mat'),'DCM');

% SPECIFICATION DCM 21 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_479_20x17.mat'),'DCM');

% SPECIFICATION DCM 21 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_480_20x18.mat'),'DCM');

% SPECIFICATION DCM 21 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_481_20x19.mat'),'DCM');

% SPECIFICATION DCM 21 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1;; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_482_20x21.mat'),'DCM');

% SPECIFICATION DCM 21 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_483_20x22.mat'),'DCM');

% SPECIFICATION DCM 21 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_484_20x23.mat'),'DCM');

% SPECIFICATION DCM 21 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_485_20x24.mat'),'DCM');

% SPECIFICATION DCM 22 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_486_21x1.mat'),'DCM');

% SPECIFICATION DCM 22 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_487_21x2.mat'),'DCM');

% SPECIFICATION DCM 22 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1;  DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_488_21x3.mat'),'DCM');

% SPECIFICATION DCM 22 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1;  DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_489_21x4.mat'),'DCM');

% SPECIFICATION DCM 22 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1;  DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_490_21x5.mat'),'DCM');

% SPECIFICATION DCM 22 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_491_21x6.mat'),'DCM');

% SPECIFICATION DCM 22- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_492_21x7.mat'),'DCM');

% SPECIFICATION DCM 22- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_493_21x8.mat'),'DCM');

% SPECIFICATION DCM 22- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_494_21x9.mat'),'DCM');

% SPECIFICATION DCM 22- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_495_21x10.mat'),'DCM');

% SPECIFICATION DCM 22- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_496_21x11.mat'),'DCM');

% SPECIFICATION DCM 22- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_497_21x12.mat'),'DCM');

% SPECIFICATION DCM 22- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_498_21x13.mat'),'DCM');

% SPECIFICATION DCM 22- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_499_21x14.mat'),'DCM');

% SPECIFICATION DCM 22- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_500_21x15.mat'),'DCM');

% SPECIFICATION DCM 22- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1;

save(fullfile(data_path,'DCM_model_501_21x16.mat'),'DCM');

% SPECIFICATION DCM 22 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_502_21x17.mat'),'DCM');

% SPECIFICATION DCM 22 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_503_21x18.mat'),'DCM');

% SPECIFICATION DCM 22 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_504_21x19.mat'),'DCM');

% SPECIFICATION DCM 22 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_505_21x20.mat'),'DCM');

% SPECIFICATION DCM 22 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_506_21x22.mat'),'DCM');

% SPECIFICATION DCM 22 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_507_21x23.mat'),'DCM');

% SPECIFICATION DCM 22 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_508_21x24.mat'),'DCM');

% SPECIFICATION DCM 23 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_509_22x1.mat'),'DCM');

% SPECIFICATION DCM 23 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_510_22x2.mat'),'DCM');

% SPECIFICATION DCM 23 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_511_22x3.mat'),'DCM');

% SPECIFICATION DCM 23 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_512_22x4.mat'),'DCM');

% SPECIFICATION DCM 23 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_513_22x5.mat'),'DCM');

% SPECIFICATION DCM 23 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_514_22x6.mat'),'DCM');

% SPECIFICATION DCM 23- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_515_22x7.mat'),'DCM');

% SPECIFICATION DCM 23- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_516_22x8.mat'),'DCM');

% SPECIFICATION DCM 23- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_517_22x9.mat'),'DCM');

% SPECIFICATION DCM 23- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_518_22x10.mat'),'DCM');

% SPECIFICATION DCM 23- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_519_22x11.mat'),'DCM');

% SPECIFICATION DCM 23- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_520_22x12.mat'),'DCM');

% SPECIFICATION DCM 23- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_521_22x13.mat'),'DCM');

% SPECIFICATION DCM 23- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_522_22x14.mat'),'DCM');

% SPECIFICATION DCM 23- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_523_22x15.mat'),'DCM');

% SPECIFICATION DCM 23- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1;

save(fullfile(data_path,'DCM_model_524_22x16.mat'),'DCM');

% SPECIFICATION DCM 23 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DDCM.b(2,3,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_525_22x17.mat'),'DCM');

% SPECIFICATION DCM 23 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_526_22x18.mat'),'DCM');

% SPECIFICATION DCM 23 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_527_22x19.mat'),'DCM');

% SPECIFICATION DCM 23 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_528_22x20.mat'),'DCM');

% SPECIFICATION DCM 23 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(2,3,4)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_529_22x21.mat'),'DCM');

% SPECIFICATION DCM 23 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_530_22x23.mat'),'DCM');

% SPECIFICATION DCM 23 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(2,3,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_531_22x24.mat'),'DCM');

% SPECIFICATION DCM 24 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_532_23x1.mat'),'DCM');

% SPECIFICATION DCM 24 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_533_23x2.mat'),'DCM');

% SPECIFICATION DCM 24 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_534_23x3.mat'),'DCM');

% SPECIFICATION DCM 24 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_535_23x4.mat'),'DCM');

% SPECIFICATION DCM 24 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_536_23x5.mat'),'DCM');

% SPECIFICATION DCM 24 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_537_23x6.mat'),'DCM');

% SPECIFICATION DCM 24- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_538_23x7.mat'),'DCM');

% SPECIFICATION DCM 24- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_539_23x8.mat'),'DCM');

% SPECIFICATION DCM 24- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_540_23x9.mat'),'DCM');

% SPECIFICATION DCM 24- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_541_23x10.mat'),'DCM');

% SPECIFICATION DCM 24- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_542_23x11.mat'),'DCM');

% SPECIFICATION DCM 24- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_543_23x12.mat'),'DCM');

% SPECIFICATION DCM 24- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_544_23x13.mat'),'DCM');

% SPECIFICATION DCM 24- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_545_23x14.mat'),'DCM');

% SPECIFICATION DCM 24- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_546_23x15.mat'),'DCM');

% SPECIFICATION DCM 24- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1;
save(fullfile(data_path,'DCM_model_547_23x16.mat'),'DCM');

% SPECIFICATION DCM 24 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_548_23x17.mat'),'DCM');

% SPECIFICATION DCM 24 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_549_23x18.mat'),'DCM');

% SPECIFICATION DCM 24 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_550_23x19.mat'),'DCM');

% SPECIFICATION DCM 24 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_551_23x20.mat'),'DCM');

% SPECIFICATION DCM 24 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,3,4)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_552_23x21.mat'),'DCM');

% SPECIFICATION DCM 24 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_553_23x22.mat'),'DCM');

% SPECIFICATION DCM 24 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_554_23x24.mat'),'DCM');

% SPECIFICATION DCM 25 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_555_24x1.mat'),'DCM');

% SPECIFICATION DCM 25 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_556_24x2.mat'),'DCM');

% SPECIFICATION DCM 25 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; 

save(fullfile(data_path,'DCM_model_557_24x3.mat'),'DCM');

% SPECIFICATION DCM 25 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; 

save(fullfile(data_path,'DCM_model_558_24x4.mat'),'DCM');

% SPECIFICATION DCM 25 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_559_24x5.mat'),'DCM');

% SPECIFICATION DCM 25 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_560_24x6.mat'),'DCM');

% SPECIFICATION DCM 25- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_561_24x7.mat'),'DCM');

% SPECIFICATION DCM 25- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_562_24x8.mat'),'DCM');

% SPECIFICATION DCM 25- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_563_24x9.mat'),'DCM');

% SPECIFICATION DCM 25- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_564_24x10.mat'),'DCM');

% SPECIFICATION DCM 25- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_565_24x11.mat'),'DCM');

% SPECIFICATION DCM 25- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_566_24x12.mat'),'DCM');

% SPECIFICATION DCM 25- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5);DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_567_24x13.mat'),'DCM');

% SPECIFICATION DCM 25- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1;

save(fullfile(data_path,'DCM_model_568_24x14.mat'),'DCM');

% SPECIFICATION DCM 25- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;

save(fullfile(data_path,'DCM_model_569_24x15.mat'),'DCM');

% SPECIFICATION DCM 25- "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1;
save(fullfile(data_path,'DCM_model_570_24x16.mat'),'DCM');

% SPECIFICATION DCM 25 - "1x1"
%-------------------------------------------------------------------------
DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(3,1,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1;DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_571_24x17.mat'),'DCM');

% SPECIFICATION DCM 25 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_572_24x18.mat'),'DCM');

% SPECIFICATION DCM 25 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1;

save(fullfile(data_path,'DCM_model_573_24x19.mat'),'DCM');

% SPECIFICATION DCM 25 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(3,2,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,1,4)= 1;

save(fullfile(data_path,'DCM_model_574_24x20.mat'),'DCM');

% SPECIFICATION DCM 25 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,3,4)= 1; DCM.b(2,1,4)= 1; DCM.b(1,2,4)= 1; DCM.b(3,1,4)= 1; DCM.b(1,3,4)= 1;

save(fullfile(data_path,'DCM_model_575_24x21.mat'),'DCM');

% SPECIFICATION DCM 25 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(2,3,4)= 1;

save(fullfile(data_path,'DCM_model_576_24x22.mat'),'DCM');

% SPECIFICATION DCM 25 - "2x2"
%--------------------------------------------------------------------------

DCM.b = zeros(3,3,5); DCM.b(1,3,2)= 1; DCM.b(2,3,2)= 1; DCM.b(1,2,2)= 1; DCM.b(2,1,2)= 1; DCM.b(1,3,4)= 1; DCM.b(2,3,4)= 1; DCM.b(1,2,4)= 1; DCM.b(2,1,4)= 1; DCM.b(3,2,4)= 1;


save(fullfile(data_path,'DCM_model_577_24x23.mat'),'DCM');
end
