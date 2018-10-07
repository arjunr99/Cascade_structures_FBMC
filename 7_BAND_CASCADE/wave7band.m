clear all;
close all;
clc;

fun = @solv7;
options = optimoptions('fsolve','Display','iter');
options.MaxFunEvals = 14400;
options.MaxIter = 2000;
options.TolFun = 1e-10;
%options.TolX = 1e-10;

v0 = [1.13197618565075,1.04554929077182,1.20867465535676,0.627669583307040,0.882518287007268,1.49044740599632,1.19266517219042,1.01145350681113,1.15691140403156,0.877628583661570,1.72349107466146,1.07081605973824,0.870080353804374,1.30924233901033,1.19270236389442,0.955531742395611,1.40152287559526,-0.0618318380661194,1.13080568277630,1.55434758369032,0.842218074997051,0.921954132644964,1.19625064894383,0.701767630705426,1.72079470568686,0.616190171943707,1.04953215898707,1.55039600881014,2.23359556893896,-0.705862751877647,0.648298196395164,1.13956769127792,0.996409070467632,0.324945652892897,0.770753531116723,-0.855870953599881,1.68939658871985,1.79402914909947,-0.0876586153686188,0.815890904525788,1.44374553063000,0.774247420983077,1.20658971568838,1.78457248227275,-0.867513961275775,0.300152415586243,1.42230282068396,0.604811001992156,0.166410325721187,1.00163515242881,0.740147247188061,1.72729549953473,1.12361014960233,0.0698381031301286,1.49555627738302,1.77171375637258,0.495321517788411,0.724000965366961,1.11234848462012,1.03279534119536,1.44181290637825,1.07942757257108,1.11613805605950,1.78692134730094,1.54199640887711,0.940284097481912,0.670467398540761,0.495487575702642,0.873142275415160,0.621717679784725, ones(1,140)];

v = fsolve(fun,v0,options);

d1 = lt_poly({1; [0, 1]; [0,0,1]; [0,0,0,1]; [0,0,0,0,1]; [0,0,0,0,0,1]; [0,0,0,0,0,0,1] },0);
H0 = 1/7*dftmtx(7);

Y =  H0 * cascade(v)* d1;

a = GetCoefs(Y);

plot(abs(fftshift(fft(a{1},1024))).^2)
figure;
plot(abs(fftshift(fft(a{2},1024))).^2)
figure;
plot(abs(fftshift(fft(a{3},1024))).^2)