clear all;
close all;
clc;

syms theta phi;

v = [cos(theta)*cos(phi) , cos(theta)*sin(phi), sin(theta)];
df = dftmtx(3);
t = df(:,2);

Y = [(eye(3) - (v.'*v))*t , (v.'*v)*t];