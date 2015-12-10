clear
%load('subject_data.mat');
p = mfilename('fullpath');
codeDirectory = fileparts(p);
addpath([codeDirectory '/data']);
%add subject 7
subject7 = xlsread('subject7.xlsx');

size1 = 0;
size2 = 0;
size3 = 0;
size4 = 0;
for i = 1:size(subject7,1)
    if subject7(i,5) == 1
        size1 = size1 + 1;
    elseif subject7(i,5) == 2
        size2 = size2 + 1;
    elseif subject7(i,5) == 3
        size3 = size3 + 1;
    else
        size4 = size4 + 1;
    end
end
subject7_action1 = zeros(size1,1);
subject7_action1_label = zeros(size1,1);
subject7_action1_xyz = zeros(size1,1);
subject7_action2 = zeros(size2,1);
subject7_action2_label = zeros(size2,1);
subject7_action2_xyz = zeros(size2,1);
subject7_action3 = zeros(size3,1);
subject7_action3_label = zeros(size3,1);
subject7_action3_xyz = zeros(size3,1);
subject7_action4 = zeros(size4,1);
subject7_action4_label = zeros(size4,1);
subject7_action4_xyz = zeros(size4,1);
size1 = 1;
size2 = 1;
size3 = 1;
size4 = 1;
%adjust action#
for i = 1:size(subject7,1)
    if subject7(i,5) == 1
        subject7_action1(size1,1:5) = subject7(i,1:5);
        subject7_action1_label(size1,1) = subject7(i,5);
        subject7_action1_xyz(size1,1:3) = subject7(i,2:4);
        size1 = size1 + 1;
    elseif subject7(i,5) == 2
        subject7_action2(size2,1:5) = subject7(i,1:5);
        subject7_action2_label(size2,1) = subject7(i,5);
        subject7_action2_xyz(size2,1:3) = subject7(i,2:4);
        size2 = size2 + 1;
    elseif subject7(i,5) == 3
        subject7_action3(size3,1:5) = subject7(i,1:5);
        subject7_action3_label(size3,1) = subject7(i,5);
        subject7_action3_xyz(size3,1:3) = subject7(i,2:4);
        size3 = size3 + 1;
    elseif subject7(i,5) == 4
        subject7_action4(size4,1:5) = subject7(i,1:5);
        subject7_action4_label(size4,1) = subject7(i,5);
        subject7_action4_xyz(size4,1:3) = subject7(i,2:4);
        size4 = size4 + 1;
    end
end

subject7_label = subject7(:,5);
subject7_time = subject7(:,1);
subject7_xyz = subject7(:,2:4);

load('subject_data.mat');
action1 = [action1;subject7_action1];
action1_xyz = [action1_xyz; subject7_action1_xyz];
action1_label = [action1_label; subject7_action1_label];
action2 = [action2;subject7_action2];
action2_xyz = [action2_xyz; subject7_action2_xyz];
action2_label = [action2_label; subject7_action2_label];
action3 = [action3;subject7_action3];
action3_xyz = [action3_xyz; subject7_action3_xyz];
action3_label = [action3_label; subject7_action3_label];
action4 = [action4;subject7_action4];
action4_xyz = [action4_xyz; subject7_action4_xyz];
action4_label = [action4_label; subject7_action4_label];

clear i j size1 size2 size3 size4 p codeDirectory;
save('subject_data2.mat');