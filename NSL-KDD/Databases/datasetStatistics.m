%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: CS595 - Final Project
% Purpose: Prepare Datasets to be Trained and Tested and Extract Parameters
% Authors: Anna Baron Garcia, Noemi Miguelez Gomez
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Load dataset that will be used to train (table format, not labeled)
load('KDD_TrainSet.mat')
data = trainKDD;
clear trainKDD;

%Get size of the dataset
[dRows,dCols] = size(data);
instances = dRows;

%Give variable names to the table for easy access
%For KDD:
if (dCols == 42)
    %For KDD:
    data.Properties.VariableNames = {'duration', 'protocol_type', 'service', 'flag', 'src_bytes', 'dst_bytes', 'land', 'wrong_fragment', 'urgent', 'hot', 'num_failed_logins', 'logged_in', 'num_compromised', 'root_shell', 'su_attempted', 'num_root', 'num_file_creations', 'num_shells', 'num_access_files', 'num_outbound_cmds','is_host_login', 'is_guest_login', 'count', 'srv_count', 'serror_rate', 'srv_serror_rate', 'rerror_rate', 'srv_rerror_rate', 'same_srv_rate', 'diff_srv_rate', 'srv_diff_host_rate', 'dst_host_count', 'dst_host_srv_count', 'dst_host_same_srv_rate', 'dst_host_diff_srv_rate', 'dst_host_same_src_port_rate', 'dst_host_srv_diff_host_rate', 'dst_host_serror_rate','dst_host_srv_serror_rate', 'dst_host_rerror_rate', 'dst_host_srv_rerror_rate', 'attackType'};
else
    %For NSL:
    data.Properties.VariableNames = {'duration', 'protocol_type', 'service', 'flag', 'src_bytes', 'dst_bytes', 'land', 'wrong_fragment', 'urgent', 'hot', 'num_failed_logins', 'logged_in', 'num_compromised', 'root_shell', 'su_attempted', 'num_root', 'num_file_creations', 'num_shells', 'num_access_files', 'num_outbound_cmds','is_host_login', 'is_guest_login', 'count', 'srv_count', 'serror_rate', 'srv_serror_rate', 'rerror_rate', 'srv_rerror_rate', 'same_srv_rate', 'diff_srv_rate', 'srv_diff_host_rate', 'dst_host_count', 'dst_host_srv_count', 'dst_host_same_srv_rate', 'dst_host_diff_srv_rate', 'dst_host_same_src_port_rate', 'dst_host_srv_diff_host_rate', 'dst_host_serror_rate','dst_host_srv_serror_rate', 'dst_host_rerror_rate', 'dst_host_srv_rerror_rate', 'attackType', 'attackDifficulty'};
end


%Prepare table for statistics and classification
attackTypes = ["back", "buffer_overflow", "ftp_write", "guess_passwd", "imap", "ipsweep","land","loadmodule","multihop","neptune","nmap","perl","phf","pod","portsweep","rootkit","satan","smurf","spy","teardrop","warezclient","warezmaster","normal","unknown"];

%Add extra column for binary histogram/classification: normal(0), attack(1).
aux = zeros(dRows,1);
data = [data table(aux, 'VariableNames', {'binaryAttack'})];

for i=1:dRows
    if(data.attackType(i)=='normal')
        data.binaryAttack(i) = 0;
    else
        data.binaryAttack(i) = 1;
    end
end

%Percentages of normal/attack data
auxNormal = length(find(data.binaryAttack==0));
percentNormal = 100*auxNormal/dRows;
percentAttack = 100-percentNormal;


%Add extra column for multiclass classification of attacks.
aux = zeros(dRows,1);
data = [data table(aux, 'VariableNames', {'multiAttack'})];
%Classes of attack: "NORMAL" (0), "DOS" (1), "U2R" (2), "R2L" (3), "PROBE"(4) 
%and "UNKNOWN"(5) for NSL Test Dataset
for i=1:dRows
    if(data.attackType(i)=='normal')
        data.multiAttack(i) = 0;
    elseif((data.attackType(i)=='back')||(data.attackType(i)=='land')||(data.attackType(i)=='neptune')||(data.attackType(i)=='pod')||(data.attackType(i)=='smurf')||(data.attackType(i)=='teardrop'))
        data.multiAttack(i) = 1;
    elseif((data.attackType(i)=='buffer_overflow')||(data.attackType(i)=='loadmodule')||(data.attackType(i)=='perl')||(data.attackType(i)=='rootkit'))
        data.multiAttack(i) = 2;
    elseif((data.attackType(i)=='ftp_write')||(data.attackType(i)=='guess_passwd')||(data.attackType(i)=='imap')||(data.attackType(i)=='multihop')||(data.attackType(i)=='phf')||(data.attackType(i)=='spy')||(data.attackType(i)=='warezclient')||(data.attackType(i)=='warezmaster'))
        data.multiAttack(i) = 3;
    elseif((data.attackType(i)=='ipsweep')||(data.attackType(i)=='nmap')||(data.attackType(i)=='portsweep')||(data.attackType(i)=='satan'))
        data.multiAttack(i) = 4;
	else
		data.multiAttack(i) = 5;
    end
