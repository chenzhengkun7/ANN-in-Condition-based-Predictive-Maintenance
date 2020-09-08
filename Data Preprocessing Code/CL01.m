clear;clc;

% a = 0.71;
% b = 1.8;
% c = 4.5;
a = 2.8;
b = 45;

filename1='X_train_6_02.csv';
filename2='X_vali_6_02.csv';
filename3='X_test_6_02.csv';
X_train = csvread(filename1);
X_vali = csvread(filename2);
X_test = csvread(filename3);

% the value in good zone
% a*rand(6,420);
% the value in satisfactory zone
% (b-a)*rand(6,420)+a;
% the value in unsatisfactory zone
% (c-b)*rand(6,50)+b;

% Class one: 400 samples
A = [X_train(1:60,1:6), X_train(1:60,7:12),  (b-a)*rand(60,6)+a;
    X_train(61:120,1:6), (b-a)*rand(60,6)+a, X_train(1:60,13:18);
    (b-a)*rand(60,6)+a, X_train(61:120,7:12), X_train(61:120,13:18);
    (b-a)*rand(60,6)+a, (b-a)*rand(60,6)+a, X_train(121:180,13:18);
    X_train(121:180,1:6), (b-a)*rand(60,6)+a, (b-a)*rand(60,6)+a;
    (b-a)*rand(60,6)+a, X_train(121:180,7:12), (b-a)*rand(60,6)+a;
    (b-a)*rand(60,6)+a, (b-a)*rand(60,6)+a, (b-a)*rand(60,6)+a];
B = ones(400,1);
S = [A(1:400,:) B];

% Class two: 600 samples
C = [X_train(181:700,:);
    X_vali(1:80,:)];
D = zeros(600,1);
U = [C D];

All = [S;U];

csvwrite('classify_data.csv',All)
% r_range = [min(x_s) max(x_s)]

