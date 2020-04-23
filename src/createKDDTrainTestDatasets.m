%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: CS595 - Final Project
% Purpose: KDD CUP 99 - Create train and test datasets
% Authors: Anna Baron Garcia, Noemi Miguelez Gomez
%
% Input:   -inputDataset: table with the dataset data to be reduced - used
%           to create test database (from KDD 99)
% Outputs: -trainKDD: table with the dataset prepared (labeled and extra
%                         columns for training)
%          -testKDD: table with the dataset prepared (labeled and extra
%                     columns for testing)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Load labeled KDD dataset (10% of total dataset)
inputDataset = 'KDDCUP10percent.mat';
load(inputDataset)

types = data(:,42);
types.Properties.VariableNames = {'type'};


%Obtain positions of attacks of each type
Dback = find(types.type == "back");
Dbuffer_overflow = find(types.type == "buffer_overflow");
Dftp_write = find(types.type == "ftp_write");
Dguess_passwd = find(types.type == "guess_passwd");
Dimap = find(types.type == "imap");
Dipsweep = find(types.type == "ipsweep");
Dland = find(types.type == "land");
Dloadmodule = find(types.type == "loadmodule");
Dmultihop = find(types.type == "multihop");
Dneptune = find(types.type == "neptune");
Dnmap = find(types.type == "nmap");
Dperl = find(types.type == "perl");
Dphf = find(types.type == "phf");
Dpod = find(types.type == "pod"); 
Dportsweep = find(types.type == "portsweep");
Drootkit = find(types.type == "rootkit");
Dsatan = find(types.type == "satan");
Dsmurf = find(types.type == "smurf");
Dspy = find(types.type == "spy");
Dteardrop = find(types.type == "teardrop");
Dwarezclient = find(types.type == "warezclient");
Dwarezmaster = find(types.type == "warezmaster");
Dnormal = find(types.type == "normal");


%Consider only 10% of total number of attacks of each type
%If the initial database contains less than 10 attacks of that type,
%consider 1 as 10%

Lback = max(fix(length(Dback)/10),1);
Lbuffer = max(fix(length(Dbuffer_overflow)/10),1);
Lftp = max(fix(length(Dftp_write)/10),1);
Lguess = max(fix(length(Dguess_passwd)/10),1);
Limap = max(fix(length(Dimap)/10),1);
Lipsweep = max(fix(length(Dipsweep)/10),1);
Lland = max(fix(length(Dland)/10),1);
Lloadmodule = max(fix(length(Dloadmodule)/10),1);
Lmultihop = max(fix(length(Dmultihop)/10),1);
Lneptune = max(fix(length(Dneptune)/10),1);
Lnmap = max(fix(length(Dnmap)/10),1);
Lperl = max(fix(length(Dperl)/10),1);
Lphf = max(fix(length(Dphf)/10),1);
Lpod = max(fix(length(Dpod)/10),1);
Lportsweep = max(fix(length(Dportsweep)/10),1);
Lrootkit = max(fix(length(Drootkit)/10),1);
Lsatan = max(fix(length(Dsatan)/10),1);
Lsmurf = max(fix(length(Dsmurf)/10),1);
Lspy = max(fix(length(Dspy)/10),1);
Lteardrop = max(fix(length(Dteardrop)/10),1);
Lwarezclient = max(fix(length(Dwarezclient)/10),1);
Lwarezmaster = max(fix(length(Dwarezmaster)/10),1);
Lnormal = max(fix(length(Dnormal)/10),1);