end


%Percentages of normal and each attack main category
auxNormal = length(find(data.multiAttack==0));
percentNormal = 100*auxNormal/dRows;

auxDOS = length(find(data.multiAttack==1));
percentDOS = 100*auxDOS/dRows;

auxU2R = length(find(data.multiAttack==2));
percentU2R = 100*auxU2R/dRows;

auxR2L = length(find(data.multiAttack==3));
percentR2L = 100*auxR2L/dRows;

auxPROBE = length(find(data.multiAttack==4));
percentPROBE = 100*auxPROBE/dRows;

auxUNKNOWN = length(find(data.multiAttack==5));
percentUNKNOWN = 100*auxUNKNOWN/dRows;


%Plot histogram of the attacks main categories
figure(1);
histogram(data.multiAttack)
yticklabels((yticks/dRows)*100)
ylabel('Percentage (%)');
xlabel('Attack Types');
title('Percentage of Attacks by Types');
if (auxUNKNOWN~=0)
    str = ['0 - Normal (',num2str(percentNormal), '%)', newline, '1 - DOS (',num2str(percentDOS),...
    '%)', newline, '2 - U2R (',num2str(percentU2R), '%)', newline, '3 - R2L (',num2str(percentR2L),...
    '%)', newline, '4 - PROBE (',num2str(percentPROBE), '%)', newline, '5 - Unknown (',num2str(percentUNKNOWN),'%)'];
else
    str = ['0 - Normal (',num2str(percentNormal), '%)', newline, '1 - DOS (',num2str(percentDOS),...
    '%)', newline, '2 - U2R (',num2str(percentU2R), '%)', newline, '3 - R2L (',num2str(percentR2L),...
    '%)', newline, '4 - PROBE (',num2str(percentPROBE), '%)'];
end
dim = [.62 .62 .3 .3];
annotation('textbox',dim,'String',str,'FitBoxToText','on');


%Percentages of specific types of attack considered
aux = length(find(data.attackType=='back'));
percentBACK = 100*aux/dRows;

aux = length(find(data.attackType=='land'));
percentLAND = 100*aux/dRows;

aux = length(find(data.attackType=='neptune'));
percentNEPTUNE = 100*aux/dRows;

aux = length(find(data.attackType=='pod'));
percentPOD = 100*aux/dRows;

aux = length(find(data.attackType=='smurf'));
percentSMURF = 100*aux/dRows;

aux = length(find(data.attackType=='teardrop'));
percentTEARDROP = 100*aux/dRows;

aux = length(find(data.attackType=='buffer_overflow'));
percentBUFFEROVERFLOW = 100*aux/dRows;

aux = length(find(data.attackType=='loadmodule'));
percentLOADMODULE = 100*aux/dRows;

aux = length(find(data.attackType=='perl'));
percentPERL = 100*aux/dRows;

aux = length(find(data.attackType=='rootkit'));
percentROOTKIT = 100*aux/dRows;

aux = length(find(data.attackType=='ftp_write'));
percentFTP = 100*aux/dRows;

aux = length(find(data.attackType=='guess_passwd'));
percentPSWD = 100*aux/dRows;

aux = length(find(data.attackType=='imap'));
percentIMAP = 100*aux/dRows;

aux = length(find(data.attackType=='multihop'));
percentMULTIHOP = 100*aux/dRows;

aux = length(find(data.attackType=='phf'));
percentPHF = 100*aux/dRows;

aux = length(find(data.attackType=='spy'));
percentSPY = 100*aux/dRows;

aux = length(find(data.attackType=='warezclient'));
percentWAREZCLIENT = 100*aux/dRows;

aux = length(find(data.attackType=='warezmaster'));
percentWAREZMASTER = 100*aux/dRows;

aux = length(find(data.attackType=='ipsweep'));
percentIPSWEEP = 100*aux/dRows;

aux = length(find(data.attackType=='nmap'));
percentNMAP = 100*aux/dRows;

aux = length(find(data.attackType=='portsweep'));
percentPORTSWEEP = 100*aux/dRows;

aux = length(find(data.attackType=='satan'));
percentSATAN = 100*aux/dRows;


disp('DATASET SHAPE')
str('Normal: ', num2str(percentNormal), newline, 'Attack: ', num2str(percentAttack), newline, newline, 'DOS: ', num2str(percentDOS), newline, 'U2R: ', num2str(percentU2R), newline, 'RL2: ', num2str(percentRL2), newline, 'PROBE: ', num2str(percentPROBE));
