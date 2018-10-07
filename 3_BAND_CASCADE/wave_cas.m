clear all;
close all;
clc;

load('filter2.mat');
x = a{1};

z = upsample(a{2},3);

for l = 1:3
    z = conv(a{2},z);
    z = upsample(z,3);
end

z = downsample(z,3);