%Create new database with 10% of the number of attacks from initial
%database --> 1% from the original one
newKDD = data(Dback(1:Lback),:);
newKDD = [newKDD; data(Dbuffer_overflow(1:Lbuffer),:)];
newKDD = [newKDD; data(Dftp_write(1:Lftp),:)];
newKDD = [newKDD; data(Dguess_passwd(1:Lguess),:)];
newKDD = [newKDD; data(Dimap(1:Limap),:)];
newKDD = [newKDD; data(Dipsweep(1:Lipsweep),:)];
newKDD = [newKDD; data(Dland(1:Lland),:)];
newKDD = [newKDD; data(Dloadmodule(1:Lloadmodule),:)];
newKDD = [newKDD; data(Dmultihop(1:Lmultihop),:)];
newKDD = [newKDD; data(Dneptune(1:Lneptune),:)];
newKDD = [newKDD; data(Dnmap(1:Lnmap),:)];
newKDD = [newKDD; data(Dnormal(1:Lnormal),:)];
newKDD = [newKDD; data(Dperl(1:Lperl),:)];
newKDD = [newKDD; data(Dphf(1:Lphf),:)];
newKDD = [newKDD; data(Dpod(1:Lpod),:)];
newKDD = [newKDD; data(Dportsweep(1:Lportsweep),:)];
newKDD = [newKDD; data(Drootkit(1:Lrootkit),:)];
newKDD = [newKDD; data(Dsatan(1:Lsatan),:)];
newKDD = [newKDD; data(Dsmurf(1:Lsmurf),:)];
newKDD = [newKDD; data(Dspy(1:Lspy),:)];
newKDD = [newKDD; data(Dteardrop(1:Lteardrop),:)];
newKDD = [newKDD; data(Dwarezclient(1:Lwarezclient),:)];
trainKDD = [newKDD; data(Dwarezmaster(1:Lwarezmaster),:)];


%Create Test Database - Different Rows from Train Dataset
%Same Train/Test Percentage used for NSL KDD Case: Test =~ 32% Train
% Test Database: Approximately 15800 samples/rows.
%All of them for all types with less than 300 samples/rows)
%Specific rows for Neptune, Normal and Smurf (too many samples/rows).
%Neptune + Smurf + Normal = 7922 samples/rows
%Neptune = 1500
%Smurf = 1500
%Normal = 4922
newKDD = data(Dback(Lback+1:end),:);
newKDD = [newKDD; data(Dbuffer_overflow(Lbuffer+1:end),:)];
newKDD = [newKDD; data(Dftp_write(Lftp+1:end),:)];
newKDD = [newKDD; data(Dguess_passwd(Lguess+1:end),:)];
newKDD = [newKDD; data(Dimap(Limap+1:end),:)];
newKDD = [newKDD; data(Dipsweep(Lipsweep+1:end),:)];
newKDD = [newKDD; data(Dland(Lland+1:end),:)];
newKDD = [newKDD; data(Dloadmodule(Lloadmodule+1:end),:)];
newKDD = [newKDD; data(Dmultihop(Lmultihop+1:end),:)];
newKDD = [newKDD; data(Dneptune(Lneptune+1:Lneptune+1500),:)];
newKDD = [newKDD; data(Dnmap(Lnmap+1:end),:)];
newKDD = [newKDD; data(Dnormal(Lnormal+1:Lnormal+4922),:)];
newKDD = [newKDD; data(Dperl(Lperl+1:end),:)];
newKDD = [newKDD; data(Dphf(Lphf+1:end),:)];
newKDD = [newKDD; data(Dpod(Lpod+1:end),:)];
newKDD = [newKDD; data(Dportsweep(Lportsweep+1:end),:)];
newKDD = [newKDD; data(Drootkit(Lrootkit+1:end),:)];
newKDD = [newKDD; data(Dsatan(Lsatan+1:end),:)];
newKDD = [newKDD; data(Dsmurf(Lsmurf+1:Lsmurf+1500),:)];
newKDD = [newKDD; data(Dspy(Lspy+1:end),:)];
newKDD = [newKDD; data(Dteardrop(Lteardrop+1:end),:)];
newKDD = [newKDD; data(Dwarezclient(Lwarezclient+1:end),:)];
testKDD = [newKDD; data(Dwarezmaster(Lwarezmaster+1:end),:)];
