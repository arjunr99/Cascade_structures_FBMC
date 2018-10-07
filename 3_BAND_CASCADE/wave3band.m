clear;
close all;
clc;

fun = @solv_more_ep;
options = optimoptions('fsolve','Display','iter');
options.MaxFunEvals = 576;
options.MaxIter = 6000;
options.TolFun = 1e-10;
%options.TolX = 1e-10;

%v0 = [1.73465936597708,0.181448828023417,0.654119682056185,-0.971038393674224,1.03592934992983,0.253716294166021,-0.538517573137732,-1.39029419697852,-1.20673012197272,-1.33079130412211,-2.84314923602352,-1.34368104877075,1.15937898273989,0.801990334038978,1.20644387144870,-0.937597585984961,-1.10659369159752,1.10713200291273, 1,1,1,1,1,1,1,1,1,1,1,1,1,1, ones(1,33)];

v0 = [1.47627169744832,0.367588941027087,1.09047515928810,-0.759307018193766,1.23928470616093,-0.0930401213640072,-0.788191216724546,-1.43535443653447,-1.01470753280648,-1.82227028181089,-2.22069249331236,-1.85334711579339,1.03703875831515,0.753448617147886,1.34551884082948,-0.921977643174892,-0.964117907466752,1.25040100585627,-0.261150547610909,1.48042492977048,0.894679106201794,1.59360613842802,0.212891817033653,0.683777662064929,0.863372415561000,1.15111143586967,0.981690371734854,1.04508454004645,0.951562695508625,1.01404024825555,0.936590257547732,1.11808351374343,0.945947897860404,1.04190035745486,0.927630909737498,1.03625355967688,0.938057141446118,1.14804936043974,0.904665668743843,1.03030322572509,0.891315499290751,1.07584783402755,0.958210266902910,1.18099763953238,0.837426477420127,0.986546795641227,0.855737236317971,1.14546636557162,1.02304427016505,1.19810026901774,0.730374576372230,0.862670842274792,0.841404060452317,1.25180989239799,1.18383086394981,1.14372910437021,0.549772018547156,0.515798769179142,0.875179427737922,1.42368427122922,1.52207605072374,0.843084191755646,-0.210122301924412,0.999999999999998,1];

%v0 = randn(1,12);
v = fsolve(fun,v0,options);

D = lt_poly({1 ; 1 ; [0 0 0 1]} ,0);
D = diag(D);
d1 = lt_poly({1; [0, 1]; [0,0,1]},0);

H0 = 1/3*dftmtx(3);

Y =  H0 * cascade(v)* d1;

a = GetCoefs(Y);

plot(abs(fftshift(fft(a{1},1024))).^2)
figure;
plot(abs(fftshift(fft(a{2},1024))).^2)
figure;
plot(abs(fftshift(fft(a{3},1024))).^2)