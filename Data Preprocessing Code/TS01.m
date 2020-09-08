clear;clc;
filename='data02.csv';
% filename='data.csv';
rdData = csvread(filename);
th = 6; % training hours
ph = 6; % predicting hours
ah = th+ph; % all hours
TotalSample = 1000;
TrainSample = 700;
ValSample = 150;
TestSample = 150;
test=[];
for i=1:TotalSample
    for j1=1:ah
    test(i,j1)= rdData(i+j1-1,2);
    end
    for j2=1:ah
    test(i,j2+j1)= rdData(i+j2-1,3);
    end
    for j3=1:ah
    test(i,j3+j2+j1)= rdData(i+j3-1,4);
    end
end

Train = test(1:TrainSample,:);
A= Train (1:TrainSample,1:th);
a= Train (1:TrainSample,(th+1):ah);
B= Train (1:TrainSample,(ah+1):(th+ah));
b=Train (1:TrainSample,(th+ah+1):(2*ah));
C=Train (1:TrainSample,(2*ah+1):(th+2*ah));
c=Train (1:TrainSample,(th+2*ah+1):(3*ah));
X_train = [A,B,C];
y_train = [a,b,c];

Vali = test ((TrainSample+1):(TrainSample+ValSample),:);
D= Vali (1:ValSample,1:th);
d= Vali (1:ValSample,(th+1):ah);
E= Vali (1:ValSample,(ah+1):(th+ah));
e=Vali (1:ValSample,(th+ah+1):(2*ah));
F=Vali (1:ValSample,(2*ah+1):(th+2*ah));
f=Vali (1:ValSample,(th+2*ah+1):(3*ah));
X_vali = [D,E,F];
y_vali = [d,e,f];

Test = test ((TrainSample+ValSample+1):1000,:);
G= Test (1:TestSample,1:th);
g= Test (1:TestSample,(th+1):ah);
H= Test (1:TestSample,(ah+1):(th+ah));
h=Test (1:TestSample,(th+ah+1):(2*ah));
I=Test (1:TestSample,(2*ah+1):(th+2*ah));
i=Test (1:TestSample,(th+2*ah+1):(3*ah));
X_test = [G,H,I];
y_test = [g,h,i];

csvwrite('X_train_6_02.csv',X_train)
csvwrite('y_train_6_02.csv',y_train)
csvwrite('X_vali_6_02.csv',X_vali)
csvwrite('y_vali_6_02.csv',y_vali)
csvwrite('X_test_6_02.csv',X_test)
csvwrite('y_test_6_02.csv',y_test)
% csvwrite('X_train_6.csv',X_train)
% csvwrite('y_train_6.csv',y_train)
% csvwrite('X_vali_6.csv',X_vali)
% csvwrite('y_vali_6.csv',y_vali)
% csvwrite('X_test_6.csv',X_test)
% csvwrite('y_test_6.csv',y_test)