clear all;  
clc; 
close all

%% read the HSI data being processed

a = dir;   
filename_path = a.folder;     
filename_path = strcat(filename_path,'\');
name_HSI = 'Belcher';     
name_target = 'target';

filename = strcat(filename_path,name_HSI,'.mat');
filename_target = strcat(filename_path, name_target, '.mat');

load(filename);
load(filename_target);

X_cube = data;
clear('data');
X_cube = hyperNormalize(X_cube);   
[samples,lines,band_num]=size(X_cube);
pixel_num = samples * lines;

gt = map;
clear('map');

mask = squeeze(gt(:));   



%% Perform target detection with TD-PEPTE
r_TD_PEPTE = TD_PEPTE(X_cube, target); 

%% Illustrate detection results
figure;
subplot(121), imagesc(gt); axis image;   title('Ground Truth')     
subplot(122), imagesc(r_TD_PEPTE); axis image;   title('Detection map of TD-PEPTE')    

%% Evaluate detection results with ROC 

r_255 = squeeze(r_TD_PEPTE(:));
figure;
AUC = ROC(mask,r_255,'r')     


