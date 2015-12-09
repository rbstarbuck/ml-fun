% addpath('data/')
% 
% subject7 = xlsread('data/Subject7.xlsx');
% subject7 = subject7(:,1:end-1);
% 
% subject7_xyz = subject7(:,2:4);
% subject7_label = subject7(:,5);
% subject7_time = subject7(:,1);
% 
% subject7_action1 = subject7(subject7_label(:) == 1, :);
% subject7_action2 = subject7(subject7_label(:) == 2, :);
% subject7_action3 = subject7(subject7_label(:) == 3, :);
% subject7_action4 = subject7(subject7_label(:) == 4, :);
% 
% subject7_action1_xyz = subject7_action1(:,2:4);
% subject7_action2_xyz = subject7_action2(:,2:4);
% subject7_action3_xyz = subject7_action3(:,2:4);
% subject7_action4_xyz = subject7_action4(:,2:4);
% 
% subject7_action1_label = subject7_label(subject7_label(:) == 1, :);
% subject7_action2_label = subject7_label(subject7_label(:) == 2, :);
% subject7_action3_label = subject7_label(subject7_label(:) == 3, :);
% subject7_action4_label = subject7_label(subject7_label(:) == 4, :);
% 
% load('subject_data.mat')
% 
% action1 = [action1 ; subject7_action1];
% action2 = [action2 ; subject7_action2];
% action3 = [action3 ; subject7_action3];
% action4 = [action4 ; subject7_action4];
% 
% action1_xyz = [action1_xyz ; subject7_action1_xyz];
% action2_xyz = [action2_xyz ; subject7_action2_xyz];
% action3_xyz = [action3_xyz ; subject7_action3_xyz];
% action4_xyz = [action4_xyz ; subject7_action4_xyz];
% 
% action1_label = [action1_label ; subject7_action1_label];
% action2_label = [action2_label ; subject7_action2_label];
% action3_label = [action3_label ; subject7_action3_label];
% action4_label = [action4_label ; subject7_action4_label];

subject4 = subject7;
subject4_xyz = subject7_xyz;
subject4_label = subject7_label;
subject4_time = subject7_time;
subject4_action1 = subject7_action1;
subject4_action2 = subject7_action2;
subject4_action3 = subject7_action3;
subject4_action4 = subject7_action4;
subject4_action1_xyz = subject7_action1_xyz;
subject4_action2_xyz = subject7_action2_xyz;
subject4_action3_xyz = subject7_action3_xyz;
subject4_action4_xyz = subject7_action4_xyz;
subject4_action1_label = subject7_action1_label;
subject4_action2_label = subject7_action2_label;
subject4_action3_label = subject7_action3_label;
subject4_action4_label = subject7_action4_label;

action1 = [subject1_action1 ; subject2_action1 ; subject3_action1 ; subject4_action1 ; subject5_action1 ; subject6_action1];
action2 = [subject1_action2 ; subject2_action2 ; subject3_action2 ; subject4_action2 ; subject5_action2 ; subject6_action2];
action3 = [subject1_action3 ; subject2_action3 ; subject3_action3 ; subject4_action3 ; subject5_action3 ; subject6_action3];
action4 = [subject1_action4 ; subject2_action4 ; subject3_action4 ; subject4_action4 ; subject5_action4 ; subject6_action4];

action1_xyz = action1(:,2:4);
action2_xyz = action2(:,2:4);
action3_xyz = action3(:,2:4);
action4_xyz = action4(:,2:4);

action1_label = action1(:,5);
action2_label = action2(:,5);
action3_label = action3(:,5);
action4_label = action4(:,5);


