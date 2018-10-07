clear all;
close all;
clc;

load('filt_wav.mat');

im = imread('cameraman.tif');

im = double(im);

hp = imfilter(im,a{2},'circular','conv');
hp = imfilter(hp,a{3}.','circular','conv');

imshow(real(hp),[]);